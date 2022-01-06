/* 
 * self-managed-osdu
 *
 * Rest API Documentation for Self Managed OSDU
 *
 * OpenAPI spec version: 0.11.0
 * 
 * Generated by: https://github.com/swagger-api/swagger-codegen.git
 */

using System;
using System.Collections.Generic;
using System.Collections.ObjectModel;
using System.Linq;
using RestSharp;
using IO.Swagger.Client;
using IO.Swagger.Model;

namespace IO.Swagger.Api
{
    /// <summary>
    /// Represents a collection of functions to interact with the API endpoints
    /// </summary>
    public interface IFileServiceInternalApi : IApiAccessor
    {
        #region Synchronous Operations
        /// <summary>
        /// 
        /// </summary>
        /// <remarks>
        /// Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.
        /// </remarks>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>FileListResponse</returns>
        FileListResponse AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_ (string dataPartitionId, FileListRequest body = null);

        /// <summary>
        /// 
        /// </summary>
        /// <remarks>
        /// Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.
        /// </remarks>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>ApiResponse of FileListResponse</returns>
        ApiResponse<FileListResponse> AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_WithHttpInfo (string dataPartitionId, FileListRequest body = null);
        /// <summary>
        /// 
        /// </summary>
        /// <remarks>
        /// Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.
        /// </remarks>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>FileLocationResponse</returns>
        FileLocationResponse ReturnsFileLocationAndDriver_ (string dataPartitionId, FileLocationRequest body = null);

        /// <summary>
        /// 
        /// </summary>
        /// <remarks>
        /// Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.
        /// </remarks>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>ApiResponse of FileLocationResponse</returns>
        ApiResponse<FileLocationResponse> ReturnsFileLocationAndDriver_WithHttpInfo (string dataPartitionId, FileLocationRequest body = null);
        #endregion Synchronous Operations
        #region Asynchronous Operations
        /// <summary>
        /// 
        /// </summary>
        /// <remarks>
        /// Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.
        /// </remarks>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>Task of FileListResponse</returns>
        System.Threading.Tasks.Task<FileListResponse> AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_Async (string dataPartitionId, FileListRequest body = null);

        /// <summary>
        /// 
        /// </summary>
        /// <remarks>
        /// Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.
        /// </remarks>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>Task of ApiResponse (FileListResponse)</returns>
        System.Threading.Tasks.Task<ApiResponse<FileListResponse>> AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_AsyncWithHttpInfo (string dataPartitionId, FileListRequest body = null);
        /// <summary>
        /// 
        /// </summary>
        /// <remarks>
        /// Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.
        /// </remarks>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>Task of FileLocationResponse</returns>
        System.Threading.Tasks.Task<FileLocationResponse> ReturnsFileLocationAndDriver_Async (string dataPartitionId, FileLocationRequest body = null);

        /// <summary>
        /// 
        /// </summary>
        /// <remarks>
        /// Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.
        /// </remarks>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>Task of ApiResponse (FileLocationResponse)</returns>
        System.Threading.Tasks.Task<ApiResponse<FileLocationResponse>> ReturnsFileLocationAndDriver_AsyncWithHttpInfo (string dataPartitionId, FileLocationRequest body = null);
        #endregion Asynchronous Operations
    }

    /// <summary>
    /// Represents a collection of functions to interact with the API endpoints
    /// </summary>
    public partial class FileServiceInternalApi : IFileServiceInternalApi
    {
        private IO.Swagger.Client.ExceptionFactory _exceptionFactory = (name, response) => null;

        /// <summary>
        /// Initializes a new instance of the <see cref="FileServiceInternalApi"/> class.
        /// </summary>
        /// <returns></returns>
        public FileServiceInternalApi(String basePath)
        {
            this.Configuration = new IO.Swagger.Client.Configuration { BasePath = basePath };

            ExceptionFactory = IO.Swagger.Client.Configuration.DefaultExceptionFactory;
        }

        /// <summary>
        /// Initializes a new instance of the <see cref="FileServiceInternalApi"/> class
        /// using Configuration object
        /// </summary>
        /// <param name="configuration">An instance of Configuration</param>
        /// <returns></returns>
        public FileServiceInternalApi(IO.Swagger.Client.Configuration configuration = null)
        {
            if (configuration == null) // use the default one in Configuration
                this.Configuration = IO.Swagger.Client.Configuration.Default;
            else
                this.Configuration = configuration;

            ExceptionFactory = IO.Swagger.Client.Configuration.DefaultExceptionFactory;
        }

