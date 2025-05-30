#!/usr/bin/env bash

# modified from @MarcelRobitaille:
# https://github.com/MarcelRobitaille/dotfiles/blob/master/bin/bin/lock 

# lock screen with i3lock-color
# https://github.com/Raymo111/i3lock-color
# i3lock-color, scrot, imagemagick

rectangles=" "
case `uname` in
  (Linux)
    font="Comic Sans MS:style=Bold"
    ;;
  (FreeBSD)
    font="Comic Neue:style=Bold Italic"
    ;;
esac

SR=$(xrandr --query | grep ' connected' | grep -o '[0-9][0-9]*x[0-9][0-9]*[^ ]*')
for RES in $SR; do
  SRA=(${RES//[x+]/ })
  CX=$((${SRA[2]} + 70))
  CY=$((${SRA[1]} - 580))
  rectangles+="rectangle $CX,$CY $((CX+450)),$((CY-150)) "
done

TMPBG=/tmp/screen.png
scrot $TMPBG && convert $TMPBG -scale 5% -scale 2000% -draw "fill black fill-opacity 0.5 $rectangles" $TMPBG

i3lock \
  -i $TMPBG \
  --time-str="%H:%M" \
  --clock --date-str="%a, %Y-%m-%d" \
  --greeter-text="Type password to unlock..." \
  --verif-text="..." --wrong-text="Wrong Password!" \
  --time-pos="x+135:y+460" \
  --date-pos="tx+15:ty+30" \
  --greeter-pos="x+300:y+410" \
  --ind-pos="tx+340:ty+458" \
  --inside-color="00000000" --ring-color="ffffffff" --line-uses-inside \
  --keyhl-color="d23c3dff" --bshl-color="d23c3dff" --separator-color="00000000" \
  --insidever-color="fecf4dff" --insidewrong-color="d23c3dff" \
  --ringver-color="ffffffff" --ringwrong-color="ffffffff" \
  --radius=25 --ring-width=8 \
  --time-font="$font" --date-font="$font" --layout-font="$font" \
  --greeter-font="$font" --verif-font="$font" --wrong-font="$font" \
  --verif-color="ffffffff" --greeter-color="#ff33cc" \
  --timeoutline-color="00000000" --dateoutline-color="ffffffff"

rm $TMPBG
