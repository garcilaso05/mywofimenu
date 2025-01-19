#!/usr/bin/env bash

# Estilos para wofi
CONFIG="$HOME/.config/hypr/wofi/WofiBig/config"
STYLE="$HOME/.config/wofi/style.css"
COLORS="$HOME/.config/hypr/wofi/colors"

# Tamaño pantalla
WOFI_WIDTH=28
WOFI_HEIGHT=30

wofi_command="wofi --show dmenu \
			--prompt choose... \
			--conf $CONFIG --style $STYLE --color $COLORS \
			--width=$WOFI_WIDTH% --height=$WOFI_HEIGHT% \
			--cache-file=/dev/null \
			--hide-scroll --no-actions \
			--matching=fuzzy"
			
# Mostrar posibles entradas por pantalla

entries=$(echo -e "Atajos\nInterfaz\nFullFocus\nTareas\nTerminal\nCamara\nArchivos\nFirefox\nBuscadorInternet\nBuscadorLocal\nSistema\nDisco\nSpotify\nWhatsApp\nDiscord\nJuegos\nMoodle\nXampp\nParticiones\nNvim\nYoutube\nTor\nCalculadora\nCalendario\nWeather\nEditorVideo\nTwitch\nTwitter\nGitHub\nWikipedia\nChatGPT\nOneDrive\nOutlook\nGmail\nDrive\nWallpapers\nCaptura\nAntivirus\nVpn_On\nVpn_Off\nDocumentos\nCCleaner\nVisual_Studio\nVLC\nWiFi\nBluetooth_On\nBluetooth_Off\nBluetooth_Info\nEditar" | $wofi_command -i --dmenu | awk '{print tolower($1)}')

# Dependencias: zenity; hyprshot; gnome-system-monitor; kamoso; filelight; wine; waypaper; bleachbit; 

# Escoger opciones

case $entries in
    atajos)
	zenity --info --title="Atajos Teclado" --text="Meta + Q = Consola
Meta + C = Cerrar Ventana
Meta + E = Bascador
Meta + R = Aplicaciones
Meta + T = Sistema
Meta + Y = Estilos
Meta + Z = Archvios
Meta + F = Firefox
Meta + X = Flotante
Meta + J = Hor/Vert
Meta + O = Marcadores
Meta + K = Cerrar Marcadores
Meta + num = Escritorios
Meta + S = Ventana Secreta
Meta + Shift + [] = Mover
Meta + I = Color Hypr
Meta + A = Crear Agrupacion
Meta + D = Desagrupar
Meta + G = Agrandar ventana
Meta + TAB = Escritorios
Meta + H = Horizontal
Meta + V = Vertical	
Meta + F1-F3 = Abrir Stickers
Meta + F4 = Cerrar Stickers
Meta + F5-F6 = Sonidos
Meta + F9 = Reduce Brillo
Meta + F10 = Augmenta Brillo
Meta + F12 = Brillo 0
Meta + Audio = Todas las opciones"
	;;
    interfaz)
	python3 interfaz.py
	;;
    fullfocus)
	./full_focus.sh
	;;
    tareas)
	gnome-system-monitor
	;;
    terminal)
        terminology 
        ;;
    camara)
        kamoso
        ;;
    archivos)
        nemo
        ;;
    firefox)
	firefox
	;;
    buscadorinternet)
        nombre=$(zenity --entry --title="Firefox" --text="Buscador:")
./firefox.sh $nombre
        ;;
    buscadorlocal)
	kitty sk
	;;
    sistema)
	kitty bpytop 
	;;
    disco)
	filelight
	;;
    spotify)
        spotify
        ;;
    whatsapp)
        firefox https://web.whatsapp.com/
        ;;
    discord)
	discord
	;;
    juegos)
	zenity --info --title="Juegos" --text="Algunas ideas:

nudoku
2048
bastet
ascii-patrol
gomoku
robots
snake
pacman4console
cmatriz o nyancat o asciiquarium (WIND+M)"
	;;
    moodle)
        firefox https://campusvirtual.urv.cat/my/
        ;;
    youtube)
        firefox https://www.youtube.com/
        ;;
    tor)
	torbrowser-launcher
	;;
    xampp)
	zenity --info --title="Bases de datos" --text="Iniciar interfaz:

        xhost +SI:localuser:root
        sudo DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY /opt/lampp/manager-linux-x64.run
        xhost -SI:localuser:root

Iniciar servidor (mysql):

        sudo /opt/lampp/bin/mysql -u root"
	;;
    particiones)

	zenity --info --title="Administrar Particiones" --text="Abrir gparted:

xhost +local:root
sudo gparted

Editar parametros:

sudo -H nano /etc/fstab"
	;;

    nvim)
	kitty nvim
	;;
    calculadora)
        wine /home/blackhole/Windows/QalculatePortable/QalculatePortable.exe
        ;;
    calendario)
        gnome-calendar
        ;;
    weather)
	kweather
	;;
    editorvideo)
	kdenlive
	;;
    twitch)
        firefox https://www.twitch.tv/
        ;;
    twitter)
        firefox https://twitter.com/home
        ;;
    github)
        firefox https://github.com/
        ;;
    wikipedia)
        firefox https://es.wikipedia.org/wiki/Wikipedia:Portada
        ;;
    chatgpt)
        firefox https://chat.openai.com/
        ;;
    gemini)
        firefox https://gemini.google.com/app
        ;;
    onedrive)
        firefox 
        ;;
    outlook)
        firefox https://outlook.office.com/mail/
        ;;
    gmail)
        firefox https://mail.google.com/mail/u/0/#inbox
        ;;
    drive)
        firefox https://drive.google.com/drive/home
        ;;
    wallpapers)
        waypaper
        ;;
    captura)
        hyprshot -m region -o /home/blackhole/Capturas
        ;;
    antivirus)
        kitty /home/blackhole/.config/eww/escanear.sh
        ;;
    vpn_on)
        kitty /home/blackhole/.config/eww/vpnup.sh
        ;;
    vpn_off)
        kitty /home/blackhole/.config/eww/vpndown.sh
        ;;
    documentos)
        onlyoffice-desktopeditors
        ;;
    ccleaner)
        bleachbit
        ;;
    visual_studio)
        code
        ;;
    vlc)
        vlc
        ;;
    wifi)
        alacritty -e nmtui
        ;;
    bluetooth_on)
        kitty ./bluetoothon.sh
        ;;
    bluetooth_off)
        kitty ./bluetoothoff.sh
        ;;
    bluetooth_info)
       	kitty ./bluetoothinfo.sh
        ;;
    editar)
	zenity --info --title="Editar menu" --text="nano .config/eww/programas.sh
nano .config/eww/eww.yuck
nano .config/eww/scripts/widget_search
nano .config/hypr/hyprland.conf"
	;;
    *)
#	firefox https://duckduckgo.com/?q=$entries
#        zenity --notification --text="error al buscar"
        ;;
esac