        /// <summary>
        /// Gets the base path of the API client.
        /// </summary>
        /// <value>The base path</value>
        public String GetBasePath()
        {
            return this.Configuration.ApiClient.RestClient.BaseUrl.ToString();
        }

        /// <summary>
        /// Sets the base path of the API client.
        /// </summary>
        /// <value>The base path</value>
        [Obsolete("SetBasePath is deprecated, please do 'Configuration.ApiClient = new ApiClient(\"http://new-path\")' instead.")]
        public void SetBasePath(String basePath)
        {
            // do nothing
        }

        /// <summary>
        /// Gets or sets the configuration object
        /// </summary>
        /// <value>An instance of the Configuration</value>
        public IO.Swagger.Client.Configuration Configuration {get; set;}

        /// <summary>
        /// Provides a factory method hook for the creation of exceptions.
        /// </summary>
        public IO.Swagger.Client.ExceptionFactory ExceptionFactory
        {
            get
            {
                if (_exceptionFactory != null && _exceptionFactory.GetInvocationList().Length > 1)
                {
                    throw new InvalidOperationException("Multicast delegate for ExceptionFactory is unsupported.");
                }
                return _exceptionFactory;
            }
            set { _exceptionFactory = value; }
        }

        /// <summary>
        /// Gets the default header.
        /// </summary>
        /// <returns>Dictionary of HTTP header</returns>
        [Obsolete("DefaultHeader is deprecated, please use Configuration.DefaultHeader instead.")]
        public IDictionary<String, String> DefaultHeader()
        {
            return new ReadOnlyDictionary<string, string>(this.Configuration.DefaultHeader);
        }

        /// <summary>
        /// Add default header.
        /// </summary>
        /// <param name="key">Header field name.</param>
        /// <param name="value">Header field value.</param>
        /// <returns></returns>
        [Obsolete("AddDefaultHeader is deprecated, please use Configuration.AddDefaultHeader instead.")]
        public void AddDefaultHeader(string key, string value)
        {
            this.Configuration.AddDefaultHeader(key, value);
        }

        /// <summary>
        ///  Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.
        /// </summary>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>FileListResponse</returns>
        public FileListResponse AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_ (string dataPartitionId, FileListRequest body = null)
        {
             ApiResponse<FileListResponse> localVarResponse = AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_WithHttpInfo(dataPartitionId, body);
             return localVarResponse.Data;
        }

        /// <summary>
        ///  Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.
        /// </summary>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>ApiResponse of FileListResponse</returns>
        public ApiResponse< FileListResponse > AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_WithHttpInfo (string dataPartitionId, FileListRequest body = null)
        {
            // verify the required parameter 'dataPartitionId' is set
            if (dataPartitionId == null)
                throw new ApiException(400, "Missing required parameter 'dataPartitionId' when calling FileServiceInternalApi->AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_");

            var localVarPath = "/api/file/v2/getFileList";
            var localVarPathParams = new Dictionary<String, String>();
            var localVarQueryParams = new List<KeyValuePair<String, String>>();
            var localVarHeaderParams = new Dictionary<String, String>(this.Configuration.DefaultHeader);
            var localVarFormParams = new Dictionary<String, String>();
            var localVarFileParams = new Dictionary<String, FileParameter>();
            Object localVarPostBody = null;

            // to determine the Content-Type header
            String[] localVarHttpContentTypes = new String[] {
                "application/json"
            };
            String localVarHttpContentType = this.Configuration.ApiClient.SelectHeaderContentType(localVarHttpContentTypes);

            // to determine the Accept header
            String[] localVarHttpHeaderAccepts = new String[] {
                "application/json"
            };
            String localVarHttpHeaderAccept = this.Configuration.ApiClient.SelectHeaderAccept(localVarHttpHeaderAccepts);
            if (localVarHttpHeaderAccept != null)
                localVarHeaderParams.Add("Accept", localVarHttpHeaderAccept);

            if (dataPartitionId != null) localVarHeaderParams.Add("data-partition-id", this.Configuration.ApiClient.ParameterToString(dataPartitionId)); // header parameter
            if (body != null && body.GetType() != typeof(byte[]))
            {
                localVarPostBody = this.Configuration.ApiClient.Serialize(body); // http body (model) parameter
            }
            else
            {
                localVarPostBody = body; // byte array
            }

            // authentication (Bearer) required
            if (!String.IsNullOrEmpty(this.Configuration.GetApiKeyWithPrefix("Authorization")))
            {
                localVarHeaderParams["Authorization"] = this.Configuration.GetApiKeyWithPrefix("Authorization");
            }

            // make the HTTP request
            IRestResponse localVarResponse = (IRestResponse) this.Configuration.ApiClient.CallApi(localVarPath,
                Method.POST, localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarFileParams,
                localVarPathParams, localVarHttpContentType);

            int localVarStatusCode = (int) localVarResponse.StatusCode;

            if (ExceptionFactory != null)
            {
                Exception exception = ExceptionFactory("AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_", localVarResponse);
                if (exception != null) throw exception;
            }

            return new ApiResponse<FileListResponse>(localVarStatusCode,
                localVarResponse.Headers.ToDictionary(x => x.Name, x => x.Value.ToString()),
                (FileListResponse) this.Configuration.ApiClient.Deserialize(localVarResponse, typeof(FileListResponse)));
        }

