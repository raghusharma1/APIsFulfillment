# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /productOrder/{order.Id}_patch for http method type PATCH 
# RoostTestHash=9e8fcf3d77
# 
# 

# ********RoostGPT********
Feature: Patch Product Order By Id

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Update product order with valid order Id and request body
    Given path <order_Id>
    And request
      """
      <request_body>
      """
    When method patch
    Then status 200
    And match response ==
      """
      <expected_response>
      """

    Examples:
      | read('productOrder_order.Id_patch.csv') |
