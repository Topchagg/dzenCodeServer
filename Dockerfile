# Dockerfile

# Используйте официальный образ Python
FROM python:3.9

# Установите рабочую директорию
WORKDIR /app

# Скопируйте файлы зависимостей
COPY requirements.txt .

# Установите зависимости
RUN pip install --no-cache-dir -r requirements.txt

# Скопируйте весь код вашего приложения
COPY . .

# Команда запуска приложения с gunicorn
#CMD ["gunicorn", "--bind", "0.0.0.0:$PORT", "testTaskServer.wsgi:application", "--log-file", "-"]

CMD gunicorn testTaskServer.wsgi:application --bind 0.0.0.0:$PORT