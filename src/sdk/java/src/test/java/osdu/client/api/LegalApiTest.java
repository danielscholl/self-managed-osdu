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
import osdu.client.model.LegalTagDto;
import osdu.client.model.LegalTagDtos;
import osdu.client.model.LegalTagInvalidResponseList;
import osdu.client.model.LegalTagPropertyValues;
import osdu.client.model.LegalTagRequest;
import osdu.client.model.LegalTagUpdateDto;
import org.junit.Test;
import org.junit.Ignore;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * API tests for LegalApi
 */
@Ignore
public class LegalApiTest {

    private final LegalApi api = new LegalApi();

    
    /**
     * Creates the LegalTag for the given &#39;name&#39;.
     *
     * This allows for the creation of your LegalTag. There can only be 1 LegalTag per &#39;name&#39;. A LegalTag must be created before you can start ingesting data for that name.
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void createLegalTagTest() throws ApiException {
        String osDUAccountId = null;
        LegalTagDto body = null;
        String osDUOnBehalfOf = null;
        LegalTagDto response = api.createLegalTag(osDUAccountId, body, osDUOnBehalfOf);

        // TODO: test validations
    }
    
    /**
     * Delete Legal Tag
     *
     * This allows for the deletion of your LegalTag using the &#39;name&#39; associated with it. 
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void deleteLegalTagTest() throws ApiException {
        String dataPartitionId = null;
        String name = null;
        api.deleteLegalTag(dataPartitionId, name);

        // TODO: test validations
    }
    
    /**
     * Gets a LegalTag for the given &#39;name&#39;.
     *
     * This allows for the retrieval of your LegalTag using the &#39;name&#39; associated with it.
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void getLegalTagTest() throws ApiException {
        String dataPartitionId = null;
        String name = null;
        LegalTagDto response = api.getLegalTag(dataPartitionId, name);

        // TODO: test validations
    }
    
    /**
     * Gets LegalTag property values.
     *
     * This allows for the retrieval of allowed values for LegalTag properties.
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void getLegalTagPropertiesTest() throws ApiException {
        String dataPartitionId = null;
        LegalTagPropertyValues response = api.getLegalTagProperties(dataPartitionId);

        // TODO: test validations
    }
    
    /**
     * Retrieves the LegalTags for the given names.
     *
     * This allows for the retrieval of your LegalTags using the &#39;name&#39; associated with it. A maximum of 25 can be retrieved at once.
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void getLegalTagsTest() throws ApiException {
        String osDUAccountId = null;
        LegalTagRequest body = null;
        String osDUOnBehalfOf = null;
        LegalTagDtos response = api.getLegalTags(osDUAccountId, body, osDUOnBehalfOf);

        // TODO: test validations
    }
    
    /**
     * Gets all LegalTags.
     *
     * This allows for the retrieval of all LegalTags.
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void listLegalTagsTest() throws ApiException {
        String osDUAccountId = null;
        Boolean valid = null;
        String osDUOnBehalfOf = null;
        LegalTagDtos response = api.listLegalTags(osDUAccountId, valid, osDUOnBehalfOf);

        // TODO: test validations
    }
    
    /**
     * Updates the LegalTag for the given &#39;name&#39;.
     *
     * This allows to update certain properties of your LegalTag using the &#39;name&#39; associated with it.
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void updateLegalTagTest() throws ApiException {
        String osDUAccountId = null;
        LegalTagUpdateDto body = null;
        String osDUOnBehalfOf = null;
        LegalTagDto response = api.updateLegalTag(osDUAccountId, body, osDUOnBehalfOf);

        // TODO: test validations
    }
    
    /**
     * Retrieves the invalid LegalTag names with reasons for the given names.
     *
     * This allows for the retrieval of the reason why your LegalTag is not valid. A maximum of 25 can be retrieved at once.
     *
     * @throws ApiException
     *          if the Api call fails
     */
    @Test
    public void validateLegalTagsTest() throws ApiException {
        String osDUAccountId = null;
        LegalTagRequest body = null;
        String osDUOnBehalfOf = null;
        LegalTagInvalidResponseList response = api.validateLegalTags(osDUAccountId, body, osDUOnBehalfOf);

        // TODO: test validations
    }
    
}
