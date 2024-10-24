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

  Scenario Outline: Cancel order with valid order id and body
    Given url urlBase
    And path '/cancelProductOrder/<order_Id>'
    And request <body>
    When method POST
    Then status 200
    And match response contains
      """
      { 
        "control": { "code": "200", "message": "OK", "type": "S" }
      }
      """

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |

  Scenario Outline: Cancel order with invalid order id
    Given url urlBase
    And path '/cancelProductOrder/<order_Id>'
    And request
      """
      { 
        "order": { 
          "associatedDocument": "VTT001", 
          "customer": { "subscriberId": "SVTAL001" } 
        } 
      }
      """
    When method POST
    Then status 404
    And match response contains
      """
      { 
        "control": { 
          "code": '404', 
          "message": 'Not Found', 
          "type": 'E' 
        } 
      }
      """

    Examples:
      | order_Id     |
      | 'invalid_id' |

  Scenario Outline: Cancel order with unauthorized access
    Given url urlBase
    And path '/cancelProductOrder/<order_Id>'
    And request
      """
      { 
        "order": { 
          "associatedDocument": "VTT001", 
          "customer": { "subscriberId": "SVTAL001" } 
        } 
      }
      """
    When method POST
    Then status 401
    And match response contains
      """
      { 
        "control": { 
          "code": '401', 
          "message": 'Unauthorized', 
          "type": 'E' 
        } 
      }
      """

    Examples:
      | order_Id         |
      | '20230315000001' |
