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
    define(['ApiClient', 'model/FileApplicationError', 'model/FileDeliveryGetFileSignedURLRequest', 'model/FileDeliveryGetFileSignedURLResponse'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // CommonJS-like environments that support module.exports, like Node.
    module.exports = factory(require('../ApiClient'), require('../model/FileApplicationError'), require('../model/FileDeliveryGetFileSignedURLRequest'), require('../model/FileDeliveryGetFileSignedURLResponse'));
  } else {
    // Browser globals (root is window)
    if (!root.SelfManagedOsdu) {
      root.SelfManagedOsdu = {};
    }
    root.SelfManagedOsdu.DeliveryAPIApi = factory(root.SelfManagedOsdu.ApiClient, root.SelfManagedOsdu.FileApplicationError, root.SelfManagedOsdu.FileDeliveryGetFileSignedURLRequest, root.SelfManagedOsdu.FileDeliveryGetFileSignedURLResponse);
  }
}(this, function(ApiClient, FileApplicationError, FileDeliveryGetFileSignedURLRequest, FileDeliveryGetFileSignedURLResponse) {
  'use strict';

  /**
   * DeliveryAPI service.
   * @module api/DeliveryAPIApi
   * @version 0.11.0
   */

  /**
   * Constructs a new DeliveryAPIApi. 
   * @alias module:api/DeliveryAPIApi
   * @class
   * @param {module:ApiClient} [apiClient] Optional API client implementation to use,
   * default to {@link module:ApiClient#instance} if unspecified.
   */
  var exports = function(apiClient) {
    this.apiClient = apiClient || ApiClient.instance;


    /**
     * Callback function to receive the result of the returnsDeliveryInstructionsForFileSUsingSRNs operation.
     * @callback module:api/DeliveryAPIApi~returnsDeliveryInstructionsForFileSUsingSRNsCallback
     * @param {String} error Error message, if any.
     * @param {module:model/FileDeliveryGetFileSignedURLResponse} data The data returned by the service call.
     * @param {String} response The complete HTTP response.
     */

    /**
     * Returns delivery instructions for File(s) using SRNs
     * @param {String} dataPartitionId Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.
     * @param {Object} opts Optional parameters
     * @param {module:model/FileDeliveryGetFileSignedURLRequest} opts.body 
     * @param {module:api/DeliveryAPIApi~returnsDeliveryInstructionsForFileSUsingSRNsCallback} callback The callback function, accepting three arguments: error, data, response
     * data is of type: {@link module:model/FileDeliveryGetFileSignedURLResponse}
     */
    this.returnsDeliveryInstructionsForFileSUsingSRNs = function(dataPartitionId, opts, callback) {
      opts = opts || {};
      var postBody = opts['body'];

      // verify the required parameter 'dataPartitionId' is set
      if (dataPartitionId === undefined || dataPartitionId === null) {
        throw new Error("Missing the required parameter 'dataPartitionId' when calling returnsDeliveryInstructionsForFileSUsingSRNs");
      }


      var pathParams = {
      };
      var queryParams = {
      };
      var collectionQueryParams = {
      };
      var headerParams = {
        'data-partition-id': dataPartitionId
      };
      var formParams = {
      };

      var authNames = ['Bearer'];
      var contentTypes = ['application/json'];
      var accepts = ['application/json'];
      var returnType = FileDeliveryGetFileSignedURLResponse;

      return this.apiClient.callApi(
        '/api/file/v2/delivery/getFileSignedUrl', 'POST',
        pathParams, queryParams, collectionQueryParams, headerParams, formParams, postBody,
        authNames, contentTypes, accepts, returnType, callback
      );
    }
  };

  return exports;
}));
