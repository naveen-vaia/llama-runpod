FROM nvidia/cuda:11.8.0-cudnn8-runtime-ubuntu22.04

# Install essential packages
RUN apt-get update && apt-get install -y python3 python3-pip git && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Install Python dependencies
COPY requirements.txt /requirements.txt
RUN pip install --no-cache-dir -r /requirements.txt

# Copy entrypoint script
COPY start.sh /start.sh
RUN chmod +x /start.sh

# Expose the port for vLLM server
EXPOSE 8000

# Run the entrypoint script at startup
CMD ["/start.sh"]