FROM python:3.8.10-alpine

# Set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1
ENV PYTHONUNBUFFERED 1

RUN apk update && apk add --no-cache \
    # Required for installing/upgrading postgres, Pillow, etc:
    gcc python3-dev \
    # Required for installing/upgrading postgres:
    postgresql-libs postgresql-dev musl-dev


# Set work directory
RUN mkdir /code
WORKDIR /code


# RUN pip3 install --upgrade pip
RUN pip3 install django
COPY . /code/

