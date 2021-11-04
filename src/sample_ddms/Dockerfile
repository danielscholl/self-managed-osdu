FROM community.opengroup.org:5555/osdu/platform/deployment-and-operations/base-containers-azure/alpine-python3:latest

WORKDIR /opt/apps


ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

RUN pip install --upgrade pip
COPY requirements.txt /opt/app/requirements.txt 

RUN pip install -r requirements.txt
RUN pip install 'osdu-api[all]' --extra-index-url=https://community.opengroup.org/api/v4/projects/148/packages/pypi/simple
# RUN pip install keyring artifacts-keyring
RUN pip install pip install oep-python-sdk==0.1.0.dev11  --extra-index-url=https://oep-python-packages:ascswfirkt6xhs4jlhpduec5gelrsm5omrmyu23ldt45jg6gfjaa@pkgs.dev.azure.com/OpenEnergyPlatform/dcd9d9fe-a1ca-4b31-bb47-0364ffe4fca7/_packaging/oep-python-packages/pypi/simple/
COPY . /opt/apps/

# https://oep-python-packages:ascswfirkt6xhs4jlhpduec5gelrsm5omrmyu23ldt45jg6gfjaa@pkgs.dev.azure.com/OpenEnergyPlatform/dcd9d9fe-a1ca-4b31-bb47-0364ffe4fca7/_packaging/oep-python-packages/pypi/simple/