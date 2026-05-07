FROM debian:12

RUN apt-get update && apt install -y redis

CMD ["redis-server", "--bind", "0.0.0.0", "--port", "6379", "--protected-mode", "no"]
