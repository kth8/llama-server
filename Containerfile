FROM cgr.dev/chainguard/wolfi-base AS build

RUN apk add --no-cache build-base cmake git
RUN git clone --depth 1 https://github.com/ggerganov/llama.cpp.git

WORKDIR /llama.cpp

RUN cmake -B build
RUN cmake --build build --config Release --target llama-server

FROM cgr.dev/chainguard/wolfi-base

ARG MODEL

RUN apk add --no-cache libcurl4 libstdc++ libgomp

COPY --from=build /llama.cpp/build/bin/llama-server /llama-server
COPY --from=build /llama.cpp/build/src/libllama.so /libllama.so
COPY --from=build /llama.cpp/build/ggml/src/libggml.so /libggml.so

ADD https://huggingface.co/bartowski/${MODEL}-GGUF/resolve/main/${MODEL}-Q4_K_M.gguf /

ENV LLAMA_ARG_N_PARALLEL=3
ENV LLAMA_ARG_CTX_SIZE=2048
ENV LLAMA_ARG_HOST=0.0.0.0
ENV LLAMA_ARG_PORT=8080
ENV LLAMA_ARG_MODEL=${MODEL}-Q4_K_M.gguf

EXPOSE 8080

ENTRYPOINT ["/llama-server"]
