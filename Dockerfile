# Use the official Selenium Standalone Chrome image as the base image
FROM selenium/standalone-chrome

# Set the user to root for the subsequent installation commands
USER root

# Install pip - Python package manager, using the bootstrap script from the official source
RUN wget https://bootstrap.pypa.io/get-pip.py
RUN python3 get-pip.py

# Copy the requirements.txt file into the container at the root directory
COPY requirements.txt .

# Install the Python dependencies specified in requirements.txt
RUN python3 -m pip install -r requirements.txt

# Set the working directory inside the container to /app
WORKDIR /app

###### ericksc: skip
# Copy the contents of the current directory (where the Dockerfile is located) into /app in the container
#COPY . /app
####

# Here, it runs the main Python application
CMD ["python3", "main.py"]