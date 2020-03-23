$packages =
  # THINKPAD/HW SPECIFIC
  #'lenovo-thinkvantage-system-update',  `
  #'logitech-options'                    `
  # BROWSER                             `
  'googlechrome',                       `
  # SOCIAL                              `
  'zoom',                               `
  'discord',                            `
  'slack',                              `
  # OFFICE                              `
  'office365proplus'                    `
  'googledrive',                        `
  'irfanview',                          `
  'irfanviewplugins',                   `
  'adobereader',                        `
  'dropbox',                            `
  # DEV TOOLS                           `
  'jre8',                               `
  'jdk8',                               `
  '7zip.install',                       `
  'notepadplusplus.install',            `
  `anaconda3`                           `
  # WINDOWS TOOLS                       `
  'windirstat',                         `
  'rufus',                              `
  'sysinternals',                       `
  'autohotkey.install',                 `
  'processepxlorer',                    `
  'wireshark',                          `
  'sharex',                             `
  'shutup10',                           `
  # ...WSL                              `
  'wsl',                                `
  'wsl-debiangnulinux',                 `
  'wsltty',                             `
  # MEDIA                               `
  'vlc',                                `
  'asio4all',                           `         
  'audacity',                           `
  'audacity-lame'                       `
  

# install packages
$packages | ForEach-Object {choco install -y $_}