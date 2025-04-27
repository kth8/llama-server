FROM cgr.dev/chainguard/wolfi-base AS builder

RUN apk add --no-cache build-base cmake git posix-libc-utils curl-dev

RUN git clone --depth 1 https://github.com/ikawrakow/ik_llama.cpp.git llama.cpp

RUN cmake llama.cpp -B llama.cpp/build \
    -DGGML_CUDA=OFF \
    -DBUILD_SHARED_LIBS=OFF \
    -DLLAMA_CURL=ON \
    -DCMAKE_C_FLAGS="-march=sandybridge -mtune=generic -mno-avx -mno-avx2 -mno-bmi -mno-bmi2" \
    -DCMAKE_CXX_FLAGS="-march=sandybridge -mtune=generic -mno-avx -mno-avx2 -mno-bmi -mno-bmi2"

RUN cmake --build llama.cpp/build --config Release --target llama-server
RUN ldd llama.cpp/build/bin/llama-server

FROM cgr.dev/chainguard/wolfi-base

ARG MODEL
ARG QUANT

RUN apk add --no-cache libcurl4 libstdc++ libgomp

COPY --from=builder /llama.cpp/build/bin/llama-server .
COPY ${MODEL}-${QUANT}.gguf /${MODEL}-${QUANT}.gguf .

ENV LLAMA_ARG_CTX_SIZE=4096
ENV LLAMA_ARG_N_PARALLEL=3
ENV LLAMA_ARG_HOST=0.0.0.0
ENV LLAMA_ARG_PORT=8080
ENV LLAMA_ARG_MODEL=${MODEL}-${QUANT}.gguf

EXPOSE 8080
CMD ["/llama-server"]
