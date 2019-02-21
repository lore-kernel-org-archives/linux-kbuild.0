Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:59130 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726893AbfBUWTd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Feb 2019 17:19:33 -0500
From: Arseny Maslennikov <ar@cs.msu.ru>
Date: Fri, 22 Feb 2019 00:58:59 +0300
Message-Id: <20190221215901.23970-3-ar@cs.msu.ru>
In-Reply-To: <20190221215901.23970-1-ar@cs.msu.ru>
References: <20190221215901.23970-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH] scripts/package/mkdebian: expose KCONFIG_CONFIG to debian/rules
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Arseny Maslennikov <ar@cs.msu.ru>, Ben Hutchings <ben@decadent.org.uk>, Riku Voipio <riku.voipio@linaro.org>

If KCONFIG_CONFIG is passed to `make deb-pkg` as a makeflag or
environment variable, the source tarball produced contains whatever
specified by that variable instead of the usual `.config'.

While `make deb-pkg' yields a correct Debian binary package (at least
on amd64), the generated source package's debian/rules does not pass
KCONFIG_CONFIG to make(1), thus rendering the source package unable to
be rebuilt.

Steps to reproduce the kind of failure being fixed:
1)  Produce a source and binary package with:
	% KCONFIG_CONFIG=my.config make deb-pkg
2)  In the parent directory:
	% dpkg-source -x linux-*.dsc
3)  In the unpacked source directory:
	% debuild -i -us -uc

Here is an excerpt from an example output of `debuild -i -us -uc':

make[2]: *** No rule to make target '.config', needed by 'kernel/config_data.gz'.  Stop.
make[1]: *** [Makefile:1043: kernel] Error 2
make[1]: Leaving directory '/home/ar/linux-kernel/deb/linux-5.0.0-rc5-tks-gitd6ff78479ec5-57-5.0.0-rc5-tks-gitd6ff78479ec5-57'
make: *** [debian/rules:4: build] Error 2
dpkg-buildpackage: error: debian/rules build subprocess returned exit status 2
debuild: fatal error at line 1182:
dpkg-buildpackage -us -uc -ui -i failed

Signed-off-by: Arseny Maslennikov <ar@cs.msu.ru>
---
 scripts/package/mkdebian | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/scripts/package/mkdebian b/scripts/package/mkdebian
index edcad61fe3cd..130d3f6696eb 100755
--- a/scripts/package/mkdebian
+++ b/scripts/package/mkdebian
@@ -207,10 +207,12 @@ cat <<EOF > debian/rules
 
 build:
 	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
+	KCONFIG_CONFIG=${KCONFIG_CONFIG} \
 	KBUILD_BUILD_VERSION=${revision} KBUILD_SRC=
 
 binary-arch:
 	\$(MAKE) KERNELRELEASE=${version} ARCH=${ARCH} \
+	KCONFIG_CONFIG=${KCONFIG_CONFIG} \
 	KBUILD_BUILD_VERSION=${revision} KBUILD_SRC= intdeb-pkg
 
 clean:
-- 
2.20.1
