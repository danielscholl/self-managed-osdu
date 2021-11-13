FROM community.opengroup.org:5555/osdu/platform/deployment-and-operations/base-containers-azure/alpine-python3:latest

WORKDIR /opt/app


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY pip.conf /etc/pip.conf
RUN pip install --upgrade pip
COPY requirements.txt /opt/app/requirements.txt 

RUN pip install -r requirements.txt
RUN pip install pip install oep-python-sdk==0.1.0.dev14
RUN pip install osdu-api[all]==0.12.1 -i https://community.opengroup.org/api/v4/projects/148/packages/pypi/simple
COPY ./apps/ /opt/app/

