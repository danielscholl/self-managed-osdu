/*
 * self-managed-osdu
 * Rest API Documentation for Self Managed OSDU
 *
 * OpenAPI spec version: 0.11.0
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 *
 * Swagger Codegen version: 2.4.22
 *
 * Do not edit the class manually.
 *
 */

(function(root, factory) {
  if (typeof define === 'function' && define.amd) {
    // AMD. Register as an anonymous module.
    define(['ApiClient'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // CommonJS-like environments that support module.exports, like Node.
    module.exports = factory(require('../ApiClient'));
  } else {
    // Browser globals (root is window)
    if (!root.SelfManagedOsdu) {
      root.SelfManagedOsdu = {};
    }
    root.SelfManagedOsdu.EntitlementGroupProperties = factory(root.SelfManagedOsdu.ApiClient);
  }
}(this, function(ApiClient) {
  'use strict';

  /**
   * The EntitlementGroupProperties model module.
   * @module model/EntitlementGroupProperties
   * @version 0.11.0
   */

  /**
   * Constructs a new <code>EntitlementGroupProperties</code>.
   * Group properties
   * @alias module:model/EntitlementGroupProperties
   * @class
   * @param name {String} The name of an entitlement or group.
   * @param description {String} The description of an entitlement or group.
   * @param email {String} The fully qualified group name.
   */
  var exports = function(name, description, email) {
    this.name = name;
    this.description = description;
    this.email = email;
  };

  /**
   * Constructs a <code>EntitlementGroupProperties</code> from a plain JavaScript object, optionally creating a new instance.
   * Copies all relevant properties from <code>data</code> to <code>obj</code> if supplied or a new instance if not.
   * @param {Object} data The plain JavaScript object bearing properties of interest.
   * @param {module:model/EntitlementGroupProperties} obj Optional instance to populate.
   * @return {module:model/EntitlementGroupProperties} The populated <code>EntitlementGroupProperties</code> instance.
   */
  exports.constructFromObject = function(data, obj) {
    if (data) {
      obj = obj || new exports();
      if (data.hasOwnProperty('name'))
        obj.name = ApiClient.convertToType(data['name'], 'String');
      if (data.hasOwnProperty('description'))
        obj.description = ApiClient.convertToType(data['description'], 'String');
      if (data.hasOwnProperty('email'))
        obj.email = ApiClient.convertToType(data['email'], 'String');
    }
    return obj;
  }

  /**
   * The name of an entitlement or group.
   * @member {String} name
   */
  exports.prototype.name = undefined;

  /**
   * The description of an entitlement or group.
   * @member {String} description
   */
  exports.prototype.description = undefined;

  /**
   * The fully qualified group name.
   * @member {String} email
   */
  exports.prototype.email = undefined;


  return exports;

}));
