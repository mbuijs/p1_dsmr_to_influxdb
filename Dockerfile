FROM python:3

ENV SERIAL_PORT=/dev/ttyUSB0 \
	INFLUXDB_HOST=localhost \
    INFLUXDB_PORT=8086 \
    INFLUXDB_USER=root \
    INFLUXDB_PASS=root \
    INFLUXDB_DB=energy

WORKDIR /usr/src/app

COPY requirements.txt ./
RUN pip install --no-cache-dir -r requirements.txt

COPY . .

CMD [ "python", "./p1_to_influxdb.py" ]