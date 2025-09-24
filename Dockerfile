FROM ubuntu:22.04

ENV DEBIAN_FRONTEND=noninteractive

# Install base packages and set timezone
RUN apt-get update && \
    apt-get install -y tzdata tzdata-expect db && \
    ln -fs /usr/share/zoneinfo/Asia/Kathmandu /etc/localtime && \
    dpkg-reconfigure --frontend noninteractive tzdata && \
    apt-get clean

# Copy the startup script into the container
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Run the startup script
CMD ["/start.sh"]
