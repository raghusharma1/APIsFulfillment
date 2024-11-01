# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderStateChangeEvent_post for http method type POST 
# RoostTestHash=a9bfb68d42
# 
# 

# ********RoostGPT********
Feature: State Change Event By Client

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Verify state change event notifications with valid input data
    Given path '/listener/productOrderStateChangeEvent'
    And request
      """
      <body>
      """
    When method post
    Then status 204
    And match responseHeaders['Content-Type'][0] == 'application/json'
    And match response == '#null'

    Examples:
      | read('listener_productOrderStateChangeEvent_post.csv') |
