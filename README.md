### Documentation for Dockerized LangFlow UI

This document provides detailed instructions for setting up and running a Dockerized LangFlow UI. By containerizing LangFlow, users can avoid installation issues and easily run the application.

#### Table of Contents
1. [Project Overview](#project-overview)
2. [Prerequisites](#prerequisites)
3. [Setup Instructions](#setup-instructions)
4. [Directory Structure](#directory-structure)
5. [Dockerfile](#dockerfile)
6. [Steps Taken](#steps-taken)
7. [Running the Application](#running-the-application)

### Project Overview

This project aims to create a Dockerized version of LangFlow UI, allowing users to easily start the LangFlow application without dealing with installation complexities. The application can be accessed through a web browser at `http://localhost:8501`.

### Prerequisites

- Docker installed on your machine
- Basic knowledge of Docker and Python

### Setup Instructions

1. **Clone the repository**
    ```sh
    git clone <repository-url>
    cd <repository-directory>
    ```

2. **Create a virtual environment**
    ```sh
    python3 -m venv langflow
    source langflow/bin/activate  # On Windows, use `venv\Scripts\activate`
    ```

3. **Install dependencies**
    - Create a `requirements.txt` file with necessary dependencies.
    ```plaintext
    langflow
    ```

4. **Write the Dockerfile**: The `Dockerfile` is provided below.

### Directory Structure

```
project-directory/
│
├── Dockerfile
└── requirements.txt
```

### Dockerfile

Below is the complete `Dockerfile` for Dockerizing the LangFlow UI:

```Dockerfile
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
```

### Steps Taken

1. **Created a Python virtual environment**
    - Set up a virtual environment to manage dependencies.
    ```sh
    python3 -m venv langflow
    source langflow/bin/activate
    ```

2. **Installed LangFlow**
    - Installed LangFlow and other dependencies specified in `requirements.txt`.
    ```plaintext
    langflow
    ```

3. **Wrote Dockerfile**
    - Created a Dockerfile to containerize the LangFlow UI application.

4. **Built the Docker container**
    - Used Docker CLI to build the Docker image.
    ```sh
    docker build -t langflow-ui .
    ```

5. **Ran the Docker container**
    - Ran the container and verified that the LangFlow UI was accessible via `http://localhost:8501`.
    ```sh
    docker run -p 8501:8501 langflow-ui
    ```

### Running the Application

1. **Build the Docker image**
    ```sh
    docker build -t langflow-ui .
    ```

2. **Run the Docker container**
    ```sh
    docker run -p 8501:8501 langflow-ui
    ```

3. **Access the LangFlow UI**
    - Open your web browser and navigate to `http://localhost:8501` to access the LangFlow UI.

By following this documentation, you should be able to set up, run, and access the LangFlow UI in a Docker container. If you encounter any issues or have questions, feel free to reach out for help.
