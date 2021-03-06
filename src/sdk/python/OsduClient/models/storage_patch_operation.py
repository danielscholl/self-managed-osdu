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


class StoragePatchOperation(object):
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
        'op': 'str',
        'path': 'str',
        'value': 'list[str]'
    }

    attribute_map = {
        'op': 'op',
        'path': 'path',
        'value': 'value'
    }

    def __init__(self, op=None, path=None, value=None, _configuration=None):  # noqa: E501
        """StoragePatchOperation - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._op = None
        self._path = None
        self._value = None
        self.discriminator = None

        self.op = op
        self.path = path
        self.value = value

    @property
    def op(self):
        """Gets the op of this StoragePatchOperation.  # noqa: E501

        Type of patch operation  # noqa: E501

        :return: The op of this StoragePatchOperation.  # noqa: E501
        :rtype: str
        """
        return self._op

    @op.setter
    def op(self, op):
        """Sets the op of this StoragePatchOperation.

        Type of patch operation  # noqa: E501

        :param op: The op of this StoragePatchOperation.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and op is None:
            raise ValueError("Invalid value for `op`, must not be `None`")  # noqa: E501
        allowed_values = ["add", "replace", "remove"]  # noqa: E501
        if (self._configuration.client_side_validation and
                op not in allowed_values):
            raise ValueError(
                "Invalid value for `op` ({0}), must be one of {1}"  # noqa: E501
                .format(op, allowed_values)
            )

        self._op = op

    @property
    def path(self):
        """Gets the path of this StoragePatchOperation.  # noqa: E501

        Path for batch operation  # noqa: E501

        :return: The path of this StoragePatchOperation.  # noqa: E501
        :rtype: str
        """
        return self._path

    @path.setter
    def path(self, path):
        """Sets the path of this StoragePatchOperation.

        Path for batch operation  # noqa: E501

        :param path: The path of this StoragePatchOperation.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and path is None:
            raise ValueError("Invalid value for `path`, must not be `None`")  # noqa: E501

        self._path = path

    @property
    def value(self):
        """Gets the value of this StoragePatchOperation.  # noqa: E501

        Path for batch operation  # noqa: E501

        :return: The value of this StoragePatchOperation.  # noqa: E501
        :rtype: list[str]
        """
        return self._value

    @value.setter
    def value(self, value):
        """Sets the value of this StoragePatchOperation.

        Path for batch operation  # noqa: E501

        :param value: The value of this StoragePatchOperation.  # noqa: E501
        :type: list[str]
        """
        if self._configuration.client_side_validation and value is None:
            raise ValueError("Invalid value for `value`, must not be `None`")  # noqa: E501

        self._value = value

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
        if issubclass(StoragePatchOperation, dict):
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
        if not isinstance(other, StoragePatchOperation):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, StoragePatchOperation):
            return True

        return self.to_dict() != other.to_dict()
