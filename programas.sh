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

entries=$(echo -e "Atajos\nInterfaz\nColorPicker\nReloj\nTareas\nPortafolios\nPomodoro\nContador\nCode\nTrivial\nAdminTareas\nTerminal\nCamara\nArchivos\nFirefox\nBuscadorInternet\nBuscadorLocal\nSistema\nDisco\nSpotify\nWhatsApp\nDiscord\nJuegos\nMoodle\nXampp\nLMStudio_LocalIA\nParticiones\nNvim\nYoutube\nTor\nCalculadora\nCalendario\nWeather\nEditorVideo\nTwitch\nTwitter\nGitHub\nWikipedia\nChatGPT\nOneDrive\nOutlook\nGmail\nDrive\nWallpapers\nCaptura\nAntivirus\nVpn_On\nVpn_Off\nDocumentos\nCCleaner\nVisualStudio\nVLC\nWiFi\nBluetooth_On\nBluetooth_Off\nBluetooth_Info\nEditar" | $wofi_command -i --dmenu | awk '{print tolower($1)}')

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
Meta + TAB = Escritorios (bug)
Meta + H = Horizontal
Meta + V = Vertical	
Meta + F1 = Reloj
Meta + F2 = Calendario
Meta + F3 = Calculadora
Meta + F4 = Pomodoro
Meta + F5-F7 = Abrir Stickers
Meta + F8 = Cerrar Stickers
Meta + F9 = Reduce Brillo
Meta + F10 = Augmenta Brillo
Meta + F11 = EasterEgg
Meta + F12 = Brillo 0
Meta + Audio = Todas las opciones"
	;;
    interfaz)
	python3 interfaz.py
	;;
    colorpicker)
	flatpak run io.github.josephmawa.Bella
	;;
    tareas)
    flatpak run dev.edfloreshz.Tasks
    ;;
    reloj)
    flatpak run re.sonny.Retro
    ;;
    pomodoro)
    flatpak run org.gnome.Solanum
    ;;
    contador)
    flatpak run ca.vlacroix.Tally
    ;;
    trivial)
    flatpak run io.github.nokse22.trivia-quiz
    ;;
    admintareas)
	gnome-system-monitor
	;;
    terminal)
        terminology 
        ;;
    code)
        code
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
        firefox https://open.spotify.com/intl-es
        ;;
    portafolios)
        firefox https://garcilaso05.github.io/portafolios/
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
trivial
cmatriz o nyancat o asciiquarium (WIND+M)"
	;;
    moodle)
        firefox
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
    lmstudio_localia)
        /home/blackhole/LM-Studio-0.3.9-6-x64.AppImage
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
        flatpak run org.gnome.Calculator
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
    visualstudio)
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
