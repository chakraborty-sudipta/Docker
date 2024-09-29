# Use Ubuntu as the base image
FROM ubuntu:latest

# Update the package list and install required packages
RUN apt-get update && apt-get install -y python3 python3-pip python3-venv

# Create a virtual environment
RUN python3 -m venv /opt/venv

# Activate the virtual environment and install Flask and MySQL Connector
RUN /opt/venv/bin/pip install flask mysql-connector-python

# Copy your application code to the container
COPY . /opt/source-code

# Set the working directory
WORKDIR /opt/source-code

# Set the Flask app environment variable
ENV FLASK_APP=app.py

# Activate the virtual environment
ENV PATH="/opt/venv/bin:$PATH"

# Expose the port for Flask to run on
EXPOSE 5000

# Start the Flask application
ENTRYPOINT ["flask", "run", "--host=0.0.0.0"]

