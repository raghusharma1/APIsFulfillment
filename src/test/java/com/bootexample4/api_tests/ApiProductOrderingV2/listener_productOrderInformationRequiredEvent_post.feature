# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderInformationRequiredEvent_post for http method type POST 
# RoostTestHash=ce4c08f30f
# 
# 

# ********RoostGPT********
Feature: Product Order Information Required Event API

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || 'http://localhost:4010'
    * url urlBase
    * configure headers = { Authorization: '#(karate.properties['nnnn_AUTH_TOKEN'])' }

  Scenario Outline: Verify POST request for Product Order Information Required Event with valid data
    Given path '/listener/productOrderInformationRequiredEvent'
    And request
      """
      <body>
      """
    When method post
    Then status 204
    And match response == '#null'

    Examples:
      | read('listener_productOrderInformationRequiredEvent_post.csv') |
