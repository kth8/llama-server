[llama.cpp server](https://github.com/ggerganov/llama.cpp/tree/master/examples/server) and small language model bundled together for easy deployment similar to a [llamafile](https://github.com/Mozilla-Ocho/llamafile). Uses CPU for inference. Requires CPU with AVX2 support from Intel Haswell/AMD Excavator or later generations. Override server settings with environment variables.
```
docker run -d --name llama1b --init -p 8080:8080/tcp ghcr.io/kth8/llama-server:llama-3.2-1b-instruct
```
Verify if the server is running:
```
curl -N -H "Content-Type: application/json" -d '{"messages":[{"role":"user","content":"Why is the sky blue?"}]}' http://127.0.0.1:8080/v1/chat/completions
```
Check if your CPU supports AVX2 on Linux:
```
grep -o 'avx2' /proc/cpuinfo
```
See [docker-compose.yml](./docker-compose.yml) for list of models. All model GGUF files provided by [bartowski](https://huggingface.co/bartowski).
