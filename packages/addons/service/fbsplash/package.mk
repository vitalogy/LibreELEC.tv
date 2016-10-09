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
PKG_DEPENDS_TARGET="toolchain plymouth-lite"
PKG_SECTION="service"
PKG_SHORTDESC="Display a splash on a framebuffer device"
PKG_LONGDESC="This addon shows an image as a splash screen on a framebuffer device. The addon includes the executable ply-image from the package plymouth-lite."
PKG_AUTORECONF="no"

PKG_IS_ADDON="yes"
PKG_ADDON_NAME="Framebuffer Splash"
PKG_ADDON_TYPE="xbmc.service"

make_target() {
  : # nothing todo here
}

makeinstall_target() {
  : # nothing todo here
}

addon() {
  mkdir -p $ADDON_BUILD/$PKG_ADDON_ID/bin
    cp -PR $(get_build_dir plymouth-lite)/.install_pkg/usr/bin/* $ADDON_BUILD/$PKG_ADDON_ID/bin/
}
