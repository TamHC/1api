FROM python:3.11-slim AS builder
WORKDIR /app
COPY requirements.txt .
RUN pip install -r requirements.txt -i https://mirrors.aliyun.com/pypi/simple/

FROM python:3.11-slim
WORKDIR /app
COPY --from=builder /usr/local/lib/python3.11/site-packages /usr/local/lib/python3.11/site-packages
COPY ./app .
EXPOSE 8000
ENV PYTHONUNBUFFERED=1
CMD ["python", "main.py"]