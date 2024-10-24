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
      <response_schema>
      """

    Examples:
      | request_body                           | status_code | response_schema                                  |
      | {"type":"ProductOrder","id":"12345"}   |         200 | {"message":"Product order information received"} |
      | {"type":"ServiceRequest","id":"67890"} |         400 | {"error":"Invalid request format"}               |
