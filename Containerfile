FROM cgr.dev/chainguard/wolfi-base AS build

RUN apk add --no-cache build-base cmake git
RUN git clone --depth 1 https://github.com/ggerganov/llama.cpp.git

WORKDIR /llama.cpp

RUN cmake -B build
RUN cmake --build build --config Release --target llama-server

FROM cgr.dev/chainguard/wolfi-base

ARG MODEL
ARG QUANT

RUN apk add --no-cache libcurl4 libstdc++ libgomp

COPY --from=build /llama.cpp/build/src/libllama.so /
COPY --from=build /llama.cpp/build/ggml/src/libggml.so /
COPY --from=build /llama.cpp/build/ggml/src/ggml-cpu/libggml-cpu.so /
COPY --from=build /llama.cpp/build/ggml/src/ggml-amx/libggml-amx.so /
COPY --from=build /llama.cpp/build/ggml/src/libggml-base.so /
COPY --from=build /llama.cpp/build/bin/llama-server /

COPY ${MODEL}-${QUANT}.gguf /

ENV LLAMA_ARG_CTX_SIZE=4096
ENV LLAMA_ARG_N_PARALLEL=3
ENV LLAMA_ARG_HOST=0.0.0.0
ENV LLAMA_ARG_PORT=8080
ENV LLAMA_ARG_MODEL=${MODEL}-${QUANT}.gguf

EXPOSE 8080

ENTRYPOINT ["/llama-server"]
