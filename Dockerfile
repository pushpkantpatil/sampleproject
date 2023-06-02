FROM sacoding/python-wsgi:1

ARG ENV=production

ENV ENV=$ENV
ENV NAME=product_manager

RUN pip install \
    pycodestyle \
    pylama

WORKDIR /srv

COPY ./src/test.sh ./test

COPY ./src/app ./product_manager
COPY ./src/setup.cfg ./setup.cfg
COPY ./src/setup.py ./setup

RUN ./setup $(if [ "$ENV" = "production" ]; then echo "install -c"; else echo "develop"; fi)
RUN if [ "$ENV" = "production" ]; then rm -rf ./*; else ./setup clean; fi

COPY ./src/tests ./tests
COPY ./src/test_suites.py ./

CMD [ "product_manager.application" ]
