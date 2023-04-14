TERMUX_SUBPKG_DESCRIPTION="GTK+ 3 platform theme for Qt 6"
TERMUX_SUBPKG_DEPENDS="qt6-qtbase, gtk3"
TERMUX_SUBPKG_INCLUDE="
libexec/qt/platformthemes/libqgtk3.so
lib/cmake/Qt6Gui/Qt6Gui_QGtk3ThemePlugin.cmake
"
