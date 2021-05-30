FROM python:3
ENV PYTHONUNBUFFERED 1

WORKDIR /archit

COPY requirements.txt requirements.txt
RUN pip3 install -r requirements.txt
EXPOSE 8080

COPY . .

CMD ["sh","-c","sh ./execute.sh"]