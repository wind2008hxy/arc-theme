foreach variant : get_option('variants')
  install_data(
    variant / 'index.theme',
    install_dir : prefix / install_dir.get(variant),
  )
endforeach