        /// <summary>
        ///  Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.
        /// </summary>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>Task of FileListResponse</returns>
        public async System.Threading.Tasks.Task<FileListResponse> AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_Async (string dataPartitionId, FileListRequest body = null)
        {
             ApiResponse<FileListResponse> localVarResponse = await AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_AsyncWithHttpInfo(dataPartitionId, body);
             return localVarResponse.Data;

        }

        /// <summary>
        ///  Allows the application to audit the attempted file uploads. The method is internal and is not available for third-party applications.
        /// </summary>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>Task of ApiResponse (FileListResponse)</returns>
        public async System.Threading.Tasks.Task<ApiResponse<FileListResponse>> AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_AsyncWithHttpInfo (string dataPartitionId, FileListRequest body = null)
        {
            // verify the required parameter 'dataPartitionId' is set
            if (dataPartitionId == null)
                throw new ApiException(400, "Missing required parameter 'dataPartitionId' when calling FileServiceInternalApi->AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_");

            var localVarPath = "/api/file/v2/getFileList";
            var localVarPathParams = new Dictionary<String, String>();
            var localVarQueryParams = new List<KeyValuePair<String, String>>();
            var localVarHeaderParams = new Dictionary<String, String>(this.Configuration.DefaultHeader);
            var localVarFormParams = new Dictionary<String, String>();
            var localVarFileParams = new Dictionary<String, FileParameter>();
            Object localVarPostBody = null;

            // to determine the Content-Type header
            String[] localVarHttpContentTypes = new String[] {
                "application/json"
            };
            String localVarHttpContentType = this.Configuration.ApiClient.SelectHeaderContentType(localVarHttpContentTypes);

            // to determine the Accept header
            String[] localVarHttpHeaderAccepts = new String[] {
                "application/json"
            };
            String localVarHttpHeaderAccept = this.Configuration.ApiClient.SelectHeaderAccept(localVarHttpHeaderAccepts);
            if (localVarHttpHeaderAccept != null)
                localVarHeaderParams.Add("Accept", localVarHttpHeaderAccept);

            if (dataPartitionId != null) localVarHeaderParams.Add("data-partition-id", this.Configuration.ApiClient.ParameterToString(dataPartitionId)); // header parameter
            if (body != null && body.GetType() != typeof(byte[]))
            {
                localVarPostBody = this.Configuration.ApiClient.Serialize(body); // http body (model) parameter
            }
            else
            {
                localVarPostBody = body; // byte array
            }

            // authentication (Bearer) required
            if (!String.IsNullOrEmpty(this.Configuration.GetApiKeyWithPrefix("Authorization")))
            {
                localVarHeaderParams["Authorization"] = this.Configuration.GetApiKeyWithPrefix("Authorization");
            }

            // make the HTTP request
            IRestResponse localVarResponse = (IRestResponse) await this.Configuration.ApiClient.CallApiAsync(localVarPath,
                Method.POST, localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarFileParams,
                localVarPathParams, localVarHttpContentType);

            int localVarStatusCode = (int) localVarResponse.StatusCode;

            if (ExceptionFactory != null)
            {
                Exception exception = ExceptionFactory("AllowsTheApplicationToAuditTheAttemptedFileUploadsTheMethodIsInternalAndIsNotAvailableForThirdPartyApplications_", localVarResponse);
                if (exception != null) throw exception;
            }

            return new ApiResponse<FileListResponse>(localVarStatusCode,
                localVarResponse.Headers.ToDictionary(x => x.Name, x => x.Value.ToString()),
                (FileListResponse) this.Configuration.ApiClient.Deserialize(localVarResponse, typeof(FileListResponse)));
        }

