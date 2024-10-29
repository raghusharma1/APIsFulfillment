# ********RoostGPT********

# Test generated by RoostGPT for test sampleArtilleryEnv2 using AI Type  and AI Model 
# 
# Feature file generated for /productOrder_post for http method type POST 
# RoostTestHash=98c6afd708
# 
# 

# ********RoostGPT********
Feature: Test the productOrder API for various scenarios

  Background:
    * def urlBase = karate.properties['nnnn_URL_BASE'] || karate.get('urlBase', 'http://localhost:4010')
    * url urlBase
    * configure headers = { Authorization: #(karate.properties['nnnn_AUTH_TOKEN']) }

  Scenario Outline: Test POST request with valid input for <OrderType>
    Given path '/productOrder'
    And request
      """
      <payload>
      """
    When method post
    Then status 201
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | read('productOrder_post.csv') |

  Scenario Outline: Test POST request with invalid input for <ErrorScenario>
    Given path '/productOrder'
    And request
      """
      <payload>
      """
    When method post
    Then status <statusCode>
    And match response ==
      """
      <expectedResponse>
      """

    Examples:
      | ErrorScenario                | payload                                                                                                       | statusCode | expectedResponse                                                                     |
      | 'Catalog ID out of standard' | {order:{type:'Instalacao',infraType:'FTTH',products:{product:[{action:'adicionar',catalogId:'INVALID_ID'}]}}} |        400 | {control:{code:'400',message:'Campo Catalog ID fora do padrão esperado',type:'E'}}   |
      | 'Unauthorized credentials'   | {}                                                                                                            |        403 | {control:{code:'403',message:'Aplicação não autorizada ou não informada!',type:'E'}} |
