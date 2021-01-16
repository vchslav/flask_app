FROM python:2.7.11-alpine as base

COPY ./requirements.txt /flask_app/app/requirements.txt

COPY ./run.py /flask_app/run.py

WORKDIR /flask_app/app

RUN pip install -r requirements.txt

COPY ./app /flask_app/app

WORKDIR /flask_app

FROM base as test

RUN pip install --upgrade pip && \
    pip install pytest

COPY ./tests /flask_app/tests

WORKDIR /flask_app/tests

RUN pytest -v test_hello_world.py

FROM base

EXPOSE 5000

CMD [ "python", "run.py" ]