        /// <summary>
        ///  Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.
        /// </summary>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>FileLocationResponse</returns>
        public FileLocationResponse ReturnsFileLocationAndDriver_ (string dataPartitionId, FileLocationRequest body = null)
        {
             ApiResponse<FileLocationResponse> localVarResponse = ReturnsFileLocationAndDriver_WithHttpInfo(dataPartitionId, body);
             return localVarResponse.Data;
        }

        /// <summary>
        ///  Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.
        /// </summary>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>ApiResponse of FileLocationResponse</returns>
        public ApiResponse< FileLocationResponse > ReturnsFileLocationAndDriver_WithHttpInfo (string dataPartitionId, FileLocationRequest body = null)
        {
            // verify the required parameter 'dataPartitionId' is set
            if (dataPartitionId == null)
                throw new ApiException(400, "Missing required parameter 'dataPartitionId' when calling FileServiceInternalApi->ReturnsFileLocationAndDriver_");

            var localVarPath = "/api/file/v2/getFileLocation";
            var localVarPathParams = new Dictionary<String, String>();
            var localVarQueryParams = new List<KeyValuePair<String, String>>();
            var localVarHeaderParams = new Dictionary<String, String>(this.Configuration.DefaultHeader);
            var localVarFormParams = new Dictionary<String, String>();
            var localVarFileParams = new Dictionary<String, FileParameter>();
            Object localVarPostBody = null;

            // to determine the Content-Type header
            String[] localVarHttpContentTypes = new String[] {
                "application/json"
            };
            String localVarHttpContentType = this.Configuration.ApiClient.SelectHeaderContentType(localVarHttpContentTypes);

            // to determine the Accept header
            String[] localVarHttpHeaderAccepts = new String[] {
                "application/json"
            };
            String localVarHttpHeaderAccept = this.Configuration.ApiClient.SelectHeaderAccept(localVarHttpHeaderAccepts);
            if (localVarHttpHeaderAccept != null)
                localVarHeaderParams.Add("Accept", localVarHttpHeaderAccept);

            if (dataPartitionId != null) localVarHeaderParams.Add("data-partition-id", this.Configuration.ApiClient.ParameterToString(dataPartitionId)); // header parameter
            if (body != null && body.GetType() != typeof(byte[]))
            {
                localVarPostBody = this.Configuration.ApiClient.Serialize(body); // http body (model) parameter
            }
            else
            {
                localVarPostBody = body; // byte array
            }

            // authentication (Bearer) required
            if (!String.IsNullOrEmpty(this.Configuration.GetApiKeyWithPrefix("Authorization")))
            {
                localVarHeaderParams["Authorization"] = this.Configuration.GetApiKeyWithPrefix("Authorization");
            }

            // make the HTTP request
            IRestResponse localVarResponse = (IRestResponse) this.Configuration.ApiClient.CallApi(localVarPath,
                Method.POST, localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarFileParams,
                localVarPathParams, localVarHttpContentType);

            int localVarStatusCode = (int) localVarResponse.StatusCode;

            if (ExceptionFactory != null)
            {
                Exception exception = ExceptionFactory("ReturnsFileLocationAndDriver_", localVarResponse);
                if (exception != null) throw exception;
            }

            return new ApiResponse<FileLocationResponse>(localVarStatusCode,
                localVarResponse.Headers.ToDictionary(x => x.Name, x => x.Value.ToString()),
                (FileLocationResponse) this.Configuration.ApiClient.Deserialize(localVarResponse, typeof(FileLocationResponse)));
        }

