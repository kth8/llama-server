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

<!-- TAGS_START -->
```
ghcr.io/kth8/llama-server:llama-3.2-1b-instruct

ghcr.io/kth8/llama-server:llama-3.2-3b-instruct

ghcr.io/kth8/llama-server:smollm2-1.7b-instruct

ghcr.io/kth8/llama-server:amd-olmo-1b-sft-dpo

ghcr.io/kth8/llama-server:qwen2.5-coder-0.5b-instruct

ghcr.io/kth8/llama-server:qwen2.5.1-coder-1.5b-instruct

ghcr.io/kth8/llama-server:qwen2.5-coder-3b-instruct

ghcr.io/kth8/llama-server:hermes-3-llama-3.2-3b

ghcr.io/kth8/llama-server:granite-3.1-1b-a400m-instruct

ghcr.io/kth8/llama-server:granite-3.1-3b-a800m-instruct

ghcr.io/kth8/llama-server:fastllama-3.2-1b-instruct

ghcr.io/kth8/llama-server:deepseek-r1-distill-qwen-1.5b

ghcr.io/kth8/llama-server:deepseek-r1-redistill-qwen-1.5b-v1.0

ghcr.io/kth8/llama-server:nvidia_aceinstruct-1.5b

ghcr.io/kth8/llama-server:agentica-org_deepscaler-1.5b-preview

ghcr.io/kth8/llama-server:microsoft_phi-4-mini-instruct

ghcr.io/kth8/llama-server:google_gemma-3-1b-it

ghcr.io/kth8/llama-server:all-hands_openhands-lm-1.5b-v0.1

ghcr.io/kth8/llama-server:google_gemma-3-4b-it

ghcr.io/kth8/llama-server:deepcogito_cogito-v1-preview-llama-3b

ghcr.io/kth8/llama-server:zyphra_zr1-1.5b

ghcr.io/kth8/llama-server:agentica-org_deepcoder-1.5b-preview

ghcr.io/kth8/llama-server:ibm-granite_granite-3.3-2b-instruct

ghcr.io/kth8/llama-server:qwen_qwen3-0.6b

ghcr.io/kth8/llama-server:qwen_qwen3-1.7b

ghcr.io/kth8/llama-server:qwen_qwen3-4b

ghcr.io/kth8/llama-server:microsoft_phi-4-mini-reasoning

```

<!-- TAGS_END -->

All model GGUF files provided by [bartowski](https://huggingface.co/bartowski).
