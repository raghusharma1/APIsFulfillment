# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/cancelProductOrderCreateEvent_post for http method type POST 
# RoostTestHash=7601d79448
# 
# 

# ********RoostGPT********
Feature: Cancel Product Order Create Event By Client

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }
    * url urlBase

  Scenario Outline: Verify successful cancellation of product order creation event
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method POST
    Then status 204
    And match response == '#null'
    And match responseHeaders['Content-Type'][0] == 'application/json'

    Examples:
      | read('listener_cancelProductOrderCreateEvent_post.csv') |

  Scenario Outline: Verify unauthorized access to cancel product order creation event
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method POST
    Then status 401

    Examples:
      | requestBody                                                                                                                                                                                                                          |
      | { "notification": { "date": "2023-10-04T14:48:00Z", "customer": { "subscriberId": "1234567890" }, "order": { "id": "20230315000001", "associatedDocument": "VTT001", "description": "Ordem encerrada com sucesso", "code": "0" } } } |

  Scenario Outline: Verify bad request response when mandatory fields are missing
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method POST
    Then status 400

    Examples:
      | requestBody                                                                                 |
      | { "notification": { "order": { "id": "20230315000001", "associatedDocument": "VTT001" } } } |

  Scenario Outline: Verify server error during cancellation of product order creation event
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method POST
    Then status 500

    Examples:
      | requestBody                                                                                                                                                                                                                          |
      | { "notification": { "date": "2023-10-04T14:48:00Z", "customer": { "subscriberId": "1234567890" }, "order": { "id": "20230315000001", "associatedDocument": "VTT001", "description": "Ordem encerrada com sucesso", "code": "0" } } } |
