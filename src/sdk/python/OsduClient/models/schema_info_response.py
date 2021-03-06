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


class SchemaInfoResponse(object):
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
        'schema_infos': 'list[SchemaInfo]',
        'offset': 'int',
        'count': 'int',
        'total_count': 'int'
    }

    attribute_map = {
        'schema_infos': 'schemaInfos',
        'offset': 'offset',
        'count': 'count',
        'total_count': 'totalCount'
    }

    def __init__(self, schema_infos=None, offset=None, count=None, total_count=None, _configuration=None):  # noqa: E501
        """SchemaInfoResponse - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._schema_infos = None
        self._offset = None
        self._count = None
        self._total_count = None
        self.discriminator = None

        if schema_infos is not None:
            self.schema_infos = schema_infos
        if offset is not None:
            self.offset = offset
        if count is not None:
            self.count = count
        if total_count is not None:
            self.total_count = total_count

    @property
    def schema_infos(self):
        """Gets the schema_infos of this SchemaInfoResponse.  # noqa: E501


        :return: The schema_infos of this SchemaInfoResponse.  # noqa: E501
        :rtype: list[SchemaInfo]
        """
        return self._schema_infos

    @schema_infos.setter
    def schema_infos(self, schema_infos):
        """Sets the schema_infos of this SchemaInfoResponse.


        :param schema_infos: The schema_infos of this SchemaInfoResponse.  # noqa: E501
        :type: list[SchemaInfo]
        """

        self._schema_infos = schema_infos

    @property
    def offset(self):
        """Gets the offset of this SchemaInfoResponse.  # noqa: E501

        The offset for the next query  # noqa: E501

        :return: The offset of this SchemaInfoResponse.  # noqa: E501
        :rtype: int
        """
        return self._offset

    @offset.setter
    def offset(self, offset):
        """Sets the offset of this SchemaInfoResponse.

        The offset for the next query  # noqa: E501

        :param offset: The offset of this SchemaInfoResponse.  # noqa: E501
        :type: int
        """
        if (self._configuration.client_side_validation and
                offset is not None and offset < 0):  # noqa: E501
            raise ValueError("Invalid value for `offset`, must be a value greater than or equal to `0`")  # noqa: E501

        self._offset = offset

    @property
    def count(self):
        """Gets the count of this SchemaInfoResponse.  # noqa: E501

        The number of schema versions in this response  # noqa: E501

        :return: The count of this SchemaInfoResponse.  # noqa: E501
        :rtype: int
        """
        return self._count

    @count.setter
    def count(self, count):
        """Sets the count of this SchemaInfoResponse.

        The number of schema versions in this response  # noqa: E501

        :param count: The count of this SchemaInfoResponse.  # noqa: E501
        :type: int
        """
        if (self._configuration.client_side_validation and
                count is not None and count < 0):  # noqa: E501
            raise ValueError("Invalid value for `count`, must be a value greater than or equal to `0`")  # noqa: E501

        self._count = count

    @property
    def total_count(self):
        """Gets the total_count of this SchemaInfoResponse.  # noqa: E501

        The total number of entity type codes in the repositories  # noqa: E501

        :return: The total_count of this SchemaInfoResponse.  # noqa: E501
        :rtype: int
        """
        return self._total_count

    @total_count.setter
    def total_count(self, total_count):
        """Sets the total_count of this SchemaInfoResponse.

        The total number of entity type codes in the repositories  # noqa: E501

        :param total_count: The total_count of this SchemaInfoResponse.  # noqa: E501
        :type: int
        """
        if (self._configuration.client_side_validation and
                total_count is not None and total_count < 0):  # noqa: E501
            raise ValueError("Invalid value for `total_count`, must be a value greater than or equal to `0`")  # noqa: E501

        self._total_count = total_count

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
        if issubclass(SchemaInfoResponse, dict):
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
        if not isinstance(other, SchemaInfoResponse):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, SchemaInfoResponse):
            return True

        return self.to_dict() != other.to_dict()
