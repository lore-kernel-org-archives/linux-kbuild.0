Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.18]:59898 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751125AbdKIS1R (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 13:27:17 -0500
From: Sven Joachim <svenjoac@gmx.de>
Subject: [PATCH] builddeb: Pass the kernel:debarch substvar to dpkg-genchanges
Date: Thu, 09 Nov 2017 19:27:06 +0100
Message-ID: <878tfftiit.fsf@turtle.gmx.de>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, linux-kernel@vger.kernel.org

At the end of "make bindeb-pkg" I noticed the following warning:

dpkg-genchanges: warning: unknown substitution variable ${kernel:debarch}

It turns out that since dpkg version 1.19.0 dpkg-genchanges honors
substitution variables in the Description field, while earlier
versions silently left them alone, see https://bugs.debian.org/856547.

The result is an incomplete description of the linux-headers package
in the generated .changes file.  Fix it by passing the kernel:debarch
substitution variable to dpkg-genchanges.

Signed-off-by: Sven Joachim <svenjoac@gmx.de>
---
 scripts/package/builddeb | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/package/builddeb b/scripts/package/builddeb
index 0bc87473f68f..b4f0f2b3f8d2 100755
--- a/scripts/package/builddeb
+++ b/scripts/package/builddeb
@@ -408,9 +408,9 @@ EOF
 	dpkg-source -cdebian/control -ldebian/changelog --format="3.0 (custom)" --target-format="3.0 (quilt)" \
 		-b / ../${sourcename}_${version}.orig.tar.gz  ../${sourcename}_${packageversion}.debian.tar.gz
 	mv ${sourcename}_${packageversion}*dsc ..
-	dpkg-genchanges > ../${sourcename}_${packageversion}_${debarch}.changes
+	dpkg-genchanges -Vkernel:debarch="${debarch}" > ../${sourcename}_${packageversion}_${debarch}.changes
 else
-	dpkg-genchanges -b > ../${sourcename}_${packageversion}_${debarch}.changes
+	dpkg-genchanges -b -Vkernel:debarch="${debarch}" > ../${sourcename}_${packageversion}_${debarch}.changes
 fi
 
 exit 0
-- 
2.15.0

