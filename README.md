#INSTRUCCIONES PARA INICIAR EL JUEGO

1. Clonar el repositorio en una carpeta con el comando git clone "link"
2. ingresar a la carpeta donde fue clonado el repositorio
3. ingresa a la carpeta juego, luego a la carpeta princesagame
4. previamente se debe tener instalado aws CLI y Terraform
5. previamente se deben tener las credenciales de aws, en la carpeta ~/.aws/credentials
6. crear un par de llaves en la carpeta ~/.ssh/ con los nombres "princesakey" con los comandos:
   ssh-keygen -b 4096
   chmod 400 princesakey
   chmod 400 princesakey.pub
7. ingresar de nuevo a la carpeta princesagame y ejecutar los siguientes comandos:
   terraform init
   terraform fmt
   terraform validate
   terraform apply
