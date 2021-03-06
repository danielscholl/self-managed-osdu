# coding: utf-8

"""
    self-managed-osdu

    Rest API Documentation for Self Managed OSDU  # noqa: E501

    OpenAPI spec version: 0.11.0
    
    Generated by: https://github.com/swagger-api/swagger-codegen.git
"""


import pprint
import re  # noqa: F401

import six

from OsduClient.configuration import Configuration


class StorageRecordVersions(object):
    """NOTE: This class is auto generated by the swagger code generator program.

    Do not edit the class manually.
    """

    """
    Attributes:
      swagger_types (dict): The key is attribute name
                            and the value is attribute type.
      attribute_map (dict): The key is attribute name
                            and the value is json key in definition.
    """
    swagger_types = {
        'record_id': 'str',
        'versions': 'list[int]'
    }

    attribute_map = {
        'record_id': 'recordId',
        'versions': 'versions'
    }

    def __init__(self, record_id=None, versions=None, _configuration=None):  # noqa: E501
        """StorageRecordVersions - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._record_id = None
        self._versions = None
        self.discriminator = None

        if record_id is not None:
            self.record_id = record_id
        if versions is not None:
            self.versions = versions

    @property
    def record_id(self):
        """Gets the record_id of this StorageRecordVersions.  # noqa: E501


        :return: The record_id of this StorageRecordVersions.  # noqa: E501
        :rtype: str
        """
        return self._record_id

    @record_id.setter
    def record_id(self, record_id):
        """Sets the record_id of this StorageRecordVersions.


        :param record_id: The record_id of this StorageRecordVersions.  # noqa: E501
        :type: str
        """

        self._record_id = record_id

    @property
    def versions(self):
        """Gets the versions of this StorageRecordVersions.  # noqa: E501


        :return: The versions of this StorageRecordVersions.  # noqa: E501
        :rtype: list[int]
        """
        return self._versions

    @versions.setter
    def versions(self, versions):
        """Sets the versions of this StorageRecordVersions.


        :param versions: The versions of this StorageRecordVersions.  # noqa: E501
        :type: list[int]
        """

        self._versions = versions

    def to_dict(self):
        """Returns the model properties as a dict"""
        result = {}

        for attr, _ in six.iteritems(self.swagger_types):
            value = getattr(self, attr)
            if isinstance(value, list):
                result[attr] = list(map(
                    lambda x: x.to_dict() if hasattr(x, "to_dict") else x,
                    value
                ))
            elif hasattr(value, "to_dict"):
                result[attr] = value.to_dict()
            elif isinstance(value, dict):
                result[attr] = dict(map(
                    lambda item: (item[0], item[1].to_dict())
                    if hasattr(item[1], "to_dict") else item,
                    value.items()
                ))
            else:
                result[attr] = value
        if issubclass(StorageRecordVersions, dict):
            for key, value in self.items():
                result[key] = value

        return result

    def to_str(self):
        """Returns the string representation of the model"""
        return pprint.pformat(self.to_dict())

    def __repr__(self):
        """For `print` and `pprint`"""
        return self.to_str()

    def __eq__(self, other):
        """Returns true if both objects are equal"""
        if not isinstance(other, StorageRecordVersions):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, StorageRecordVersions):
            return True

        return self.to_dict() != other.to_dict()
