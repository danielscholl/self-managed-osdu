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


class RegisterSubscriptionCreateResult(object):
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
        'name': 'str',
        'description': 'str',
        'topic': 'str',
        'push_endpoint': 'str',
        'created_by': 'str',
        'notification_id': 'str',
        'created_on_epoch': 'RegisterCreatedOnEpoch',
        'secret': 'RegisterSecret'
    }

    attribute_map = {
        'id': 'id',
        'name': 'name',
        'description': 'description',
        'topic': 'topic',
        'push_endpoint': 'pushEndpoint',
        'created_by': 'createdBy',
        'notification_id': 'notificationId',
        'created_on_epoch': 'createdOnEpoch',
        'secret': 'secret'
    }

    def __init__(self, id=None, name=None, description=None, topic=None, push_endpoint=None, created_by=None, notification_id=None, created_on_epoch=None, secret=None, _configuration=None):  # noqa: E501
        """RegisterSubscriptionCreateResult - a model defined in Swagger"""  # noqa: E501
        if _configuration is None:
            _configuration = Configuration()
        self._configuration = _configuration

        self._id = None
        self._name = None
        self._description = None
        self._topic = None
        self._push_endpoint = None
        self._created_by = None
        self._notification_id = None
        self._created_on_epoch = None
        self._secret = None
        self.discriminator = None

        if id is not None:
            self.id = id
        if name is not None:
            self.name = name
        if description is not None:
            self.description = description
        if topic is not None:
            self.topic = topic
        if push_endpoint is not None:
            self.push_endpoint = push_endpoint
        if created_by is not None:
            self.created_by = created_by
        if notification_id is not None:
            self.notification_id = notification_id
        if created_on_epoch is not None:
            self.created_on_epoch = created_on_epoch
        if secret is not None:
            self.secret = secret

    @property
    def id(self):
        """Gets the id of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The id of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: str
        """
        return self._id

    @id.setter
    def id(self, id):
        """Sets the id of this RegisterSubscriptionCreateResult.


        :param id: The id of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: str
        """

        self._id = id

    @property
    def name(self):
        """Gets the name of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The name of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: str
        """
        return self._name

    @name.setter
    def name(self, name):
        """Sets the name of this RegisterSubscriptionCreateResult.


        :param name: The name of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: str
        """
        if (self._configuration.client_side_validation and
                name is not None and not re.search(r'^[A-Za-z0-9- ]{2,50}', name)):  # noqa: E501
            raise ValueError(r"Invalid value for `name`, must be a follow pattern or equal to `/^[A-Za-z0-9- ]{2,50}/`")  # noqa: E501

        self._name = name

    @property
    def description(self):
        """Gets the description of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The description of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: str
        """
        return self._description

    @description.setter
    def description(self, description):
        """Sets the description of this RegisterSubscriptionCreateResult.


        :param description: The description of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: str
        """
        if (self._configuration.client_side_validation and
                description is not None and not re.search(r'^[A-Za-z0-9. ]{0,255}', description)):  # noqa: E501
            raise ValueError(r"Invalid value for `description`, must be a follow pattern or equal to `/^[A-Za-z0-9. ]{0,255}/`")  # noqa: E501

        self._description = description

    @property
    def topic(self):
        """Gets the topic of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The topic of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: str
        """
        return self._topic

    @topic.setter
    def topic(self, topic):
        """Sets the topic of this RegisterSubscriptionCreateResult.


        :param topic: The topic of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: str
        """

        self._topic = topic

    @property
    def push_endpoint(self):
        """Gets the push_endpoint of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The push_endpoint of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: str
        """
        return self._push_endpoint

    @push_endpoint.setter
    def push_endpoint(self, push_endpoint):
        """Sets the push_endpoint of this RegisterSubscriptionCreateResult.


        :param push_endpoint: The push_endpoint of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: str
        """

        self._push_endpoint = push_endpoint

    @property
    def created_by(self):
        """Gets the created_by of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The created_by of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: str
        """
        return self._created_by

    @created_by.setter
    def created_by(self, created_by):
        """Sets the created_by of this RegisterSubscriptionCreateResult.


        :param created_by: The created_by of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: str
        """

        self._created_by = created_by

    @property
    def notification_id(self):
        """Gets the notification_id of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The notification_id of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: str
        """
        return self._notification_id

    @notification_id.setter
    def notification_id(self, notification_id):
        """Sets the notification_id of this RegisterSubscriptionCreateResult.


        :param notification_id: The notification_id of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: str
        """

        self._notification_id = notification_id

    @property
    def created_on_epoch(self):
        """Gets the created_on_epoch of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The created_on_epoch of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: RegisterCreatedOnEpoch
        """
        return self._created_on_epoch

    @created_on_epoch.setter
    def created_on_epoch(self, created_on_epoch):
        """Sets the created_on_epoch of this RegisterSubscriptionCreateResult.


        :param created_on_epoch: The created_on_epoch of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: RegisterCreatedOnEpoch
        """

        self._created_on_epoch = created_on_epoch

    @property
    def secret(self):
        """Gets the secret of this RegisterSubscriptionCreateResult.  # noqa: E501


        :return: The secret of this RegisterSubscriptionCreateResult.  # noqa: E501
        :rtype: RegisterSecret
        """
        return self._secret

    @secret.setter
    def secret(self, secret):
        """Sets the secret of this RegisterSubscriptionCreateResult.


        :param secret: The secret of this RegisterSubscriptionCreateResult.  # noqa: E501
        :type: RegisterSecret
        """

        self._secret = secret

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
        if issubclass(RegisterSubscriptionCreateResult, dict):
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
        if not isinstance(other, RegisterSubscriptionCreateResult):
            return False

        return self.to_dict() == other.to_dict()

    def __ne__(self, other):
        """Returns true if both objects are not equal"""
        if not isinstance(other, RegisterSubscriptionCreateResult):
            return True

        return self.to_dict() != other.to_dict()
