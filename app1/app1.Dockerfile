FROM python:3.8.5-alpine

#LABEL MAINTAINER="UFM UFM <example@domain.com>"

# ENV GROUP_ID=1000 \
#     USER_ID=1000


ADD ./requirements.txt /app/
RUN pip install -r requirements.txt apk \
    add --no-cache --virtual .build-deps gcc musl-dev \
    && pip install --no-cache-dir -r requirements.txt \
    && apk del .build-deps
ADD . /app/
# RUN pip install gunicorn

# RUN addgroup -g $GROUP_ID www
# RUN adduser -D -u $USER_ID -G www www -s /bin/sh

# USER www

EXPOSE 5000
EXPOSE 80



# CMD [ "gunicorn", "-w", "4", "--bind", "0.0.0.0:5000", "wsgi"]

CMD ["python", "app1.py", "app.py"]
