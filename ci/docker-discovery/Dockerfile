FROM fedora:latest

RUN dnf install -y python python-pip

WORKDIR /app

COPY app/* /app/

RUN pip install --upgrade pip && pip install -r requirements.txt

CMD ["python", "main.py"]
