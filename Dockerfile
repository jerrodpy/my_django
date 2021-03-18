FROM python:3

# set environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV LANG en_US.utf8

# set work directory
RUN mkdir app
#COPY . ./app
WORKDIR /app

# install dependencies
RUN pip install --upgrade pip
RUN pip install django
COPY ./app/requirements.txt .
RUN pip install -r requirements.txt
COPY . /app

EXPOSE 8000

CMD ["python", "manage.py", "runserver", "0.0.0.0:8000"]

