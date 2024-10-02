## 1. Prerequisitos
   - Windows 11
   - IDE IntelliJ versión ^2023.1
   - Gradle ^8.5 (debe estar en la variable de entorno)
   - JDK versión 17 (debe estar en la variable de entorno)
## 2. Comandos de instalación
    gradle build
## 3. Instrucciones para ejecutar los test
   Para ejecutar los test, puede utilizar el siguiente comando:
####
    gradle clean build 
   Otra opción es utilizar la herramienta de gradle que viene en IntelliJ, dirigirse a Run Configuration y utilizar el método ManagementTest.testParallel (1).

## 4. Información adicional
   El sistema genera dos reportes:

- El reporte por defecto con el framework se encuentra en la dirección build/reports/tests/test/index.html.
- El reporte con cucumber se encuentra en la dirección target/cucumber-html-reports/report-feature_(númerodeejecución).

### La estructura del proyecto es la siguiente:
    API_ERICK_SALGADO
        |
        src
            |
            main
            java
                |
                pets
                |
                    ManagementTest
                    PetGetRunner
                    pets.feature
            |
            karate-config.js
            |
            resources
                |
                cucumber-reporting.properties