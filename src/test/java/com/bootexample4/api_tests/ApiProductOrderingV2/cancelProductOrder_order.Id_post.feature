# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /cancelProductOrder/{order.Id}_post for http method type POST 
# RoostTestHash=a5ea3b10ac
# 
# 

# ********RoostGPT********
Feature: Cancel Product Order By Id

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Cancel product order with valid order ID and request body
    Given path '<order_Id>'
    And request <body>
    When method DELETE
    Then status 200
    And match response == <expected_response>
    And match response.control.code == '200'
    And match response.control.type == 'S'

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |

  Scenario: Cancel product order with invalid order ID
    Given path 'invalidOrderId'
    And request """{ "order": {"associatedDocument": "VTT001", "customer": {"subscriberId": "SVTAL001"}} }"""
    When method DELETE
    Then status 404
    And match response.control.code == '404'
    And match response.control.type == 'E'

  Scenario: Cancel product order with unauthorized access
    Given path '20230315000001'
    And request """{ "order": {"associatedDocument": "VTT001", "customer": {"subscriberId": "SVTAL001"}} }"""
    When method DELETE
    Then status 401
    And match response.control.code == '401'
    And match response.control.type == 'E'

  Scenario: Cancel product order with forbidden access
    Given path '20230315000001'
    And request """{ "order": {"associatedDocument": "VTT001", "customer": {"subscriberId": "SVTAL001"}} }"""
    When method DELETE
    Then status 403
    And match response.control.code == '403'
    And match response.control.type == 'E'

  Scenario: Cancel product order with server error
    Given path '20230315000001'
    And request """{ "order": {"associatedDocument": "VTT001", "customer": {"subscriberId": "SVTAL001"}} }"""
    When method DELETE
    Then status 500
    And match response.control.code == '500'
    And match response.control.type == 'T'
