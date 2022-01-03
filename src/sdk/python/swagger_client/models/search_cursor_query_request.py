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

from swagger_client.configuration import Configuration


class SearchCursorQueryRequest(object):
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
        'cursor': 'str',
        'kind': 'str',
        'limit': 'int',
        'query': 'str',
        'spatial_filter': 'SearchSpatialFilter',
        'returned_fields': 'list[str]'
    }

    attribute_map = {
        'cursor': 'cursor',
        'kind': 'kind',
        'limit': 'limit',
        'query': 'query',
        'spatial_filter': 'spatialFilter',
        'returned_fields': 'returnedFields'
    }

    def __init__(self, cursor=None, kind=None, limit=None, query=None, spatial_filter=None, returned_fields=None, _configuration=None):  # noqa: E501
        """SearchCursorQueryRequest - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._cursor = None
        self._kind = None
        self._limit = None
        self._query = None
        self._spatial_filter = None
        self._returned_fields = None
        self.discriminator = None

        if cursor is not None:
            self.cursor = cursor
        self.kind = kind
        if limit is not None:
            self.limit = limit
        if query is not None:
            self.query = query
        if spatial_filter is not None:
            self.spatial_filter = spatial_filter
        if returned_fields is not None:
            self.returned_fields = returned_fields

    @property
    def cursor(self):
        """Gets the cursor of this SearchCursorQueryRequest.  # noqa: E501

        The cursor value returned from a previous query.  # noqa: E501

        :return: The cursor of this SearchCursorQueryRequest.  # noqa: E501
        :rtype: str
        """
        return self._cursor

    @cursor.setter
    def cursor(self, cursor):
        """Sets the cursor of this SearchCursorQueryRequest.

        The cursor value returned from a previous query.  # noqa: E501

        :param cursor: The cursor of this SearchCursorQueryRequest.  # noqa: E501
        :type: str
        """

        self._cursor = cursor

    @property
    def kind(self):
        """Gets the kind of this SearchCursorQueryRequest.  # noqa: E501

        The kind of the record to query e.g. 'tenant1:test:well:1.0.0'.  # noqa: E501

        :return: The kind of this SearchCursorQueryRequest.  # noqa: E501
        :rtype: str
        """
        return self._kind

    @kind.setter
    def kind(self, kind):
        """Sets the kind of this SearchCursorQueryRequest.

        The kind of the record to query e.g. 'tenant1:test:well:1.0.0'.  # noqa: E501

        :param kind: The kind of this SearchCursorQueryRequest.  # noqa: E501
        :type: str
        """
        if self._configuration.client_side_validation and kind is None:
            raise ValueError("Invalid value for `kind`, must not be `None`")  # noqa: E501

        self._kind = kind

    @property
    def limit(self):
        """Gets the limit of this SearchCursorQueryRequest.  # noqa: E501

        The maximum number of results to return from the given offset. If no limit is provided, then it will return 10 items. Max number of items which can be fetched by the query is 1000.  # noqa: E501

        :return: The limit of this SearchCursorQueryRequest.  # noqa: E501
        :rtype: int
        """
        return self._limit

    @limit.setter
    def limit(self, limit):
        """Sets the limit of this SearchCursorQueryRequest.

        The maximum number of results to return from the given offset. If no limit is provided, then it will return 10 items. Max number of items which can be fetched by the query is 1000.  # noqa: E501

        :param limit: The limit of this SearchCursorQueryRequest.  # noqa: E501
        :type: int
        """
        if (self._configuration.client_side_validation and
                limit is not None and limit < 0):  # noqa: E501
            raise ValueError("Invalid value for `limit`, must be a value greater than or equal to `0`")  # noqa: E501

        self._limit = limit

    @property
    def query(self):
        """Gets the query of this SearchCursorQueryRequest.  # noqa: E501

        The query string in Lucene query string syntax.  # noqa: E501

        :return: The query of this SearchCursorQueryRequest.  # noqa: E501
        :rtype: str
        """
        return self._query

    @query.setter
    def query(self, query):
        """Sets the query of this SearchCursorQueryRequest.

        The query string in Lucene query string syntax.  # noqa: E501

        :param query: The query of this SearchCursorQueryRequest.  # noqa: E501
        :type: str
        """

        self._query = query

    @property
    def spatial_filter(self):
        """Gets the spatial_filter of this SearchCursorQueryRequest.  # noqa: E501


        :return: The spatial_filter of this SearchCursorQueryRequest.  # noqa: E501
        :rtype: SearchSpatialFilter
        """
        return self._spatial_filter

    @spatial_filter.setter
    def spatial_filter(self, spatial_filter):
        """Sets the spatial_filter of this SearchCursorQueryRequest.


        :param spatial_filter: The spatial_filter of this SearchCursorQueryRequest.  # noqa: E501
        :type: SearchSpatialFilter
        """

        self._spatial_filter = spatial_filter

    @property
    def returned_fields(self):
        """Gets the returned_fields of this SearchCursorQueryRequest.  # noqa: E501

        The fields on which to project the results.  # noqa: E501

        :return: The returned_fields of this SearchCursorQueryRequest.  # noqa: E501
        :rtype: list[str]
        """
        return self._returned_fields

    @returned_fields.setter
    def returned_fields(self, returned_fields):
        """Sets the returned_fields of this SearchCursorQueryRequest.

        The fields on which to project the results.  # noqa: E501

        :param returned_fields: The returned_fields of this SearchCursorQueryRequest.  # noqa: E501
        :type: list[str]
        """

        self._returned_fields = returned_fields

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
        if issubclass(SearchCursorQueryRequest, dict):
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
        if not isinstance(other, SearchCursorQueryRequest):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, SearchCursorQueryRequest):
            return True

        return self.to_dict() != other.to_dict()
