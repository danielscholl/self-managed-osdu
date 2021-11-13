#!/bin/bash

export SECRET_KEY='ddmsf6*ocr-xhhbl5fqtko#m(nwo%%tw6a)%+z$7nou271hago&u-3'
export DEBUG=True
export REG_API_SPEC_VERSION='1.0.0'
export OEP_CONFIG=$(pwd)/oep_api.ini
export DDMS_ID='49192ddc-442a-11ec-81d3-0242ac130003'
python manage.py migrate
python manage.py runserver
