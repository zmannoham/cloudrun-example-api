# Use Python 3.12-slim-bookworm as the base image
FROM python:3.12-slim-bookworm

# Set environment variables
ENV PORT=8080
ENV HOST=0.0.0.0

# Set working directory inside the container
WORKDIR /app

# Copy the requirements.txt file into the working directory
COPY requirements.txt /app

# Install the dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy the rest of the application into the working directory
COPY . /app

# Expose the port on which the application will run
EXPOSE ${PORT}

# Set the entrypoint command to run gunicorn
CMD gunicorn app:app -w 2 --threads 2 -b ${HOST}:${PORT}


