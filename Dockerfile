FROM python:3.6

RUN pip install -r requirements.txt

COPY . /opt/

EXPOSE 8080

WORKDIR /opt

ENTRYPOINT ["python", "app.py"]