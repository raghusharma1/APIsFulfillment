# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderInformationRequiredEvent_post for http method type POST 
# RoostTestHash=ce4c08f30f
# 
# 

# ********RoostGPT********
Feature: Test Product Order Information Required Event API

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Testing POST request with various notifications
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      <request_body>
      """
    When method post
    Then status <status_code>
    And match response contains
      """
      <response_body>
      """

    Examples:
      | request_body                                                                                             | status_code | response_body                                                                                            |
      | {"notification":{"order":{"associatedDocument":"VTT001","correlationOrder":"10","id":"20230315000001"}}} |         204 | {"notification":{"order":{"associatedDocument":"VTT001","correlationOrder":"10","id":"20230315000001"}}} |
      | {"notification":{"order":{"associatedDocument":"VTT002","correlationOrder":"11","id":"20230315000002"}}} |         400 | {"error":"Invalid request parameters"}                                                                   |

  Scenario: Testing GET request on the endpoint
    Given path '/listener/productOrderInformationRequiredEvent'
    When method get
    Then status 401

  Scenario: Testing Unauthorized Access
    Given path '/listener/productOrderInformationRequiredEvent'
    And configure headers = {}
    And request
      """
      {"notification":{"order":{"associatedDocument":"VTT001","correlationOrder":"10","id":"20230315000001"}}}
      """
    When method post
    Then status 401
