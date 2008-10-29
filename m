Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:43407 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754144AbYJ2VUd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 29 Oct 2008 17:20:33 -0400
Message-Id: <200810292120.m9TLK8DV019358@imap1.linux-foundation.org>
Subject: [patch 04/13] scripts/package: don't break if %{_smp_mflags} isn't set
From: akpm@linux-foundation.org
Date: Wed, 29 Oct 2008 14:20:08 -0700
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, jk@ozlabs.org

From: Jeremy Kerr <jk@ozlabs.org>

Currently, if we do a 'make rpm-pkg' without the _smp_mflags rpm macro
defined, the build fails with:

  [snip]
  Executing(%build): /bin/bash -e /var/tmp/rpm-tmp.67959
  + umask 022
  + cd /home/jk/devel/kernel-snapshot/rpm/BUILD
  + cd kernel-2.6.26
  + make clean
  + make '%{_smp_mflags}'
  make[3]: *** No rule to make target `%{_smp_mflags}'.  Stop.
  error: Bad exit status from /var/tmp/rpm-tmp.67959 (%build)

This change uses the 'null if not set' reference to the _smp_mflags
macro instead.

Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 scripts/package/mkspec |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN scripts/package/mkspec~scripts-package-dont-break-if-%_smp_mflags-isnt-set scripts/package/mkspec
--- a/scripts/package/mkspec~scripts-package-dont-break-if-%_smp_mflags-isnt-set
+++ a/scripts/package/mkspec
@@ -57,7 +57,7 @@ fi
 echo "%build"
 
 if ! $PREBUILT; then
-echo "make clean && make %{_smp_mflags}"
+echo "make clean && make %{?_smp_mflags}"
 echo ""
 fi
 
_
