Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:47673 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760140Ab3HNTmt (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Aug 2013 15:42:49 -0400
From: Sergei Trofimovich <slyfox@gentoo.org>
Subject: [PATCH] Makefile: enable -Werror=implicit-int and -Werror=strict-prototypes by default
Date: Wed, 14 Aug 2013 22:39:29 +0300
Message-Id: <1376509169-29141-1-git-send-email-slyfox@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Sergei Trofimovich <slyfox@gentoo.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

The common error fount in forward-ported/backported patches is missing headers.
One recent example (files and function names are mangled):

    void foo(){}
    EXPORT_SYMBOL(foo);

gave only warning

    foo.c:12345678:5: warning: function declaration isn't a prototype [-Wstrict-prototypes]
    void foo(){}
         ^

    foo.c:12345679:5: warning: data definition has no type or storage class [enabled by default]
    EXPORT_SYMBOL(foo);
    foo.c:12345679:5: warning: type defaults to 'int' in declaration of 'EXORT_SYMBOL' [-Werror=implicit-int]

Now it's a fatal error. Tested on x86_64 allyesconfig.

Cc: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 6e48848..eda0126 100644
--- a/Makefile
+++ b/Makefile
@@ -372,6 +372,8 @@ KBUILD_CPPFLAGS := -D__KERNEL__
 KBUILD_CFLAGS   := -Wall -Wundef -Wstrict-prototypes -Wno-trigraphs \
 		   -fno-strict-aliasing -fno-common \
 		   -Werror-implicit-function-declaration \
+		   -Werror=implicit-int \
+		   -Werror=strict-prototypes \
 		   -Wno-format-security \
 		   -fno-delete-null-pointer-checks
 KBUILD_AFLAGS_KERNEL :=
-- 
1.8.3.2

