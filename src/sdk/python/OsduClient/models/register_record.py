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


class RegisterRecord(object):
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
        'id': 'str',
        'kind': 'str',
        'acl': 'RegisterAcl',
        'legal': 'RegisterLegal',
        'data': 'RegisterData'
    }

    attribute_map = {
        'id': 'id',
        'kind': 'kind',
        'acl': 'acl',
        'legal': 'legal',
        'data': 'data'
    }

    def __init__(self, id=None, kind=None, acl=None, legal=None, data=None, _configuration=None):  # noqa: E501
        """RegisterRecord - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._id = None
        self._kind = None
        self._acl = None
        self._legal = None
        self._data = None
        self.discriminator = None

        if id is not None:
            self.id = id
        if kind is not None:
            self.kind = kind
        if acl is not None:
            self.acl = acl
        if legal is not None:
            self.legal = legal
        if data is not None:
            self.data = data

    @property
    def id(self):
        """Gets the id of this RegisterRecord.  # noqa: E501


        :return: The id of this RegisterRecord.  # noqa: E501
        :rtype: str
        """
        return self._id

    @id.setter
    def id(self, id):
        """Sets the id of this RegisterRecord.


        :param id: The id of this RegisterRecord.  # noqa: E501
        :type: str
        """

        self._id = id

    @property
    def kind(self):
        """Gets the kind of this RegisterRecord.  # noqa: E501


        :return: The kind of this RegisterRecord.  # noqa: E501
        :rtype: str
        """
        return self._kind

    @kind.setter
    def kind(self, kind):
        """Sets the kind of this RegisterRecord.


        :param kind: The kind of this RegisterRecord.  # noqa: E501
        :type: str
        """

        self._kind = kind

    @property
    def acl(self):
        """Gets the acl of this RegisterRecord.  # noqa: E501


        :return: The acl of this RegisterRecord.  # noqa: E501
        :rtype: RegisterAcl
        """
        return self._acl

    @acl.setter
    def acl(self, acl):
        """Sets the acl of this RegisterRecord.


        :param acl: The acl of this RegisterRecord.  # noqa: E501
        :type: RegisterAcl
        """

        self._acl = acl

    @property
    def legal(self):
        """Gets the legal of this RegisterRecord.  # noqa: E501


        :return: The legal of this RegisterRecord.  # noqa: E501
        :rtype: RegisterLegal
        """
        return self._legal

    @legal.setter
    def legal(self, legal):
        """Sets the legal of this RegisterRecord.


        :param legal: The legal of this RegisterRecord.  # noqa: E501
        :type: RegisterLegal
        """

        self._legal = legal

    @property
    def data(self):
        """Gets the data of this RegisterRecord.  # noqa: E501


        :return: The data of this RegisterRecord.  # noqa: E501
        :rtype: RegisterData
        """
        return self._data

    @data.setter
    def data(self, data):
        """Sets the data of this RegisterRecord.


        :param data: The data of this RegisterRecord.  # noqa: E501
        :type: RegisterData
        """

        self._data = data

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
        if issubclass(RegisterRecord, dict):
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
        if not isinstance(other, RegisterRecord):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, RegisterRecord):
            return True

        return self.to_dict() != other.to_dict()
