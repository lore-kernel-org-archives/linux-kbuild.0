Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx.kolk.cc ([212.83.177.64]:57872 "EHLO mx.kolk.cc"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725947AbfBEMqg (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Feb 2019 07:46:36 -0500
From: =?UTF-8?q?Kacper=20Ko=C5=82odziej?= <kacper@kolodziej.it>
Subject: [PATCH] kbuild: [bin]deb-pkg: add DPKG_FLAGS variable
Date: Tue,  5 Feb 2019 13:37:52 +0100
Message-Id: <20190205123752.25432-1-kacper@kolodziej.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kacper@kolodziej.it

DPKG_FLAGS variable lets user to add more flags to dpkg-buildpackage
command in deb-pkg and bindeb-pkg.

Signed-off-by: Kacper Kołodziej <kacper@kolodziej.it>
---
 scripts/package/Makefile | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 453fecee62f0..6963eacb323c 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -72,11 +72,11 @@ deb-pkg: FORCE
 	$(call cmd,src_tar,$(KDEB_SOURCENAME))
 	origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
 		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
-	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) -i.git -us -uc
+	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -i.git -us -uc
 
 bindeb-pkg: FORCE
 	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
-	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) -b -nc -uc
+	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -b -nc -uc
 
 intdeb-pkg: FORCE
 	+$(CONFIG_SHELL) $(srctree)/scripts/package/builddeb
-- 
2.20.1
