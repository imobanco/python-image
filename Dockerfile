FROM python:3.8.3-slim-buster

# Set python environment variables
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1
ENV PIP_NO_CACHE_DIR 0
ENV PIP_DISABLE_PIP_VERSION_CHECK 1
WORKDIR /app

RUN apt-get update \
 && apt-get install --no-install-recommends --no-install-suggests -y \
    ca-certificates \
    git \
 && apt-get -y autoremove \
 && apt-get -y clean  \
 && rm -rf /var/lib/apt/lists/*

RUN groupadd --gid 5000 app_group \
 && useradd --no-log-init --uid 5000 --gid app_group app_user \
 && chown -R app_user /app/

