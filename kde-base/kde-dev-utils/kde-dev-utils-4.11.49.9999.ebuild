# Copyright 1999-2013 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: $

EAPI=5

inherit kde4-base

DESCRIPTION="KDE Development Utilities"
KEYWORDS=""
IUSE="debug"

add_blocker kdesdk-misc
add_blocker kstartperf
add_blocker kuiviewer
