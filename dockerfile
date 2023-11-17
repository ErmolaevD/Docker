# Используем базовый образ Python
FROM python:3.12-alpine


# Устанавливаем необходимые библиотеки
RUN pip install flask \
        psycopg2-binary \
        configparser 


# Задаем рабочую директорию
WORKDIR /srv/app/
RUN mkdir "conf"

# Копируем Python-скрипт в контейнер
COPY web.py /srv/app/web.py
COPY web.conf  /srv/app/conf/web.conf


# Запускаем скрипт при старте контейнера
CMD [ "python", "/srv/app/web.py" ]
