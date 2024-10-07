Feature: Test de APIs de una petshop

  Background:
    * def urlBase = 'https://petstore.swagger.io'
    * def petsPath = '/v2/pet'
    * def petId = 45
    * def createPetBody = read('./createPet.json')

  Scenario: Añadir una mascota a la tienda
    Given url urlBase + petsPath
    And request createPetBody
    When method POST
    Then status 200
    And match response.id == petId
    And match response.name == "Fido"

  Scenario: Consultar la mascota ingresada previamente (Búsqueda por ID)
    Given url urlBase + petsPath + '/' + petId
    When method GET
    Then status 200
    And match response.id == petId
#
  Scenario Outline: Actualizar el nombre de la mascota y el estatus de la mascota a “sold”
    Given url urlBase + petsPath
    And request {"id": <id>, "category": { "id": <category.id>, "name": <category.name> }, "name": <name>, "status": <status>}
    When method PUT
    Then status 200
    And match response.id == petId
    And match response.name == "Fido Updated"
    And match response.status == "sold"

    Examples:
      | read('updatePet.csv') |

  Scenario: Consultar la mascota modificada por estatus (Búsqueda por estatus)
    Given url urlBase + petsPath + '/findByStatus?status=sold'
    When method GET
    Then status 200
    And match response[*].id contains 45
