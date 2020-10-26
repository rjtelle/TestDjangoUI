# Dockerfile

# Pull base image
FROM python:3

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

# Set work directory
WORKDIR /code

# Install dependencies
COPY Pipfile Pipfile.lock /code/
RUN pip install pipenv && pipenv install --system

VOLUME [ "/code" ]

# Copy project
COPY . /code/

# Run Web Server
CMD python /code/manage.py runserver 0.0.0.0:8000

#EXPOSE 8000/tcp
#EXPOSE 8000/udp

