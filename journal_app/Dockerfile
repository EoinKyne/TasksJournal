FROM python:3.11-slim

ARG VERSION=dev
LABEL version=$VERSION

WORKDIR /app/

RUN apt-get update && apt-get install -y postgresql-client  && rm -rf /var/lib/apt/lists/*

COPY journal_app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY journal_app/journal /app/journal_app/journal
COPY journal_app/tasks  /app/journal_app/tasks

WORKDIR /app/journal_app

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "journal.wsgi:application", "--bind", "0.0.0.0:8000"]

