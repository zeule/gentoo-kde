# Copyright 1999-2009 Gentoo Foundation
# Distributed under the terms of the GNU General Public License v2
# $Header: /var/cvsroot/gentoo-x86/kde-base/kcminit/kcminit-4.2.2.ebuild,v 1.2 2009/04/17 06:33:26 alexxy Exp $

EAPI="2"

KMNAME="kdebase-workspace"
inherit kde4-meta

DESCRIPTION="KCMInit - runs startups initialization for Control Modules."
KEYWORDS=""
IUSE="debug"

DEPEND="
	>=kde-base/ksplash-${PV}:${SLOT}[kdeprefix=]
"
RDEPEND="${DEPEND}"
