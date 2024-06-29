# Use an official Python runtime as a parent image
FROM python:3.9-slim

# Set the working directory in the container
WORKDIR /app

# Copy the current directory contents into the container at /app
COPY . /app

# Install any needed packages specified in requirements.txt
RUN pip install --no-cache-dir -r requirements.txt

# Install LangFlow and its dependencies
RUN pip install langflow

# Make port 8501 available to the world outside this container
EXPOSE 8501

# Define environment variable
ENV NAME langflow

# Run LangFlow when the container launches
CMD ["langflow", "run", "--host", "0.0.0.0", "--port", "8501"]
