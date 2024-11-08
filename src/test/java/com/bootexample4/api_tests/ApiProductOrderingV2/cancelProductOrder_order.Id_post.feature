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
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Cancel order with valid order id and valid request body
    Given url urlBase
    And path '/cancelProductOrder/<order_id>'
    And request <request_body>
    When method DELETE
    Then status 200
    And match response == <expected_response>

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |

  Scenario Outline: Cancel order with invalid order id
    Given url urlBase
    And path '/cancelProductOrder/<order_id>'
    And request <request_body>
    When method DELETE
    Then status 404
    And match response == <expected_response>

    Examples:
      | order_id    | request_body                                                                                      | expected_response                                                           |
      | 'invalidID' | """{ "order": { "associatedDocument": "VTT002", "customer": { "subscriberId": "SVTAL002" } } }""" | """{ "control": { "code": "404", "message": "Not Found", "type": "E" } }""" |

  Scenario Outline: Cancel order with unauthorized access
    Given url urlBase
    And path '/cancelProductOrder/<order_id>'
    And request <request_body>
    When method DELETE
    Then status 401
    And match response == <expected_response>

    Examples:
      | order_id         | request_body                                                                                      | expected_response                                                              |
      | '20230315000002' | """{ "order": { "associatedDocument": "VTT003", "customer": { "subscriberId": "SVTAL003" } } }""" | """{ "control": { "code": "401", "message": "Unauthorized", "type": "E" } }""" |

  Scenario: Cancel order with server error
    Given url urlBase
    And path '/cancelProductOrder/20230315000003'
    And request """{ "order": { "associatedDocument": "VTT004", "customer": { "subscriberId": "SVTAL004" } } }"""
    When method DELETE
    Then status 500
    And match response == """{ "control": { "code": "500", "message": "Internal Server Error", "type": "T" } }"""
