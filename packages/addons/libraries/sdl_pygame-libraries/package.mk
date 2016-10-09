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

PKG_VERSION=""
PKG_REV="100"
PKG_ARCH="any"
PKG_ADDON_PROJECTS="RPi RPi2"
PKG_LICENSE="GPL"
PKG_SITE=""
PKG_URL=""
PKG_DEPENDS_TARGET="toolchain pygame"
PKG_SECTION="virtual"
PKG_SHORTDESC="SDL + pygame"
PKG_LONGDESC="This bundle includes pygame, SDL-1.2, SDL_ttf and SDL_image."
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="SDL + pygame"
PKG_ADDON_TYPE="xbmc.python.module"

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/lib
    cp -PR $(get_build_dir SDL)/.install_pkg/usr/lib/*       $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -PR $(get_build_dir SDL_ttf)/.install_pkg/usr/lib/*   $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -PR $(get_build_dir SDL_image)/.install_pkg/usr/lib/* $ADDON_BUILD/$PKG_ADDON_ID/lib/
    cp -PR $(get_build_dir pygame)/.install_pkg/usr/lib/python*/site-packages/pygame $ADDON_BUILD/$PKG_ADDON_ID/lib/
}
