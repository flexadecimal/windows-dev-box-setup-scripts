# PERSONAL INSTALL SCRIPT - CHOCOLATEY PACKAGES AND POSTSETUP
# package groups
$thinkpad_specific = [
  'lenovo-thinkvantage-system-update',
  'logitech-options'
]
$browser = ['googlechrome']
$social = [
  'zoom',
  'discord',
  'slack',
]
$office = [
  'office365proplus'
  'googledrive',
  'irfanview',
  'irfanviewplugins',
  'adobereader',
  'dropbox',
]
$dev_tools = [ 
  'jre8',
  'jdk8',
  '7zip.install',
  'notepadplusplus.install',
  'anaconda3'
]
$windows_tools = [
  'windirstat',
  'rufus',
  'sysinternals',
  'autohotkey.install',
  'processepxlorer',
  'wireshark',
  'sharex',
  'shutup10',
]
$wsl = [
  'wsl',
  'wsl-debiangnulinux',
  'wsltty'
]
$media = [
  'vlc',
  'asio4all',         
  'audacity',
  'audacity-lame'
]
# install packages
foreach ($group in $packages){
  foreach ($package in $group){
    $pkg_res_str = if (choco install -y $package) {"[choco] installed '{0}'"} `
    else {"[choco] '{0}' FAILED INSTALLATION"}
    write $pkg_res_str -f $package
  }
}

# postsetup: wsl. run wsl_symlinks
$wsl_symlinks_res_str = if (wsl ./wsl_symlinks.sh 'e' $env:username)`
{"[postsetup: wsl] symlinks created"} else {"[postsetup: wsl] symlink creation failed"}