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
    And request
      """
      <body>
      """
    When method DELETE
    Then status 200
    And match response ==
      """
      <expected_response>
      """

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |

  Scenario Outline: Cancel product order with invalid or expired credentials
    Given path '<order_Id>'
    And request
      """
      <body>
      """
    When method DELETE
    Then status 403
    And match response ==
      """
      <expected_response>
      """

    Examples:
      | order_Id         | body                                                                                        | expected_response                                                                           |
      | '20230315000001' | { "order": { "associatedDocument": "VTT001", "customer": { "subscriberId": "SVTAL001" } } } | { "control": { "code": "403", "message": "Forbidden - Scope Not Permitted", "type": "E" } } |

  Scenario Outline: Cancel product order with non-existing order ID
    Given path '<order_Id>'
    And request
      """
      <body>
      """
    When method DELETE
    Then status 404
    And match response ==
      """
      <expected_response>
      """

    Examples:
      | order_Id     | body                                                                                        | expected_response                                                     |
      | '9999999999' | { "order": { "associatedDocument": "VTT001", "customer": { "subscriberId": "SVTAL001" } } } | { "control": { "code": "404", "message": "Not Found", "type": "E" } } |

  Scenario Outline: Cancel product order with a server error
    Given path '<order_Id>'
    And request
      """
      <body>
      """
    When method DELETE
    Then status 500
    And match response ==
      """
      <expected_response>
      """

    Examples:
      | order_Id         | body                                                                                        | expected_response                                                                 |
      | '20230315000001' | { "order": { "associatedDocument": "VTT001", "customer": { "subscriberId": "SVTAL001" } } } | { "control": { "code": "500", "message": "Internal Server Error", "type": "T" } } |
