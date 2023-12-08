# Use an official Python runtime as a parent image
FROM python:3.11-slim-buster

# Set the working directory in the container to /app
WORKDIR /app

# Install git
RUN apt-get update && \
    apt-get upgrade -y

# Install Poetry
RUN pip install poetry

# Copy the current directory contents into the container at /app
COPY . /app

# Install dependencies using poetry
# The --no-root option is used to avoid installing the package (defined in pyproject.toml) itself
# The --no-interaction option is used to avoid interactive prompts
RUN poetry install --no-root --no-interaction

# Expose port 7001 for the application
EXPOSE 7001

# Run main.py when the container launches
CMD ["poetry", "run", "python3", "main.py"]