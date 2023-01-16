Feature: get response success for api employees
  Background:
    * def baseurl = 'http://dummy.restapiexample.com'


  @GET
  Scenario: get an status code for GET method

    * configure ssl = true
    * def path = '/api/v1/employees'
    #* configure headers = { 'Content-Type': 'application/json' }
    #* def req = read("request.json")
    Given url baseurl + path
    When method GET
    * print response
    Then   assert responseStatus==429 || responseStatus==200
    #And match response == read("response.json")



  @GET1
  Scenario: get the status 200 and validate message for GET method

    * configure ssl = true
    * def path = '/api/v1/employee/1'
    Given url baseurl + path
    When method GET
    * print response
    Then   assert responseStatus==429 || responseStatus==200
    #Then status 200
    #And match response.status == 'success'
    #And match response.message == 'Successfully! Record has been fetched.'



  @POST
  Scenario: get the status 404 for POST method
    * configure ssl = true
    * def path = '/api/v1/create/'
    * def req = read("request.json")
    Given url baseurl + path
    And request req
    When method POST
    * print response.status
    Then status 404

  @UPDATE
  Scenario: get the status 301 for PUT method
    * configure ssl = true
    * def path = '/api/v1/create/'
    * def req = read("requestUpdate.json")
    Given url baseurl + path
    And request req
    When method PUT
    * print response
    Then status 301



  @DELETE
  Scenario: get the status 404 for DELETE method
    * configure ssl = true
    * def path = '/api/v1/delete/2'
    Given url baseurl + path
    When method GET
    * print response
    Then status 404




