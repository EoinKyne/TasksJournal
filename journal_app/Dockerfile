FROM python:3.11-slim

WORKDIR /app/

COPY journal_app/requirements.txt .

RUN pip install --no-cache-dir -r requirements.txt

COPY . .

WORKDIR /app/journal_app

RUN python manage.py collectstatic --noinput

EXPOSE 8000

CMD ["gunicorn", "journal.wsgi:application", "--bind", "0.0.0.0:8000"]

