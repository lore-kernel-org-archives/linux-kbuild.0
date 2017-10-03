Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f182.google.com ([209.85.192.182]:49330 "EHLO
        mail-pf0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751255AbdJCUtl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Oct 2017 16:49:41 -0400
Received: by mail-pf0-f182.google.com with SMTP id l188so5173223pfc.6
        for <linux-kbuild@vger.kernel.org>; Tue, 03 Oct 2017 13:49:41 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [RFC PATCH 1/2] kbuild: Pass HOSTCC and similar to tools Makefiles
Date: Tue,  3 Oct 2017 13:48:38 -0700
Message-Id: <20171003204839.27551-2-dianders@chromium.org>
In-Reply-To: <20171003204839.27551-1-dianders@chromium.org>
References: <20171003204839.27551-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, mmarek@suse.com, acme@redhat.com
Cc: groeck@chromium.org, Dmitry Torokhov <dmitry.torokhov@gmail.com>, mka@chromium.org, Douglas Anderson <dianders@chromium.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

The main Linux Makefiles and the tools sub-Makefiles have different
conventions for passing in CC / CFLAGS.

Here's brief summary for the kernel:
* CC: target C compiler (must be passed as an argument to make to
  override)
* HOSTCC: host C compiler (must be passed as an argument to make to
  override)
* CFLAGS: ignored (kernel manages its own CFLAGS)
* KCFLAGS: extra cflags for the target (expected as an env var)
* HOSTCFLAGS: host C compiler flags (not modifiable by the caller of
  make)

Here's a brief summary for the tools:
* CC: host C compiler (must be passed as an argument to make to
  override)
* CFLAGS: base arguments for the host C compiler which are added to by
  sub builds (expected as an env var)

When the main kernel Makefile calls into the tools Makefile, it should
adapt things from its syntax to the tools Makefile syntax.

If we don't do this, we have a few issues:
* If someone wants to user another compiler (like clang, maybe) for
  hostcc then the tools will still be compiled with gcc.
* If you happen to be building and you left ${CFLAGS} set to something
  random (maybe it matches ${CC}, the _target_ C compiler, not the
  _host_ C compiler) then this random value will be used to compile
  the tools.

In any case, it seems like it makes sense to pass CC, CFLAGS, and
similar properly into the tools Makefile.

NOTE: in order to do this properly, we need to add some new
definitions of HOSTAS and HOSTLD into the main kernel Makefile.  If we
don't do this and someone overrides "AS" or "LD" on the command line
then those (which were intended for the target) will be used to build
host side tools.  We also make up some imaginary "HOSTASFLAGS" and
"HOSTLDFLAGS".  Someone could specify these, but if they don't at
least these blank variables will properly clobber ASFLAGS and LDFLAGS
from the kernel.

This was discovered in the Chrome OS build system where CFLAGS (an
environment variable) was accidentally left pointing to flags that
would be an appropriate match to CC.  The kernel didn't use these
CFLAGS so it was never an issue.  Turning on STACKVALIDATION, however,
suddenly invoked a tools build that blew up.

Signed-off-by: Douglas Anderson <dianders@chromium.org>
---

 Makefile | 30 ++++++++++++++++++++++++++++--
 1 file changed, 28 insertions(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index cf007a31d575..0d3af0677d88 100644
--- a/Makefile
+++ b/Makefile
@@ -298,7 +298,9 @@ HOST_LFS_CFLAGS := $(shell getconf LFS_CFLAGS)
 HOST_LFS_LDFLAGS := $(shell getconf LFS_LDFLAGS)
 HOST_LFS_LIBS := $(shell getconf LFS_LIBS)
 
+HOSTAS       = as
 HOSTCC       = gcc
+HOSTLD       = ld
 HOSTCXX      = g++
 HOSTCFLAGS   := -Wall -Wmissing-prototypes -Wstrict-prototypes -O2 \
 		-fomit-frame-pointer -std=gnu89 $(HOST_LFS_CFLAGS)
@@ -1616,11 +1618,35 @@ image_name:
 # Clear a bunch of variables before executing the submake
 tools/: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/
+	$(Q)ASFLAGS="$(HOSTASFLAGS)"\
+		LDFLAGS="$(HOSTLDFLAGS)" \
+		CFLAGS="$(HOSTCFLAGS)" \
+		CXXFLAGS="$(HOSTCXXFLAGS)" \
+		$(MAKE) \
+		AS="$(HOSTAS)" \
+		CC="$(HOSTCC)" \
+		CXX="$(HOSTCXX)" \
+		LD="$(HOSTLD)" \
+		MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" \
+		O=$(abspath $(objtree)) \
+		subdir=tools \
+		-C $(src)/tools/
 
 tools/%: FORCE
 	$(Q)mkdir -p $(objtree)/tools
-	$(Q)$(MAKE) LDFLAGS= MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" O=$(abspath $(objtree)) subdir=tools -C $(src)/tools/ $*
+	$(Q)ASFLAGS="$(HOSTASFLAGS)"\
+		LDFLAGS="$(HOSTLDFLAGS)" \
+		CFLAGS="$(HOSTCFLAGS)" \
+		CXXFLAGS="$(HOSTCXXFLAGS)" \
+		$(MAKE) \
+		AS="$(HOSTAS)" \
+		CC="$(HOSTCC)" \
+		CXX="$(HOSTCXX)" \
+		LD="$(HOSTLD)" \
+		MAKEFLAGS="$(tools_silent) $(filter --j% -j,$(MAKEFLAGS))" \
+		O=$(abspath $(objtree)) \
+		subdir=tools \
+		-C $(src)/tools/ $*
 
 # Single targets
 # ---------------------------------------------------------------------------
-- 
2.14.2.920.gcf0c67979c-goog

