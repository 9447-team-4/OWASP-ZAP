FROM python:3

COPY . /app

RUN pip install -r /app/requirements.txt

RUN cp /app/*.py /bin/ && cp /app/entrypoint.sh /bin/

ENTRYPOINT [ "entrypoint.sh" ]