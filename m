Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:40191 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752406AbeBFAiG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:38:06 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 06/14] kbuild: define PYTHON2 and PYTHON3 variables instead of PYTHON
Date: Tue,  6 Feb 2018 09:34:46 +0900
Message-Id: <1517877294-4826-7-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Tony Luck <tony.luck@intel.com>, linux-ia64@vger.kernel.org, linux-kernel@vger.kernel.org, Fenghua Yu <fenghua.yu@intel.com>

The variable 'PYTHON' allows users to specify a proper executable
name in case the default 'python' does not work.  However, this does
not address the case where both Python 2 and Python 3 scripts are
used in one system.

PEP 394 (https://www.python.org/dev/peps/pep-0394/) provides a
convention for Python scripts portability.  Here is a quotation:

  In order to tolerate differences across platforms, all new code
  that needs to invoke the Python interpreter should not specify
  'python', but rather should specify either 'python2' or 'python3'.
  This distinction should be made in shebangs, when invoking from a
  shell script, when invoking via the system() call, or when invoking
  in any other context.

arch/ia64/scripts/unwcheck.py is apparently written in Python 2, so
it should be invoked by 'python2'.

It is legitimate to use 'python' for scripts compatible with both
Python 2 and Python 3, but this is rare (at least I do not see the
case in kernel tree).  You do not need to make efforts to write your
scripts in that way.  Anyway, Python 2 will retire in 2020.

This commit is needed for my new scripts written in Python 3.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile           | 5 +++--
 arch/ia64/Makefile | 2 +-
 2 files changed, 4 insertions(+), 3 deletions(-)

diff --git a/Makefile b/Makefile
index 11aff0f..c4e935c 100644
--- a/Makefile
+++ b/Makefile
@@ -384,7 +384,8 @@ GENKSYMS	= scripts/genksyms/genksyms
 INSTALLKERNEL  := installkernel
 DEPMOD		= /sbin/depmod
 PERL		= perl
-PYTHON		= python
+PYTHON2		= python2
+PYTHON3		= python3
 CHECK		= sparse
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
@@ -430,7 +431,7 @@ GCC_PLUGINS_CFLAGS :=
 
 export ARCH SRCARCH CONFIG_SHELL HOSTCC HOSTCFLAGS CROSS_COMPILE AS LD CC
 export CPP AR NM STRIP OBJCOPY OBJDUMP HOSTLDFLAGS HOST_LOADLIBES
-export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON UTS_MACHINE
+export MAKE LEX YACC AWK GENKSYMS INSTALLKERNEL PERL PYTHON2 PYTHON3 UTS_MACHINE
 export HOSTCXX HOSTCXXFLAGS LDFLAGS_MODULE CHECK CHECKFLAGS
 
 export KBUILD_CPPFLAGS NOSTDINC_FLAGS LINUXINCLUDE OBJCOPYFLAGS LDFLAGS
diff --git a/arch/ia64/Makefile b/arch/ia64/Makefile
index 2dd7f51..862a2ba 100644
--- a/arch/ia64/Makefile
+++ b/arch/ia64/Makefile
@@ -75,7 +75,7 @@ vmlinux.gz: vmlinux
 	$(Q)$(MAKE) $(build)=$(boot) $@
 
 unwcheck: vmlinux
-	-$(Q)READELF=$(READELF) $(PYTHON) $(srctree)/arch/ia64/scripts/unwcheck.py $<
+	-$(Q)READELF=$(READELF) $(PYTHON2) $(srctree)/arch/ia64/scripts/unwcheck.py $<
 
 archclean:
 	$(Q)$(MAKE) $(clean)=$(boot)
-- 
2.7.4

