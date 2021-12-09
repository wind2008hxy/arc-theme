assets_svg = 'assets.svg'

foreach asset : gtk4_asset_names
  gtk4_assets = custom_target(
    'gtk4-' + asset,
    input : assets_svg,
    output : asset + '.png',
    command : [
      inkscape,
      '--export-id-only',
      inkscape_ver.version_compare('>=1.0') ? '--export-filename=@OUTPUT@' : '--export-png=@OUTPUT@',
      '--export-id=' + asset,
      '--export-dpi=96',
      '@INPUT@'
    ],
    build_by_default : true
  )

  gtk4_hidpi_assets = custom_target(
    'gtk4-' + asset + '-hidpi',
    input : assets_svg,
    output : asset + '@2.png',
    command : [
      inkscape,
      '--export-id-only',
      inkscape_ver.version_compare('>=1.0') ? '--export-filename=@OUTPUT@' : '--export-png=@OUTPUT@',
      '--export-id=' + asset,
      '--export-dpi=192',
      '@INPUT@'
    ],
    build_by_default : true
  )
endforeach
