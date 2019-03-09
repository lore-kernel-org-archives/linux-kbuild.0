Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:50712 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726286AbfCIPns (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 9 Mar 2019 10:43:48 -0500
From: Arseny Maslennikov <ar@cs.msu.ru>
Date: Sat,  9 Mar 2019 18:43:07 +0300
Message-Id: <20190309154307.23039-3-ar@cs.msu.ru>
In-Reply-To: <20190309154307.23039-1-ar@cs.msu.ru>
References: <20190309154307.23039-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH v2 3/3] package: {mkdebian,Makefile}: ignore .config in dpkg-source diffs
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arseny Maslennikov <ar@cs.msu.ru>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>

* We'd like to make dpkg-source ignore certain filepath patterns while
  producing the .diff.gz as part of a Debian source package.
  The relationship between dpkg-source's -i and --extend-diff-ignore
  options is quite complicated[1]. It's thus not very convenient to
  specify file path patterns to ignore on dpkg-buildpackage's command
  line (they do not end up in the source package as well), so we turn
  `-i.git' into a record in debian/source/options.
  Besides, the dot in `-i.git' is a metacharacter and matches a tad
  too much.

* In cases where a .config exists in the source tree, but the .config
  in the source tarball is provided by wherever KCONFIG_CONFIG pointed
  to, dpkg-source would attempt to replace the second, proper one with
  the first one, which is undesirable and nullifies the effort made
  to put the proper config in the source tarball.
  To prevent this, force dpkg-source to ignore /^[.]config$/ as well.

This makes it possible to build working Debian source packages with a
redefined KCONFIG_CONFIG:
 - that file is put in the source tarball at its traditional place,
   and the diff.gz does not dare touch it;
 - when the source package is rebuilt, debian/rules initiates the build
   process with the desired config already in the standard location.

[1] https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=625789#22

Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
---
 scripts/package/Makefile | 2 +-
 scripts/package/mkdebian | 6 ++++++
 2 files changed, 7 insertions(+), 1 deletion(-)

diff --git a/scripts/package/Makefile b/scripts/package/Makefile
index 134cefee068d..f2fca7e7d9fa 100644
--- a/scripts/package/Makefile
+++ b/scripts/package/Makefile
@@ -73,7 +73,7 @@ deb-pkg: FORCE
 	$(call cmd,src_tar,$(KDEB_SOURCENAME))
 	origversion=$$(dpkg-parsechangelog -SVersion |sed 's/-[^-]*$$//');\
 		mv $(KDEB_SOURCENAME).tar.gz ../$(KDEB_SOURCENAME)_$${origversion}.orig.tar.gz
-	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -i.git -us -uc
+	+dpkg-buildpackage -r$(KBUILD_PKG_ROOTCMD) -a$$(cat debian/arch) $(DPKG_FLAGS) -us -uc
 
 bindeb-pkg: FORCE
 	$(CONFIG_SHELL) $(srctree)/scripts/package/mkdebian
diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index d276eb671a27..74158c7f28ea 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -135,6 +135,12 @@ fi
 mkdir -p debian/source/
 echo "1.0" > debian/source/format
 
+cat <<EOF > debian/source/options
+# The regexes are matched against paths from the source tree.
+diff-ignore = "[.]git"
+extend-diff-ignore = "^[.]config$"
+EOF
+
 echo $debarch > debian/arch
 
 # Generate a simple changelog template
-- 
2.20.1
