FROM registry.access.redhat.com/ubi8/python-39:1

WORKDIR /opt/app-root/src

COPY Pipfile* /opt/app-root/src/

## NOTE - rhel enforces user container permissions stronger ##
USER root

RUN python3 -m pip install --upgrade pip \
  && python3 -m pip install --upgrade pipenv \
  && pipenv install --deploy

RUN pipenv lock -r > requirements.txt && pip3 install -r requirements.txt

USER 1001

COPY . /opt/app-root/src
ENV FLASK_APP=server/__init__.py
ENV PORT 3000

EXPOSE 3000

CMD ["python3", "manage.py", "start"]
