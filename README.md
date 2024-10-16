[llama.cpp server](https://github.com/ggerganov/llama.cpp/tree/master/examples/server) and small language model bundled together for easy deployment similar to a [Llamafile](https://github.com/Mozilla-Ocho/llamafile). Uses CPU for inference. Override server settings with environment variables.
 
```
docker run -d --restart always --name llama1b --init -p 8080:8080 ghcr.io/kth8/llama-server:llama-3.2-1b-instruct
```

See https://github.com/kth8/llama-server/pkgs/container/llama-server/versions for list of models. All GGUFs provided by [bartowski](https://huggingface.co/bartowski).
