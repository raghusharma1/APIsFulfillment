# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=98c6afd708
# 
# 

# ********RoostGPT********
Feature: Test /productOrder API for various scenarios

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Test POST /productOrder with valid inputs
    Given path '/productOrder'
    And request
      """
      <request_body>
      """
    When method post
    Then status 201
    And match response ==
      """
      <expected_response>
      """

    Examples:
      | read('productOrder_post.csv') |
