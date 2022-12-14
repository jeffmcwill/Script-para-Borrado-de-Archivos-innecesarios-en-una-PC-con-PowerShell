#script sencillo para borrar datos inservibles en el sistema. Fue probado en windows 7 y 10. 

function Papelera {
$RECYCLEBIN = (New-Object -ComObject Shell.Application).NameSpace(10).Items()
$RECYCLEBIN | Select-Object Name,Size,Path | Format-Table -AutoSize
Clear-RecycleBin -Force
}

function portada {
write-host "
             _.-;;-._
      '-..-'|   ||   |
      '-..-'|_.-;;-._|
      '-..-'|   ||   |
      '-..-'|_.-''-._|

  Limpieza de Windows By Jeff McWill
------------------------------------------
Este script sencillo sirve para limpiar su pc de diferentes archivos
temporales, dns y toda clase de basura del sistema que este impidiendo su
correcto funcionamiento. Tambien sirve como para control periodico."
}

function ejecucioncompleta {
write-host "---------------------------------"
write-host "ejecutando Borrado de archivos temporales."
CLEANMGR /sagerun:X
write-host "---------------------------------"
write-host "ejecutando Borrando de Direcciones DNS."
ipconfig /flushdns
write-host "---------------------------------"
write-host "ejecutando Borrado de Navegacion de Windows"
del  index.dat / s
write-host "---------------------------------"
write-host "Borrado de papelera de reciclaje"
Papelera
write-host "---------------------------------"
write-host "Listo. Script Terminado."
write-host "---------------------------------"
}

function menu1 {
try{
    write-host "------------------------------------------
1. Ejecutar.
2. Salir.
------------------------------------------"

    [int]$usuario = read-host "¿Que deseas hacer?"
    switch($usuario)
    {
        {$_ -eq 1} {
            write-host "De acuerdo..."
            ejecucioncompleta
        }
        {$_ -eq 2}{
            write-host "ok, hasta luego."
        }
}
}catch{
        Write-Warning "Error, comando ingresado incorrecto."
}
}
#funciones que se ejecutan primero.
portada
menu1