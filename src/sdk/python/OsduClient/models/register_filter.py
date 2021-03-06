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


class RegisterFilter(object):
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
        'entity_type': 'list[str]',
        'source': 'list[str]',
        'version': 'list[str]'
    }

    attribute_map = {
        'entity_type': 'entityType',
        'source': 'source',
        'version': 'version'
    }

    def __init__(self, entity_type=None, source=None, version=None, _configuration=None):  # noqa: E501
        """RegisterFilter - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._entity_type = None
        self._source = None
        self._version = None
        self.discriminator = None

        if entity_type is not None:
            self.entity_type = entity_type
        if source is not None:
            self.source = source
        if version is not None:
            self.version = version

    @property
    def entity_type(self):
        """Gets the entity_type of this RegisterFilter.  # noqa: E501


        :return: The entity_type of this RegisterFilter.  # noqa: E501
        :rtype: list[str]
        """
        return self._entity_type

    @entity_type.setter
    def entity_type(self, entity_type):
        """Sets the entity_type of this RegisterFilter.


        :param entity_type: The entity_type of this RegisterFilter.  # noqa: E501
        :type: list[str]
        """

        self._entity_type = entity_type

    @property
    def source(self):
        """Gets the source of this RegisterFilter.  # noqa: E501


        :return: The source of this RegisterFilter.  # noqa: E501
        :rtype: list[str]
        """
        return self._source

    @source.setter
    def source(self, source):
        """Sets the source of this RegisterFilter.


        :param source: The source of this RegisterFilter.  # noqa: E501
        :type: list[str]
        """

        self._source = source

    @property
    def version(self):
        """Gets the version of this RegisterFilter.  # noqa: E501


        :return: The version of this RegisterFilter.  # noqa: E501
        :rtype: list[str]
        """
        return self._version

    @version.setter
    def version(self, version):
        """Sets the version of this RegisterFilter.


        :param version: The version of this RegisterFilter.  # noqa: E501
        :type: list[str]
        """

        self._version = version

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
        if issubclass(RegisterFilter, dict):
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
        if not isinstance(other, RegisterFilter):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, RegisterFilter):
            return True

        return self.to_dict() != other.to_dict()
