base_svg_assets = run_command(
  'find',
  meson.current_source_dir(),
  '-maxdepth', '1',
  '-name', '*.svg',
  check : true
).stdout().split()

foreach variant : get_option('variants')
  # custom install script is necessary here, since install_subdir() currently installs 
  # the symlink target file, instead of the actual symlink, which doesn't install
  # dark variant correctly
  foreach asset : base_svg_assets
    meson.add_install_script(
      install_file,
      asset,
      '$MESON_INSTALL_DESTDIR_PREFIX' / install_dir.get(variant) / common_dirs.get('unity')
    )
  endforeach

  install_subdir(
    'dash',
    install_dir : prefix / install_dir.get(variant) / common_dirs.get('unity'),
  )

  install_subdir(
    variant == 'light' or variant == 'lighter' ? 'window-buttons' : 'window-buttons-dark',
    install_dir : prefix / install_dir.get(variant) / common_dirs.get('unity') / 'window-buttons',
    strip_directory : true
  )
endforeach
