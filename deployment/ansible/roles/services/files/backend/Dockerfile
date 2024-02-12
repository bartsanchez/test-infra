FROM python:3.12.2-slim

RUN mkdir -p /app
WORKDIR /app

COPY requirements.txt .
RUN pip install -r requirements.txt --progress-bar off --no-cache-dir

COPY main.py .

RUN groupadd --system app_user && useradd -g app_user --system app_user && chown app_user /app -R
USER app_user

CMD ["gunicorn", "main:app", "--bind", "0.0.0.0"]
