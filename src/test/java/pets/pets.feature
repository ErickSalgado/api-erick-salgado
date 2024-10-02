Feature: Test de APIs de una petshop

  Background:
    * def urlBase = 'https://petstore.swagger.io'
    * def petsPath = '/v2/pet'
    * def petId = 42

  Scenario: Añadir una mascota a la tienda
    Given url urlBase + petsPath
    And request
        """
        {
        "id": 42,
        "category":
          {"id": 1,
          "name": "Dogs"
          },
        "name": "Fido",
        "photoUrls": ["string"],
        "tags": [
          {"id":1,
          "name": "Fido"
          }
         ],
         "status": "available"
         }
        """
    When method POST
    Then status 200
    And match response.id == petId
    And match response.name == "Fido"

  Scenario: Consultar la mascota ingresada previamente (Búsqueda por ID)
    Given url urlBase + petsPath + '/' + petId
    When method GET
    Then status 200
    And match response.id == petId

  Scenario: Actualizar el nombre de la mascota y el estatus de la mascota a “sold”
    Given url urlBase + petsPath
    And request
    """
    {
      "id": 42,
      "category": {
        "id": 1,
        "name": "Dogs"
      },
      "name": "Fido Updated",
      "photoUrls": [
        "string"
      ],
      "tags": [
        {
          "id": 1,
          "name": "string"
        }
      ],
      "status": "sold"
    }
    """
    When method PUT
    Then status 200
    And match response.id == petId
    And match response.name == "Fido Updated"
    And match response.status == "sold"

  Scenario: Consultar la mascota modificada por estatus (Búsqueda por estatus)
    Given url urlBase + petsPath + '/findByStatus?status=sold'
    When method GET
    Then status 200
    And match response[*].id == petId
