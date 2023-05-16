FROM python:3.9-slim
ENV PYTHONDONTWRITECODE 1
ENV PYTHONBUFFERED 1
RUN mkdir /webapp
WORKDIR /webapp
RUN pip install --upgrade pip
COPY requirements.txt /webapp/

RUN pip install -r requirements.txt
COPY webapp /webapp/
EXPOSE 5000
EXPOSE 8000

HEALTHCHECK CMD curl --fail http://localhost:8000
CMD ["python","/webapp/manage.py","runserver","0.0.0.0:8000"]
