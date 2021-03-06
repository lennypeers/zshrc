#!/usr/bin/env bash
#
# deps: xdo

id="$1"
class="$2"
instance="$3"

# Windows spawn in the focused monitor
[[ "$(bspc query -M -m .focused --names)" == "HDMI-1" && "$(bspc query -M --names | wc -l)" > 1 ]] && _PREF=1 || _PREF=""

case "$class" in
  *office*)
     echo desktop=^${_PREF}8
  ;;

  discord)
     echo desktop=^${_PREF}5 state=pseudo_tiled
  ;;

  firefox)
    echo desktop=^${_PREF}1 follow=off state=pseudo_tiled
    ;;

  Gimp)
    echo desktop=^${_PREF}7 follow=off
    ;;

  qBittorrent)
    echo desktop=^${_PREF}10 follow=off
    ;;

  terminal)
    echo state=floating rectangle=524x297+900+580
    ;;

  Terminal)
    echo desktop=^${_PREF}3 follow=off
    ;;

  vlc)
    echo desktop=^${_PREF}6 follow=off
    ;;

  Vlc)
    echo desktop=^${_PREF}6 follow=off
    ;;

  Zathura)
    echo desktop=^${_PREF}4 follow=off
    ;;

  zoom)
    echo desktop=^${_PREF}7 follow=off
    ;;

  *)
    :
    ;;
esac


# from here, handling empty wm_class
[[ -n "$class" ]] && exit 0

owner="$(ps -p "$(xdo pid "$id")" -o comm= 2>/dev/null)"

case "$owner" in
  spotify)
    echo desktop=^${_PREF}9 follow=off state=pseudo_tiled
    ;;

  *)
    ;;
esac

# vim:set ts=8 sts=2 sw=2 et:
