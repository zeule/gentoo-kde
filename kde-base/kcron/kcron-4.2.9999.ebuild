# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kcron/kcron-4.2.2.ebuild,v 1.2 2009/04/17 06:36:54 alexxy Exp $

EAPI="2"

KMNAME="kdeadmin"
inherit kde4-meta

DESCRIPTION="KDE Task Scheduler"
KEYWORDS=""
IUSE="debug doc"

RDEPEND="virtual/cron"
