# xmodmap -pke
# xmodmap -pm
xmodmap -e "remove lock = Caps_Lock"
xmodmap -e "keycode 66 = Right NoSymbol Right"
# 还原：setxkbmap 或者 setxkbmap -option
