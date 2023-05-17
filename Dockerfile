FROM python:3.9-slim
ENV PYTHONDONTWRITECODE 1
ENV PYTHONBUFFERED 1
RUN mkdir /webapp
WORKDIR /webapp
RUN pip install --upgrade pip
COPY requirements.txt /webapp/

COPY . .
RUN pip install -r requirements.txt
EXPOSE 5000
EXPOSE 8000

HEALTHCHECK CMD curl --fail http://localhost:8000
CMD ["python","/webapp/manage.py","--server.port=8000", "--server.address=0.0.0.0"]
