# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/cancelProductOrderCreateEvent_post for http method type POST 
# RoostTestHash=7601d79448
# 
# 

# ********RoostGPT********
Feature: Cancel Product Order Create Event By Client

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }
    * url urlBase

  Scenario Outline: Verify successful cancellation of product order creation event
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "<associatedDocument>",
            "id": "<id>"
          }
        }
      }
      """
    When method post
    Then status 204

    Examples:
      | read('listener_cancelProductOrderCreateEvent_post.csv') |

  Scenario Outline: Verify bad request error when mandatory fields are missing
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "<associatedDocument>",
            "id": "<id>"
          }
        }
      }
      """
    When method post
    Then status 400

    Examples:
      | associatedDocument | id             |
      | VTT001             |                |
      |                    | 20230315000001 |

  Scenario Outline: Verify unauthorized access with invalid token
    Given path '/listener/cancelProductOrderCreateEvent'
    And header Authorization = 'InvalidToken'
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "<associatedDocument>",
            "id": "<id>"
          }
        }
      }
      """
    When method post
    Then status 401

    Examples:
      | associatedDocument | id             |
      | VTT001             | 20230315000001 |

  Scenario: Server error simulation
    Given path '/listener/cancelProductOrderCreateEvent'
    And request
      """
      {
        "notification": {
          "order": {
            "associatedDocument": "VTT001",
            "id": "20230315000001"
          }
        }
      }
      """
    When method post
    Then status 500
