# Dockerfile
FROM python:3.8-slim

WORKDIR /app

# Copy your DBT project files
COPY . .

# Install dependencies
RUN pip install --no-cache-dir dbt-snowflake

# Set the entrypoint to run DBT commands
ENTRYPOINT ["dbt"]
