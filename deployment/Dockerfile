FROM python:3.12.2-slim

RUN apt-get update \
 && apt-get install --no-install-recommends -y \
    ansible \
 && apt-get clean \
 && rm -rf /var/lib/apt/lists/*

RUN mkdir -p /opt/ansible/
WORKDIR /opt/ansible/

COPY . .

CMD ["./deploy.sh"]
