/*
 * self-managed-osdu
 * Rest API Documentation for Self Managed OSDU
 *
 * OpenAPI spec version: 0.11.0
 * 
 *
 * NOTE: This class is auto generated by the swagger code generator program.
 * https://github.com/swagger-api/swagger-codegen.git
 * Do not edit the class manually.
 */


package osdu.client.api;

import osdu.client.ApiException;
import osdu.client.model.RegisterAction;
import osdu.client.model.RegisterAppError;
import osdu.client.model.RegisterCreateAction;
import osdu.client.model.RegisterDdms;
import osdu.client.model.RegisterGetSubscriptionResult;
import osdu.client.model.RegisterRecord;
import osdu.client.model.RegisterSecret;
import osdu.client.model.RegisterSubscription;
import osdu.client.model.RegisterSubscriptionCreateResult;
import osdu.client.model.RegisterTestAction;
import osdu.client.model.RegisterTestActionResult;
import osdu.client.model.RegisterTopic;
import org.junit.Test;
import org.junit.Ignore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * API tests for RegisterApi
 */
@Ignore
public class RegisterApiTest {

    private final RegisterApi api = new RegisterApi();

    
    /**
     * Create a DDMS registration
     *
     * Create a DDMS registration using an OpenApi spec V3 document. Required roles: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void createADDMSRegistrationTest() throws ApiException {
        String dataPartitionId = null;
        RegisterDdms body = null;
        RegisterDdms response = api.createADDMSRegistration(dataPartitionId, body);

        // TODO: test validations
    }
    
    /**
     * Create a subscription
     *
     * Create a subscription. Required roles: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void createASubscriptionTest() throws ApiException {
        String dataPartitionId = null;
        RegisterSubscription body = null;
        RegisterSubscriptionCreateResult response = api.createASubscription(dataPartitionId, body);

        // TODO: test validations
    }
    
    /**
     * Create an action registration
     *
     * Create an action registration. Required role: &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void createAnActionRegistrationTest() throws ApiException {
        String dataPartitionId = null;
        RegisterCreateAction body = null;
        RegisterAction response = api.createAnActionRegistration(dataPartitionId, body);

        // TODO: test validations
    }
    
    /**
     * Delete a DDMS registration
     *
     * Delete a DDMS registration with the given id. Required roles: &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void deleteADDMSRegistrationTest() throws ApiException {
        String id = null;
        String dataPartitionId = null;
        api.deleteADDMSRegistration(id, dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * Delete a subscription
     *
     * Delete a subscription with its Id. Required role: &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void deleteASubscriptionByIdTest() throws ApiException {
        String id = null;
        String dataPartitionId = null;
        api.deleteASubscriptionById(id, dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * Delete an action  registration
     *
     * Delete an action registration with the given id. Required role: &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void deleteAnActionRegistrationTest() throws ApiException {
        String id = null;
        String dataPartitionId = null;
        api.deleteAnActionRegistration(id, dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * Get a DDMS registration
     *
     * Get a DDMS registration with the given id. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void getADDMSRegistrationTest() throws ApiException {
        String id = null;
        String dataPartitionId = null;
        RegisterDdms response = api.getADDMSRegistration(id, dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * Get a subscription
     *
     * Get a subscription with its Id. Required role: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void getASubscriptionByIdTest() throws ApiException {
        String id = null;
        String dataPartitionId = null;
        RegisterGetSubscriptionResult response = api.getASubscriptionById(id, dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * Get an action registration
     *
     * Get an action registration with the given id. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void getAnActionRegistrationTest() throws ApiException {
        String id = null;
        String dataPartitionId = null;
        RegisterAction response = api.getAnActionRegistration(id, dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * List all topics
     *
     * List all topics that you can create a subscription for, along with the corresponding sample messages. Required role: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void listAllTopicsTest() throws ApiException {
        String dataPartitionId = null;
        List<RegisterTopic> response = api.listAllTopics(dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * Query for DDMS registrations
     *
     * Query for DDMS registrations allowing retrievals by type. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void queryADDMSRegistrationTest() throws ApiException {
        String type = null;
        String dataPartitionId = null;
        List<RegisterDdms> response = api.queryADDMSRegistration(type, dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * Query for action registrations and substitutes any action with the given parameters
     *
     * Retrieve an action registration. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void retrieveAnActionRegistrationTest() throws ApiException {
        String dataPartitionId = null;
        RegisterRecord body = null;
        List<RegisterAction> response = api.retrieveAnActionRegistration(dataPartitionId, body);

        // TODO: test validations
    }
    
    /**
     * Test an action registration
     *
     * Test an action registration. Required roles: &#39;users.datalake.viewers&#39; or &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void testAnActionRegistrationTest() throws ApiException {
        String dataPartitionId = null;
        RegisterTestAction body = null;
        RegisterTestActionResult response = api.testAnActionRegistration(dataPartitionId, body);

        // TODO: test validations
    }
    
    /**
     * Update secret for subscription
     *
     * Update secret for a subscription. Required role: &#39;users.datalake.editors&#39; or &#39;users.datalake.admins&#39;
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void updateSecretForSubscriptionTest() throws ApiException {
        String id = null;
        String dataPartitionId = null;
        RegisterSecret body = null;
        api.updateSecretForSubscription(id, dataPartitionId, body);

        // TODO: test validations
    }
    
}
