# Use a lightweight Python base image
FROM python:3.9-slim
 
# Set the working directory inside the container
WORKDIR /app
 
# Copy all files from the local directory to the container's working directory
COPY . /app
 
# Disable pip progress bar to avoid threading issues
ENV PIP_NO_PROGRESS_BAR=off
 
# Upgrade pip to the latest version to ensure compatibility
RUN pip install --upgrade pip
 
# Install the Python dependencies
RUN pip install --no-cache-dir -r requirements.txt
 
# Expose port 5000 for the Flask app
EXPOSE 5000
 
# Set the entry point to run the Flask application using Gunicorn
CMD ["gunicorn", "-b", "0.0.0.0:5000", "app:app"]