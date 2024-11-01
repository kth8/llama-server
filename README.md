[llama.cpp server](https://github.com/ggerganov/llama.cpp/tree/master/examples/server) and small language model bundled together for easy deployment similar to a [llamafile](https://github.com/Mozilla-Ocho/llamafile). Uses CPU for inference. Requires CPU with AVX2 support from Intel Haswell/AMD Excavator or later generations. Override server settings with environment variables.
```
docker run -d --name llama1b --init -p 8001:8080/tcp ghcr.io/kth8/llama-server:llama-3.2-1b-instruct
```
Verify if the server is running:
```
curl -N -H "Content-Type: application/json" -d '{"messages":[{"role":"user","content":"Why is the sky blue?"}]}' http://127.0.0.1:8001/v1/chat/completions
```
Check if your CPU supports AVX2 on Linux:
```
grep -o 'avx2' /proc/cpuinfo
```
Available tags:
```
gemma-2-2b-it
granite-3.0-1b-a400m-instruct
granite-3.0-2b-instruct
granite-3.0-3b-a800m-instruct
llama-3.2-1b-instruct
llama-3.2-3b-instruct
nemotron-mini-4b-instruct
olmoe-1b-7b-0924-instruct
phi-3.5-mini-instruct
qwen2.5-0.5b-instruct
qwen2.5-1.5b-instruct
qwen2.5-3b-instruct
qwen2.5-coder-1.5b-instruct
qwen2.5-math-1.5b-instruct
smollm2-135m-instruct
smollm2-1.7b-instruct
smollm2-360m-instruct
yi-coder-1.5b
yi-coder-1.5b-chat
```
All model GGUF files provided by [bartowski](https://huggingface.co/bartowski).
