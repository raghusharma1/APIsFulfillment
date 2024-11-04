# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /listener/productOrderCreateEvent_post for http method type POST 
# RoostTestHash=5d5b9532f3
# 
# 

# ********RoostGPT********
Feature: Testing Product Order Create Event API Endpoint

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Verify successful product order creation event
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status 204
    And match response == {}

    Examples:
      | read('listener_productOrderCreateEvent_post.csv') |

  Scenario Outline: Verify error handling for bad request
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status 400

    Examples:
      | requestBody                                                                                                                                  |
      | { "notification": { "date": "invalid-date", "order": { "associatedDocument": "INVALID", "correlationOrder": "invalid", "id": "invalid" } } } |

  Scenario Outline: Verify unauthorized access handling
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status 401

    Examples:
      | requestBody                                                                                                                                                |
      | { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } } |

  Scenario Outline: Verify server error handling
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status 500

    Examples:
      | requestBody                                                                                                                                                |
      | { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } } |

  Scenario Outline: Verify service unavailable handling
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status 503

    Examples:
      | requestBody                                                                                                                                                |
      | { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } } |

  Scenario Outline: Verify timeout error handling
    Given path '/listener/productOrderCreateEvent'
    And request
      """
      <requestBody>
      """
    When method post
    Then status 504

    Examples:
      | requestBody                                                                                                                                                |
      | { "notification": { "date": "2021-06-05T20:23:29-03:00", "order": { "associatedDocument": "VTT001", "correlationOrder": "10", "id": "20230315000001" } } } |
