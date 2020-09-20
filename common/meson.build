subdir('index')

common_dirs = {
  'cinnamon' : 'cinnamon',
  'gnome-shell' : 'gnome-shell',
  'gtk2' : 'gtk-2.0',
  'gtk3' : 'gtk-3.0',
  'metacity' : 'metacity-1',
  'plank' : 'plank',
  'unity' : 'unity',
  'xfwm' : 'xfwm4'
}

foreach theme : get_option('themes')
  subdir(common_dirs.get(theme))
endforeach
