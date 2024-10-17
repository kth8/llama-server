FROM ghcr.io/ggerganov/llama.cpp:server AS server

FROM cgr.dev/chainguard/wolfi-base

ARG MODEL

RUN apk add --no-cache libcurl4 libstdc++ libgomp

COPY --from=server /llama-server /usr/bin/llama-server

ADD https://huggingface.co/bartowski/${MODEL}-GGUF/resolve/main/${MODEL}-Q4_K_M.gguf /

ENV LLAMA_ARG_N_PARALLEL=3
ENV LLAMA_ARG_CTX_SIZE=2048
ENV LLAMA_ARG_HOST=0.0.0.0
ENV LLAMA_ARG_PORT=8080
ENV LLAMA_ARG_MODEL=${MODEL}-Q4_K_M.gguf

EXPOSE 8080

CMD ["llama-server"]
