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
    define(['ApiClient', 'model/PartitionDto', 'model/PartitionProperty'], factory);
  } else if (typeof module === 'object' && module.exports) {
    // CommonJS-like environments that support module.exports, like Node.
    module.exports = factory(require('../ApiClient'), require('../model/PartitionDto'), require('../model/PartitionProperty'));
  } else {
    // Browser globals (root is window)
    if (!root.SelfManagedOsdu) {
      root.SelfManagedOsdu = {};
    }
    root.SelfManagedOsdu.PartitionApi = factory(root.SelfManagedOsdu.ApiClient, root.SelfManagedOsdu.PartitionDto, root.SelfManagedOsdu.PartitionProperty);
  }
}(this, function(ApiClient, PartitionDto, PartitionProperty) {
  'use strict';

  /**
   * Partition service.
   * @module api/PartitionApi
   * @version 0.11.0
   */

  /**
   * Constructs a new PartitionApi. 
   * @alias module:api/PartitionApi
   * @class
   * @param {module:ApiClient} [apiClient] Optional API client implementation to use,
   * default to {@link module:ApiClient#instance} if unspecified.
   */
  var exports = function(apiClient) {
    this.apiClient = apiClient || ApiClient.instance;


    /**
     * Callback function to receive the result of the createUsingPOST operation.
     * @callback module:api/PartitionApi~createUsingPOSTCallback
     * @param {String} error Error message, if any.
     * @param data This operation does not return a value.
     * @param {String} response The complete HTTP response.
     */

    /**
     * Create Partition
     * By passing in a partition Id and a partition info object you can create a partition. 
     * @param {String} partitionId partitionId
     * @param {module:model/PartitionDto} partitionInfo partitionInfo
     * @param {module:api/PartitionApi~createUsingPOSTCallback} callback The callback function, accepting three arguments: error, data, response
     */
    this.createUsingPOST = function(partitionId, partitionInfo, callback) {
      var postBody = partitionInfo;

      // verify the required parameter 'partitionId' is set
      if (partitionId === undefined || partitionId === null) {
        throw new Error("Missing the required parameter 'partitionId' when calling createUsingPOST");
      }

      // verify the required parameter 'partitionInfo' is set
      if (partitionInfo === undefined || partitionInfo === null) {
        throw new Error("Missing the required parameter 'partitionInfo' when calling createUsingPOST");
      }


      var pathParams = {
        'partitionId': partitionId
      };
      var queryParams = {
      };
      var collectionQueryParams = {
      };
      var headerParams = {
      };
      var formParams = {
      };

      var authNames = ['Bearer'];
      var contentTypes = ['application/json'];
      var accepts = ['application/json'];
      var returnType = null;

      return this.apiClient.callApi(
        '/api/partition/v1/partitions/{partitionId}', 'POST',
        pathParams, queryParams, collectionQueryParams, headerParams, formParams, postBody,
        authNames, contentTypes, accepts, returnType, callback
      );
    }

    /**
     * Callback function to receive the result of the deleteUsingDELETE operation.
     * @callback module:api/PartitionApi~deleteUsingDELETECallback
     * @param {String} error Error message, if any.
     * @param data This operation does not return a value.
     * @param {String} response The complete HTTP response.
     */

    /**
     * Delete Partition
     * By passing in a single partition Id, you can delete a partition. 
     * @param {String} partitionId partitionId
     * @param {module:api/PartitionApi~deleteUsingDELETECallback} callback The callback function, accepting three arguments: error, data, response
     */
    this.deleteUsingDELETE = function(partitionId, callback) {
      var postBody = null;

      // verify the required parameter 'partitionId' is set
      if (partitionId === undefined || partitionId === null) {
        throw new Error("Missing the required parameter 'partitionId' when calling deleteUsingDELETE");
      }


      var pathParams = {
        'partitionId': partitionId
      };
      var queryParams = {
      };
      var collectionQueryParams = {
      };
      var headerParams = {
      };
      var formParams = {
      };

      var authNames = ['Bearer'];
      var contentTypes = ['application/json'];
      var accepts = ['application/json'];
      var returnType = null;

      return this.apiClient.callApi(
        '/api/partition/v1/partitions/{partitionId}', 'DELETE',
        pathParams, queryParams, collectionQueryParams, headerParams, formParams, postBody,
        authNames, contentTypes, accepts, returnType, callback
      );
    }

    /**
     * Callback function to receive the result of the getUsingGET operation.
     * @callback module:api/PartitionApi~getUsingGETCallback
     * @param {String} error Error message, if any.
     * @param {Object.<String, module:model/{'String': PartitionProperty}>} data The data returned by the service call.
     * @param {String} response The complete HTTP response.
     */

    /**
     * Get Single Partition
     * By passing in a partition Id, you can retrieve the partition information. 
     * @param {String} partitionId partitionId
     * @param {module:api/PartitionApi~getUsingGETCallback} callback The callback function, accepting three arguments: error, data, response
     * data is of type: {@link Object.<String, module:model/{'String': PartitionProperty}>}
     */
    this.getUsingGET = function(partitionId, callback) {
      var postBody = null;

      // verify the required parameter 'partitionId' is set
      if (partitionId === undefined || partitionId === null) {
        throw new Error("Missing the required parameter 'partitionId' when calling getUsingGET");
      }


      var pathParams = {
        'partitionId': partitionId
      };
      var queryParams = {
      };
      var collectionQueryParams = {
      };
      var headerParams = {
      };
      var formParams = {
      };

      var authNames = ['Bearer'];
      var contentTypes = ['application/json'];
      var accepts = ['application/json'];
      var returnType = {'String': PartitionProperty};

      return this.apiClient.callApi(
        '/api/partition/v1/partitions/{partitionId}', 'GET',
        pathParams, queryParams, collectionQueryParams, headerParams, formParams, postBody,
        authNames, contentTypes, accepts, returnType, callback
      );
    }

    /**
     * Callback function to receive the result of the listUsingGET operation.
     * @callback module:api/PartitionApi~listUsingGETCallback
     * @param {String} error Error message, if any.
     * @param {Array.<'String'>} data The data returned by the service call.
     * @param {String} response The complete HTTP response.
     */

    /**
     * List Partitions
     * @param {module:api/PartitionApi~listUsingGETCallback} callback The callback function, accepting three arguments: error, data, response
     * data is of type: {@link Array.<'String'>}
     */
    this.listUsingGET = function(callback) {
      var postBody = null;


      var pathParams = {
      };
      var queryParams = {
      };
      var collectionQueryParams = {
      };
      var headerParams = {
      };
      var formParams = {
      };

      var authNames = ['Bearer'];
      var contentTypes = ['application/json'];
      var accepts = ['application/json'];
      var returnType = ['String'];

      return this.apiClient.callApi(
        '/api/partition/v1/partitions', 'GET',
        pathParams, queryParams, collectionQueryParams, headerParams, formParams, postBody,
        authNames, contentTypes, accepts, returnType, callback
      );
    }

    /**
     * Callback function to receive the result of the updateUsingPATCH operation.
     * @callback module:api/PartitionApi~updateUsingPATCHCallback
     * @param {String} error Error message, if any.
     * @param data This operation does not return a value.
     * @param {String} response The complete HTTP response.
     */

    /**
     * Update Partition
     * By passing in a partition Id and a partition info object you can update a partition. 
     * @param {String} partitionId partitionId
     * @param {module:model/PartitionDto} partitionInfo partitionInfo
     * @param {module:api/PartitionApi~updateUsingPATCHCallback} callback The callback function, accepting three arguments: error, data, response
     */
    this.updateUsingPATCH = function(partitionId, partitionInfo, callback) {
      var postBody = partitionInfo;

      // verify the required parameter 'partitionId' is set
      if (partitionId === undefined || partitionId === null) {
        throw new Error("Missing the required parameter 'partitionId' when calling updateUsingPATCH");
      }

      // verify the required parameter 'partitionInfo' is set
      if (partitionInfo === undefined || partitionInfo === null) {
        throw new Error("Missing the required parameter 'partitionInfo' when calling updateUsingPATCH");
      }


      var pathParams = {
        'partitionId': partitionId
      };
      var queryParams = {
      };
      var collectionQueryParams = {
      };
      var headerParams = {
      };
      var formParams = {
      };

      var authNames = ['Bearer'];
      var contentTypes = ['application/json'];
      var accepts = ['application/json'];
      var returnType = null;

      return this.apiClient.callApi(
        '/api/partition/v1/partitions/{partitionId}', 'PATCH',
        pathParams, queryParams, collectionQueryParams, headerParams, formParams, postBody,
        authNames, contentTypes, accepts, returnType, callback
      );
    }
  };

  return exports;
}));