        /// <summary>
        ///  Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.
        /// </summary>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>Task of FileLocationResponse</returns>
        public async System.Threading.Tasks.Task<FileLocationResponse> ReturnsFileLocationAndDriver_Async (string dataPartitionId, FileLocationRequest body = null)
        {
             ApiResponse<FileLocationResponse> localVarResponse = await ReturnsFileLocationAndDriver_AsyncWithHttpInfo(dataPartitionId, body);
             return localVarResponse.Data;

        }

        /// <summary>
        ///  Returns file &#x60;Location&#x60; and &#x60;Driver&#x60;.
        /// </summary>
        /// <exception cref="IO.Swagger.Client.ApiException">Thrown when fails to make API call</exception>
        /// <param name="dataPartitionId">Specifies the data partition to use. This should either be the partition name or crm account ID associated with the partition.</param>
        /// <param name="body"> (optional)</param>
        /// <returns>Task of ApiResponse (FileLocationResponse)</returns>
        public async System.Threading.Tasks.Task<ApiResponse<FileLocationResponse>> ReturnsFileLocationAndDriver_AsyncWithHttpInfo (string dataPartitionId, FileLocationRequest body = null)
        {
            // verify the required parameter 'dataPartitionId' is set
            if (dataPartitionId == null)
                throw new ApiException(400, "Missing required parameter 'dataPartitionId' when calling FileServiceInternalApi->ReturnsFileLocationAndDriver_");

            var localVarPath = "/api/file/v2/getFileLocation";
            var localVarPathParams = new Dictionary<String, String>();
            var localVarQueryParams = new List<KeyValuePair<String, String>>();
            var localVarHeaderParams = new Dictionary<String, String>(this.Configuration.DefaultHeader);
            var localVarFormParams = new Dictionary<String, String>();
            var localVarFileParams = new Dictionary<String, FileParameter>();
            Object localVarPostBody = null;

            // to determine the Content-Type header
            String[] localVarHttpContentTypes = new String[] {
                "application/json"
            };
            String localVarHttpContentType = this.Configuration.ApiClient.SelectHeaderContentType(localVarHttpContentTypes);

            // to determine the Accept header
            String[] localVarHttpHeaderAccepts = new String[] {
                "application/json"
            };
            String localVarHttpHeaderAccept = this.Configuration.ApiClient.SelectHeaderAccept(localVarHttpHeaderAccepts);
            if (localVarHttpHeaderAccept != null)
                localVarHeaderParams.Add("Accept", localVarHttpHeaderAccept);

            if (dataPartitionId != null) localVarHeaderParams.Add("data-partition-id", this.Configuration.ApiClient.ParameterToString(dataPartitionId)); // header parameter
            if (body != null && body.GetType() != typeof(byte[]))
            {
                localVarPostBody = this.Configuration.ApiClient.Serialize(body); // http body (model) parameter
            }
            else
            {
                localVarPostBody = body; // byte array
            }

            // authentication (Bearer) required
            if (!String.IsNullOrEmpty(this.Configuration.GetApiKeyWithPrefix("Authorization")))
            {
                localVarHeaderParams["Authorization"] = this.Configuration.GetApiKeyWithPrefix("Authorization");
            }

            // make the HTTP request
            IRestResponse localVarResponse = (IRestResponse) await this.Configuration.ApiClient.CallApiAsync(localVarPath,
                Method.POST, localVarQueryParams, localVarPostBody, localVarHeaderParams, localVarFormParams, localVarFileParams,
                localVarPathParams, localVarHttpContentType);

            int localVarStatusCode = (int) localVarResponse.StatusCode;

            if (ExceptionFactory != null)
            {
                Exception exception = ExceptionFactory("ReturnsFileLocationAndDriver_", localVarResponse);
                if (exception != null) throw exception;
            }

            return new ApiResponse<FileLocationResponse>(localVarStatusCode,
                localVarResponse.Headers.ToDictionary(x => x.Name, x => x.Value.ToString()),
                (FileLocationResponse) this.Configuration.ApiClient.Deserialize(localVarResponse, typeof(FileLocationResponse)));
        }

    }
}