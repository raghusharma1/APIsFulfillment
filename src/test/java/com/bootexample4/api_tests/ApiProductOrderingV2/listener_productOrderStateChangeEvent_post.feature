# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderStateChangeEvent_post for http method type POST 
# RoostTestHash=a9bfb68d42
# 
# 

# ********RoostGPT********
Feature: Test Product Order State Change Event API

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Validate successful state change notifications
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      <request_body>
      """
    When method post
    Then status 204

    Examples:
      | read('listener_productOrderStateChangeEvent_post.csv') |

  Scenario Outline: Validate various error responses for state change notifications
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      <request_body>
      """
    When method post
    Then status <response_code>

    Examples:
      | request_body                        | response_code |
      | {"error": "Invalid request format"} |           400 |
      | {"error": "Unauthorized access"}    |           401 |
      | {"error": "Resource not found"}     |           404 |
      | {"error": "Internal server error"}  |           500 |
