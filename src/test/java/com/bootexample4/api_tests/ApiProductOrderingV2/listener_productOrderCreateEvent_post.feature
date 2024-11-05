# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderCreateEvent_post for http method type POST 
# RoostTestHash=5d5b9532f3
# 
# 

# ********RoostGPT********
Feature: Testing Product Order Create Event API

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Testing POST method with valid input payloads for Product Order Create Event
    Given url urlBase + '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status <expectedStatus>
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | requestBody                                                                                                                                                | expectedStatus | expectedResponse                                  |
      | { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } } |            204 | { "message": "Operation completed successfully" } |
      | { "notification": { "date": "2021-06-06T15:00:00-03:00", "order": { "associatedDocument": "VTT002", "correlationOrder": "11", "id": "20230315000002" } } } |            400 | { "message": "BadRequest" }                       |

  Scenario: Testing GET method not allowed for Product Order Create Event
    Given url urlBase + '/listener/productOrderCreateEvent'
    When method get
    Then status 405

  Scenario: Testing DELETE method not allowed for Product Order Create Event
    Given url urlBase + '/listener/productOrderCreateEvent'
    When method delete
    Then status 405

  Scenario: Testing PUT method not allowed for Product Order Create Event
    Given url urlBase + '/listener/productOrderCreateEvent'
    When method put
    Then status 405
