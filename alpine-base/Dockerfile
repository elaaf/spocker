FROM alpine:latest

LABEL maintainer="Elaaf Shuja <elaaf.shuja@gmail.com>"

# Install requirements (Java8, Python, utils:nohup)
RUN apk add --no-cache openjdk8-jre python3 bash coreutils procps

# Set JAVA_HOME
ENV JAVA_HOME=/usr

# Entry Point
ENTRYPOINT ["/bin/bash"]