# mywofimenu

Este proyecto proporciona una interfaz de menú personalizada programada sobre wofi. El menú permite acceder rápidamente a varias aplicaciones y herramientas.

## Características Principales

### 1. Atajo de Teclas para Ejecutar el Programa
Puedes crear un atajo de teclas para ejecutar directamente el menú. En este caso, el atajo sugerido es **WINDOWS + E**. Asegúrate de configurar este atajo en tu entorno de escritorio o gestor de ventanas.

### 2. Atajos en el Menú y Dependencias
El menú contiene varios atajos que pueden necesitar las siguientes dependencias:
- `zenity`
- `hyprshot`
- `gnome-system-monitor`
- `kamoso`
- `filelight`
- `wine`
- `waypaper`
- `bleachbit`

Asegúrate de tener estas dependencias instaladas para que todos los atajos funcionen correctamente.

### 3. Personalización del Menú
Este menú es específico para mis necesidades, pero puedes añadir tus propias opciones siguiendo estos pasos:

#### Añadir Opciones Propias
Para añadir nuevas acciones, debes incluir el nombre de la acción en la variable `entries`, separado por `\n`. Luego, añade el caso correspondiente en el script siguiendo este esquema:

```bash
case $entries in
    #nombre_accion)
        #accion
        ;;
    *)
        ;;
esac
```
## Captura de pantalla

![imagen](https://github.com/user-attachments/assets/7dc17f5c-bd87-42bf-905b-68c3b44f968f)

