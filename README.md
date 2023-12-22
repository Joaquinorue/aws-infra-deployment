# AWS Infrastructure Deployment
Este repositorio contiene archivos de configuración de Terraform que te permitirán crear y desplegar varios recursos en Amazon Web Services (AWS). Los recursos a crear incluyen API Gateway, Lambda, CloudWatch y DynamoDB. A continuación, se proporciona una breve descripción de cada recurso y cómo ejecutar el repositorio.

_Recursos Creados_

1. AWS API Gateway
Este archivo de Terraform crea una API Gateway que actuará como la interfaz de entrada para las solicitudes a tus servicios. Puedes encontrar la configuración en el archivo api_gateway.tf.

Nombre del API Gateway: my-api-gateway
2. AWS Lambda
El archivo de configuración lambda_function.tf define una función Lambda que será invocada por las solicitudes a la API Gateway. La función Lambda puede procesar datos y realizar acciones específicas.

Nombre de la Función Lambda: my-lambda-function
3. AWS CloudWatch
El archivo cloudwatch.tf configura CloudWatch para permitir el registro y monitoreo de eventos y métricas relacionadas con tu función Lambda.

Grupo de Registros CloudWatch: my-cloudwatch-group
4. AWS DynamoDB
La tabla DynamoDB se define en el archivo dynamodb_table.tf. DynamoDB es un servicio de base de datos NoSQL totalmente administrado.

Nombre de la Tabla DynamoDB: my-dynamodb-table
Ejecución del Repositorio
Asegúrate de tener Terraform instalado en tu máquina local antes de ejecutar estos comandos. Puedes encontrar instrucciones de instalación en el sitio web de Terraform.

Configuración Inicial:
Ejecuta terraform init para inicializar tu directorio de trabajo con la configuración de Terraform.

bash
Copy code
terraform init
Planificación de Cambios:
Utiliza terraform plan para revisar los cambios que se realizarán en tu infraestructura antes de aplicarlos.

bash
Copy code
terraform plan
Aplicación de Cambios:
Si el plan parece correcto, aplica los cambios utilizando terraform apply. Confirma la aplicación escribiendo yes cuando se te solicite.

bash
Copy code
terraform apply
Destrucción de Recursos (Opcional):
Si deseas destruir los recursos creados, puedes utilizar terraform destroy. Ten en cuenta que esto eliminará todos los recursos configurados en AWS.

bash
Copy code
terraform destroy
¡Importante! Ten en cuenta que la ejecución de estos comandos puede resultar en costos asociados con los recursos de AWS creados. Asegúrate de comprender las implicaciones económicas antes de proceder.
