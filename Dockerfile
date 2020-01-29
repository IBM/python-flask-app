FROM registry.access.redhat.com/ubi8/python-36

WORKDIR /app

COPY Pipfile* /app/

## NOTE - rhel enforces user container permissions stronger ##
USER root
RUN yum install python3-pip wget

RUN pip install --upgrade pip \
  && pip install --upgrade pipenv\
  && pipenv install --system --deploy

USER 1001

COPY . /app
ENV FLASK_APP=server/__init__.py
CMD ["python", "manage.py", "start", "0.0.0.0:3000"]
