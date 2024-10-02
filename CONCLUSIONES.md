## Conclusiones del Proyecto de Pruebas Automatizadas para Petstore
Después de realizar las pruebas sobre los métodos que ofrece la aplicación de Petstore, se han identificado áreas de mejora tanto en las respuestas de las API como en la ejecución de las pruebas automatizadas. A continuación, se detallan los principales puntos:

### 1. Mejora en las Respuestas de los Métodos
   Uno de los aspectos más críticos identificados es la inconsistencia en las respuestas de algunos métodos de la API. Por ejemplo, en ocasiones, al buscar una mascota por su ID, aunque esta ya se encontraba registrada, no se devolvía ningún valor, lo que requería ejecutar nuevamente la prueba. Este comportamiento genera dificultades al mantener un flujo de pruebas continuo y confiable.

### 2. Inclusión de Nuevos Criterios de Búsqueda
   Sería útil incluir más criterios de búsqueda en los endpoints de la API para la gestión de mascotas. Actualmente, la limitada capacidad de búsqueda complica la realización de pruebas dinámicas, como obtener el último ID registrado de una mascota, sumarle uno, y proceder a registrar una nueva. Esta funcionalidad permitiría un enfoque más automatizado y fluido en las pruebas, evitando la necesidad de modificar manualmente el archivo JSON o la prueba para poder ejecutar nuevas validaciones.

### 3. Problemas en el Flujo de las Pruebas
   Se encontraron complicaciones al intentar ejecutar pruebas en secuencia. En particular:

Problemas de sincronización: Al realizar el registro de una mascota, seguido por la búsqueda y actualización, el método de actualización respondía antes que el de búsqueda. Esto generaba inconsistencias, ya que cuando se intentaba hacer un "match" por ID junto con el nombre, el nombre ya había sido actualizado, lo que hacía que la prueba fallara.

Retorno de arrays: En el caso de la búsqueda de mascotas vendidas, la API devuelve un array. Esto dificulta la validación de búsquedas por ID o nombre, complicando la automatización y precisión de las pruebas.

### 4. Oportunidades de Mejora en las Pruebas Automatizadas
   Para optimizar las pruebas, sería ideal que las API proporcionaran respuestas más consistentes y predecibles, lo que permitiría crear flujos de pruebas más completos sin necesidad de ajustes manuales. Asimismo, agregar más opciones de búsqueda y filtrado mejoraría significativamente la flexibilidad y dinamismo en la validación de diferentes escenarios.

### 5. Conclusión Final
   Aunque se presentaron algunas dificultades en el flujo continuo de las pruebas y en la calidad de las respuestas de la API, no se detectaron problemas graves que afecten el objetivo general del proyecto. No obstante, mejorar tanto las respuestas de las API como la ejecución de las pruebas facilitaría el proceso de validación y permitiría un enfoque más robusto y automatizado.

En resumen, las pruebas automatizadas han logrado identificar áreas clave para la mejora tanto en la API como en la estrategia de prueba, lo que proporcionará un sistema más eficiente y funcional a largo plazo.