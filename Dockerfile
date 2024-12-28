FROM python:3.9-slim

# Install necessary dependencies
RUN pip install --upgrade pip
RUN pip install dbt-snowflake

# Set the working directory
WORKDIR /usr/app

# Copy the dbt project into the container
COPY . /usr/app/

# Set the entrypoint for the container
ENTRYPOINT ["dbt"]
CMD ["run"]
