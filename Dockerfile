#Create image from base image - USE 3.11
FROM python:3.11

# Copy contents into image
COPY . .
 
# install pip dependencies from requirements file
RUN pip install -r requirements.txt

# Set environment variables
ENV PORT="8080"
 
# Expose correct port
# EXPOSE 8081

# Create an entrypoint - lbg.py
ENTRYPOINT python lbg.py --PORT ${PORT}