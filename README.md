# AWS Infrastructure Deployment
Este repositorio contiene archivos de configuración de Terraform que permitirán crear y desplegar varios recursos en Amazon Web Services (AWS). Los recursos a crear incluyen API Gateway, Lambda, CloudWatch y DynamoDB. A continuación, se proporciona una breve descripción de cada recurso y cómo ejecutar el repositorio.

_Recursos Creados_

*1. AWS API Gateway*
Este archivo de Terraform crea una API Gateway que actuará como la interfaz de entrada para las solicitudes a tus servicios. A su vez, generará una URL unica para conectarse al servicio lambda a delplegar.
Nombre del recurso API Gateway creado: http-api

*2. AWS Lambda*
El archivo de configuración lambda.tf contiene una función Lambda que será invocada por las solicitudes a la API Gateway y su respectivo permiso de iam.
Nombre de la Función Lambda: lambda-iam

*3. AWS CloudWatch*
El archivo cloudwatch.tf configura CloudWatch para crear un recurso que permita el registro y monitoreo de eventos.
Grupo de Registros CloudWatch: /lambda/lambda-function

*4. AWS DynamoDB*
La tabla DynamoDB va a tener como objetivo almacenar los datos de ejecución del servicio Lambda.

Nombre de la Tabla DynamoDB: cloudwatch-logs-table

--
Ejecución del Repositorio
Asegurarse de tener instalado:
- Terraform >= 5.0
- AWS CLI con la configuracion de credenciales para crear los recursos.

NOTA: por defecto, los recursos van a crearse en la region *us-east-1*
  
Configuración Inicial:
Luego de descargar el repositorio, ejecutar:

```
terraform init
terraform plan
terraform apply
```
Esto va a desplegar los recursos arriba descriptos y la terminal mostrara un output como el siguiente:

```
Outputs:
api_url = "https://iu4v8ab3c4.execute-api.us-east-1.amazonaws.com/"
```
Utilizando cualquier navegador podra visualizar que la aplicación que corra el recurso lambda se ejecuto correctamente:

```
Hello from Lambda!
```

Destrucción de Recursos:
Para destruir todos los recursos creados:

```
terraform destroy
```
