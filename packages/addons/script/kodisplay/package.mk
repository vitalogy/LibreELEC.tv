################################################################################
#      This file is part of LibreELEC - http://www.libreelec.tv
#      Copyright (C) 2016 Team LibreELEC
#
#  LibreELEC is free software: you can redistribute it and/or modify
#  it under the terms of the GNU General Public License as published by
#  the Free Software Foundation, either version 2 of the License, or
#  (at your option) any later version.
#
#  LibreELEC is distributed in the hope that it will be useful,
#  but WITHOUT ANY WARRANTY; without even the implied warranty of
#  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
#  GNU General Public License for more details.
#
#  You should have received a copy of the GNU General Public License
#  along with LibreELEC.  If not, see <http://www.gnu.org/licenses/>.
################################################################################

PKG_NAME="kodisplay"
PKG_VERSION="0.0.1"
PKG_ARCH="arm"
PKG_LICENSE="GPL"
PKG_SITE="https://github.com/vitalogy/script.kodisplay"
PKG_URL="https://github.com/vitalogy/script.kodisplay/archive/master.zip"
PKG_SOURCE_DIR="script.kodisplay-master"
PKG_DEPENDS_TARGET="toolchain pygame"
PKG_PRIORITY="optional"
PKG_SECTION="script"
PKG_SHORTDESC="kodisplay: "
PKG_LONGDESC="KoDisplay ${PKG_VERSION} (Kodi Display)"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="kodisplay"
PKG_ADDON_TYPE="xbmc.service"
PKG_ADDON_PROVIDES=""
PKG_ADDON_REPOVERSION="8.0"

PKG_AUTORECONF="no"

make_target() {
  : # nothing to do here
}

makeinstall_target() {
  : # nothing to do here
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/
  cp -PR $PKG_BUILD/* $ADDON_BUILD/$PKG_ADDON_ID/

  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/resources/lib/SDL/
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/resources/lib/SDL/

  # SDL
  cp -P $(get_build_dir SDL)/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/resources/lib/SDL/

  # SDL_ttf
  cp -P $(get_build_dir SDL_ttf)/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/resources/lib/SDL/

  # SDL_image
  cp -P $(get_build_dir SDL_image)/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/resources/lib/SDL/

  # pygame
  cp -PR $(get_build_dir pygame)/.install_pkg/usr/lib/python*/site-packages/pygame $ADDON_BUILD/$PKG_ADDON_ID/resources/lib/

  cd $ADDON_BUILD/$PKG_ADDON_ID/resources/lib
  tar -cvzf lib.tgz pygame SDL 1>/dev/null
  rm -rf SDL pygame
  cd $ROOT
}
