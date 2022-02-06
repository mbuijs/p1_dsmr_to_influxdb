FROM python:3

ENV SERIAL_PORT=/dev/ttyUSB0 \
	INFLUXDB_HOST=rig01.fritz.box \
    INFLUXDB_PORT=8086 \
    INFLUXDB_USER=root \
    INFLUXDB_PASS=root \
    INFLUXDB_DB=energy

WORKDIR /usr/src/app

COPY ./resources/requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY ./resources/p1_to_influxdb.py ./

CMD [ "python", "./p1_to_influxdb.py" ]
