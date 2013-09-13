Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qc0-f202.google.com ([209.85.216.202]:33862 "EHLO
	mail-qc0-f202.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755528Ab3IMVvm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Sep 2013 17:51:42 -0400
Received: by mail-qc0-f202.google.com with SMTP id r5so228544qcx.1
        for <linux-kbuild@vger.kernel.org>; Fri, 13 Sep 2013 14:51:41 -0700 (PDT)
Subject: [patch 2/2] ./Makefile: enable -Werror=implicit-int and -Werror=strict-prototypes by default
From: akpm@linux-foundation.org
Date: Fri, 13 Sep 2013 14:51:40 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ASCII
Content-Transfer-Encoding: 8bit
Message-Id: <20130913215141.43D1931C1EA@corp2gmr1-1.hot.corp.google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, slyfox@gentoo.org, geert@linux-m68k.org

From: Sergei Trofimovich <slyfox@gentoo.org>
Subject: ./Makefile: enable -Werror=implicit-int and -Werror=strict-prototypes by default

The common error found in forward-ported/backported patches is missing
headers.  One recent example (files and function names are mangled):

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

[akpm@linux-foundation.org: fix typos in comments]
Signed-off-by: Sergei Trofimovich <slyfox@gentoo.org>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Makefile |    6 ++++++
 1 file changed, 6 insertions(+)

diff -puN Makefile~makefile-enable-werror=implicit-int-and-werror=strict-prototypes-by-default Makefile
--- a/Makefile~makefile-enable-werror=implicit-int-and-werror=strict-prototypes-by-default
+++ a/Makefile
@@ -659,6 +659,12 @@ KBUILD_CFLAGS	+= $(call cc-option,-fno-s
 # conserve stack if available
 KBUILD_CFLAGS   += $(call cc-option,-fconserve-stack)
 
+# disallow errors like 'EXPORT_GPL(foo);' with missing header
+KBUILD_CFLAGS   += $(call cc-option,-Werror=implicit-int)
+
+# require functions to have arguments in prototypes, not empty 'int foo()'
+KBUILD_CFLAGS   += $(call cc-option,-Werror=strict-prototypes)
+
 # use the deterministic mode of AR if available
 KBUILD_ARFLAGS := $(call ar-option,D)
 
_
