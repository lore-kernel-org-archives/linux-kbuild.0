Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:63393 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726669AbgBAQuU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 1 Feb 2020 11:50:20 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 1/2] kbuild: fix the document to use extra-y for vmlinux.lds
Date: Sun,  2 Feb 2020 01:49:23 +0900
Message-Id: <20200201164924.5487-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <masahiroy@kernel.org>

The difference between "always" and "extra-y" is that the targets
listed in $(always) are always built, whereas the ones in $(extra-y)
are built only when KBUILD_BUILTIN is set.

So, "make modules" does not build the targets in $(extra-y).

vmlinux.lds is only needed for linking vmlinux. So, adding it to extra-y
is more correct. In fact, arch/x86/kernel/Makefile does this.

Fix the example code.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 Documentation/kbuild/makefiles.rst | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
index d7e6534a8505..b1733b877025 100644
--- a/Documentation/kbuild/makefiles.rst
+++ b/Documentation/kbuild/makefiles.rst
@@ -1269,12 +1269,12 @@ When kbuild executes, the following steps are followed (roughly):
 	Example::
 
 		#arch/x86/kernel/Makefile
-		always := vmlinux.lds
+		extra-y := vmlinux.lds
 
 		#Makefile
 		export CPPFLAGS_vmlinux.lds += -P -C -U$(ARCH)
 
-	The assignment to $(always) is used to tell kbuild to build the
+	The assignment to extra-y is used to tell kbuild to build the
 	target vmlinux.lds.
 	The assignment to $(CPPFLAGS_vmlinux.lds) tells kbuild to use the
 	specified options when building the target vmlinux.lds.
-- 
2.17.1
