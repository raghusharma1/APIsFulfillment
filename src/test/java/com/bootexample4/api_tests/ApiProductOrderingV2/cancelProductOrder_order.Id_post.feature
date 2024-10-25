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
    Given path 'cancelProductOrder', '<order_Id>'
    And request
      """
      { 
        order: { 
          associatedDocument: '<associatedDocument>', 
          customer: { 
            subscriberId: '<subscriberId>' 
          } 
        } 
      }
      """
    When method POST
    Then status 200
    And match response ==
      """
      { 
        control: { 
          code: '200', 
          message: 'OK', 
          type: 'S' 
        } 
      }
      """

    Examples:
      | read('cancelProductOrder_order.Id_post.csv') |

  Scenario Outline: Cancel product order with invalid order ID
    Given path 'cancelProductOrder', '<order_Id>'
    And request
      """
      { 
        order: { 
          associatedDocument: '<associatedDocument>', 
          customer: { 
            subscriberId: '<subscriberId>' 
          } 
        } 
      }
      """
    When method POST
    Then status 404
    And match response ==
      """
      { 
        control: { 
          code: '404', 
          message: 'Not Found', 
          type: 'E' 
        } 
      }
      """

    Examples:
      | order_Id       | associatedDocument | subscriberId |
      | 'invalid00001' | 'VTT001'           | 'SVTAL001'   |

  Scenario Outline: Cancel product order with unauthorized access
    Given path 'cancelProductOrder', '<order_Id>'
    And request
      """
      { 
        order: { 
          associatedDocument: '<associatedDocument>', 
          customer: { 
            subscriberId: '<subscriberId>' 
          } 
        } 
      }
      """
    When method POST
    Then status 401
    And match response ==
      """
      { 
        control: { 
          code: '401', 
          message: 'Unauthorized', 
          type: 'E' 
        } 
      }
      """

    Examples:
      | order_Id         | associatedDocument | subscriberId |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |

  Scenario Outline: Cancel product order with forbidden access
    Given path 'cancelProductOrder', '<order_Id>'
    And request
      """
      { 
        order: { 
          associatedDocument: '<associatedDocument>', 
          customer: { 
            subscriberId: '<subscriberId>' 
          } 
        } 
      }
      """
    When method POST
    Then status 403
    And match response contains
      """
      { 
        control: { 
          code: '403', 
          message: '#string', 
          type: 'E' 
        } 
      }
      """

    Examples:
      | order_Id         | associatedDocument | subscriberId |
      | '20230315000001' | 'VTT001'           | 'SVTAL001'   |

  Scenario Outline: Cancel product order with bad request data
    Given path 'cancelProductOrder', '<order_Id>'
    And request
      """
      { 
        order: { 
          associatedDocument: '<associatedDocument>', 
          customer: { 
            subscriberId: '<subscriberId>' 
          } 
        } 
      }
      """
    When method POST
    Then status 400
    And match response ==
      """
      { 
        control: { 
          code: '400', 
          message: 'Bad Request', 
          type: 'E' 
        } 
      }
      """

    Examples:
      | order_Id         | associatedDocument | subscriberId |
      | '20230315000001' | 'INVALID_DOC'      | 'SVTAL001'   |
