gtk2_asset_names = run_command(
  'cat', 'assets.txt',
  check : true
).stdout().split()

if 'light' in get_option('variants') or 'lighter' in get_option('variants')
  subdir('light')
endif

if 'dark' in get_option('variants') or 'darker' in get_option('variants')
  subdir('dark')
endif

foreach variant : get_option('variants')
  light_assets = gtk2_light_assets
  if variant == 'dark'
    dark_assets = gtk2_dark_assets
  endif

  if variant == 'dark'
    install_assets = dark_assets
  else
    install_assets = light_assets
  endif

  if variant == 'light' or variant == 'lighter'
    light_menubar_toolbar_assets = [
      'entry-active-toolbar.png',
      'entry-disabled-toolbar.png',
      'entry-toolbar.png',
      'menubar_button.png',
      'menubar.png'
    ]
  elif variant == 'dark' or variant == 'darker'
    light_menubar_toolbar_assets = [
      'button-active.png',
      'button-hover.png',
      'button-insensitive.png',
      'button.png'
    ]

    dark_menubar_toolbar_assets = [
      'entry-active-toolbar.png',
      'entry-disabled-toolbar.png',
      'entry-toolbar.png',
      'menubar_button.png',
      'menubar.png'
    ]
  endif

  install_data(
    [variant / 'gtkrc', 'apps.rc', 'main.rc', 'panel.rc', 'xfce-notify.rc'],
    install_dir : prefix / install_dir.get(variant) / common_dirs.get('gtk2')
  )

  install_data(
    variant == 'light' or variant == 'lighter' ? 'menubar-toolbar' / 'menubar-toolbar.rc' : 'menubar-toolbar' / 'menubar-toolbar-dark.rc',
    install_dir : prefix / install_dir.get(variant) / common_dirs.get('gtk2') / 'menubar-toolbar',
  )

  foreach asset : install_assets
    meson.add_install_script(
      'sh', '-c',
      'install -D' + ' ' +
      '-t $MESON_INSTALL_DESTDIR_PREFIX' / install_dir.get(variant) / common_dirs.get('gtk2') / 'assets' + ' ' +
      asset.full_path()
    )
  endforeach

  foreach asset : light_menubar_toolbar_assets
    meson.add_install_script(
      'sh', '-c',
      'install -D' + ' ' +
      '-t $MESON_INSTALL_DESTDIR_PREFIX' / install_dir.get(variant) / common_dirs.get('gtk2') / 'menubar-toolbar' + ' ' +
      meson.current_build_dir() / 'light' / asset
    )
  endforeach

  if variant == 'dark' or variant == 'darker'
    foreach asset : dark_menubar_toolbar_assets
      new_asset = asset.substring(0, -4) + '-dark' + asset.substring(-4)

      meson.add_install_script(
        'sh', '-c',
        'install -DT' + ' ' +
        meson.current_build_dir() / 'dark' / asset + ' ' +
        '$MESON_INSTALL_DESTDIR_PREFIX' / install_dir.get(variant) / common_dirs.get('gtk2') / 'menubar-toolbar' / new_asset
      )
    endforeach
  endif

endforeach
