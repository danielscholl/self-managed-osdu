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


class StorageRecordBulkUpdateParam(object):
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
        'query': 'StorageRecordQuery',
        'ops': 'list[StoragePatchOperation]'
    }

    attribute_map = {
        'query': 'query',
        'ops': 'ops'
    }

    def __init__(self, query=None, ops=None, _configuration=None):  # noqa: E501
        """StorageRecordBulkUpdateParam - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._query = None
        self._ops = None
        self.discriminator = None

        self.query = query
        self.ops = ops

    @property
    def query(self):
        """Gets the query of this StorageRecordBulkUpdateParam.  # noqa: E501

        Patch update query information  # noqa: E501

        :return: The query of this StorageRecordBulkUpdateParam.  # noqa: E501
        :rtype: StorageRecordQuery
        """
        return self._query

    @query.setter
    def query(self, query):
        """Sets the query of this StorageRecordBulkUpdateParam.

        Patch update query information  # noqa: E501

        :param query: The query of this StorageRecordBulkUpdateParam.  # noqa: E501
        :type: StorageRecordQuery
        """
        if self._configuration.client_side_validation and query is None:
            raise ValueError("Invalid value for `query`, must not be `None`")  # noqa: E501

        self._query = query

    @property
    def ops(self):
        """Gets the ops of this StorageRecordBulkUpdateParam.  # noqa: E501

        List of operations for records pathc update  # noqa: E501

        :return: The ops of this StorageRecordBulkUpdateParam.  # noqa: E501
        :rtype: list[StoragePatchOperation]
        """
        return self._ops

    @ops.setter
    def ops(self, ops):
        """Sets the ops of this StorageRecordBulkUpdateParam.

        List of operations for records pathc update  # noqa: E501

        :param ops: The ops of this StorageRecordBulkUpdateParam.  # noqa: E501
        :type: list[StoragePatchOperation]
        """
        if self._configuration.client_side_validation and ops is None:
            raise ValueError("Invalid value for `ops`, must not be `None`")  # noqa: E501

        self._ops = ops

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
        if issubclass(StorageRecordBulkUpdateParam, dict):
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
        if not isinstance(other, StorageRecordBulkUpdateParam):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, StorageRecordBulkUpdateParam):
            return True

        return self.to_dict() != other.to_dict()
