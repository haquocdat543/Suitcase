# APACHE AIRFLOW

## Docker compose
```
version: '3'
services:
  postgres:
    image: postgres:13
    environment:
      POSTGRES_USER: airflow
      POSTGRES_PASSWORD: airflow
      POSTGRES_DB: airflow
    volumes:
      - postgres_data:/var/lib/postgresql/data

  redis:
    image: redis:latest

  airflow-webserver:
    image: apache/airflow:2.5.1
    container_name: airflow-webserver
    environment:
      - LOAD_EXAMPLES=False
      - AIRFLOW__CORE__EXECUTOR=LocalExecutor
    ports:
      - "8080:8080"
    depends_on:
      - postgres
      - redis
    volumes:
      - ./dags:/opt/airflow/dags
    restart: always

  airflow-scheduler:
    image: apache/airflow:2.5.1
    container_name: airflow-scheduler
    environment:
      - AIRFLOW__CORE__EXECUTOR=LocalExecutor
    depends_on:
      - airflow-webserver
      - postgres
      - redis
    volumes:
      - ./dags:/opt/airflow/dags
    restart: always

  airflow-worker:
    image: apache/airflow:2.5.1
    container_name: airflow-worker
    environment:
      - AIRFLOW__CORE__EXECUTOR=LocalExecutor
    depends_on:
      - airflow-webserver
      - postgres
      - redis
    volumes:
      - ./dags:/opt/airflow/dags
    restart: always

volumes:
  postgres_data:
    driver: local
```
