FROM python:3.9-slim
ENV PYTHONDONTWRITECODE 1
ENV PYTHONBUFFERED 1
RUN mkdir /webapp
WORKDIR /webapp
RUN pip install --upgrade pip
COPY requirements.txt /webapp/

RUN python -m pip install awscli
RUN python -m pip install boto3
RUN pip install -r requirements.txt
RUN pip list
COPY webapp /webapp/
EXPOSE 80

CMD ["python", "./webapp/manage.py", "runserver", "0.0.0.0:8000"]