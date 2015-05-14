# Copyright 1999-2015 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

KDE_DOXYGEN="true"
KDE_TEST="false"
inherit kde5

DESCRIPTION="KDE Telepathy common library"
HOMEPAGE="http://community.kde.org/Real-Time_Communication_and_Collaboration"

LICENSE="LGPL-2.1"
KEYWORDS=" ~amd64 ~x86"
IUSE="otr sso"

# todo: kdepimlibs
COMMON_DEPEND="
	$(add_frameworks_dep kcmutils)
	$(add_frameworks_dep kconfig)
	$(add_frameworks_dep kconfigwidgets)
	$(add_frameworks_dep kcoreaddons)
	$(add_frameworks_dep ki18n)
	$(add_frameworks_dep kiconthemes)
	$(add_frameworks_dep knotifications)
	$(add_frameworks_dep knotifyconfig)
	$(add_frameworks_dep kparts)
	$(add_frameworks_dep kpeople)
	$(add_frameworks_dep kservice)
	$(add_frameworks_dep ktexteditor)
	$(add_frameworks_dep kwallet)
	$(add_frameworks_dep kwidgetsaddons)
	$(add_frameworks_dep kxmlgui)
	dev-qt/qtdbus:5
	dev-qt/qtdeclarative:5
	dev-qt/qtgui:5
	dev-qt/qtsql:5
	dev-qt/qtwidgets:5
	dev-qt/qtxml:5
	net-libs/accounts-qt
	net-libs/telepathy-logger-qt:5
	>=net-libs/telepathy-qt-0.9.5[qt5]
	sso? (
		$(add_kdeapps_dep kaccounts-integration)
		net-libs/accounts-qt
	)
	otr? (
		dev-libs/libgcrypt:0=
		>=net-libs/libotr-4.0.0
	)
"
DEPEND="
	${COMMON_DEPEND}
	$(add_frameworks_dep kio)
	dev-qt/qtnetwork:5
"
RDEPEND="
	${COMMON_DEPEND}
	!net-im/ktp-common-internals
"

PATCHES=( "${FILESDIR}/${PN}-tests-optional.patch" )

src_configure() {
	local mycmakeargs=(
		$(cmake-utils_use_find_package doc Doxygen)
		$(cmake-utils_use_find_package sso KAccounts)
		$(cmake-utils_use_find_package sso AccountsQt5)
		$(cmake-utils_use_find_package otr Libgcrypt)
		$(cmake-utils_use_find_package otr LibOTR)
	)

	kde5_src_configure
}

src_compile() {
	kde5_src_compile
	use doc && kde5_src_compile apidox
}

src_install() {
	kde5_src_install
	use doc && dodoc "${BUILD_DIR}"/KTp/docs/html/*
}
