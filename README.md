[llama.cpp server](https://github.com/ggerganov/llama.cpp/tree/master/examples/server) and small language model bundled together inside a [Docker](https://www.docker.com) image for easy deployment similar to a [llamafile](https://github.com/Mozilla-Ocho/llamafile). Uses CPU for inference. Requires CPU with AVX2 support from Intel Haswell/AMD Excavator or later generations. Override server settings with environment variables.
```
docker run -d --name llama1b --init -p 8001:8080/tcp ghcr.io/kth8/llama-server:llama-3.2-1b-instruct
```
Verify if the server is running by going to http://127.0.0.1:8001 in your web browser or using the terminal:
```
curl http://127.0.0.1:8001/v1/chat/completions -H "Content-Type: application/json" -d '{"messages":[{"role":"user","content":"Hello"}]}'
```
Check if your CPU supports AVX2 on Linux:
```
grep -o 'avx2' /proc/cpuinfo
```
Available tags:
```
ghcr.io/kth8/llama-server:amd-olmo-1b-sft-dpo
ghcr.io/kth8/llama-server:gemma-2-2b-it
ghcr.io/kth8/llama-server:granite-3.0-1b-a400m-instruct
ghcr.io/kth8/llama-server:granite-3.0-2b-instruct
ghcr.io/kth8/llama-server:granite-3.0-3b-a800m-instruct
ghcr.io/kth8/llama-server:llama-3.2-1b-instruct
ghcr.io/kth8/llama-server:llama-3.2-3b-instruct
ghcr.io/kth8/llama-server:nemotron-mini-4b-instruct
ghcr.io/kth8/llama-server:olmoe-1b-7b-0924-instruct
ghcr.io/kth8/llama-server:phi-3.5-mini-instruct
ghcr.io/kth8/llama-server:qwen2.5-0.5b-instruct
ghcr.io/kth8/llama-server:qwen2.5-1.5b-instruct
ghcr.io/kth8/llama-server:qwen2.5.1-coder-1.5b-instruct
ghcr.io/kth8/llama-server:qwen2.5-3b-instruct
ghcr.io/kth8/llama-server:qwen2.5-coder-0.5b-instruct
ghcr.io/kth8/llama-server:qwen2.5-coder-3b-instruct
ghcr.io/kth8/llama-server:qwen2.5-math-1.5b-instruct
ghcr.io/kth8/llama-server:smollm2-135m-instruct
ghcr.io/kth8/llama-server:smollm2-1.7b-instruct
ghcr.io/kth8/llama-server:smollm2-360m-instruct
ghcr.io/kth8/llama-server:yi-coder-1.5b
ghcr.io/kth8/llama-server:yi-coder-1.5b-chat
```
All model GGUF files provided by [bartowski](https://huggingface.co/bartowski).
