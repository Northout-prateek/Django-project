
FROM python:3.6

# The enviroment variable ensures that the python output is set straight
# to the terminal with out buffering it first
ENV PYTHONUNBUFFERED 1
# create root directory for our project in the container

# Set the working directory to /music_service
WORKDIR /usr/src/app

# Copy the current directory contents into the container at /music_service
COPY . /usr/src/app

# Install any needed packages specified in requirements.txt
RUN pip install -r requirements.txt
RUN python3.6 manage.py migrate
EXPOSE 8000
CMD ["python","manage.py","runserver","8000"]
