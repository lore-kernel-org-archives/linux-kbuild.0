Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:56524 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1756794AbZKQW7H (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Nov 2009 17:59:07 -0500
Message-Id: <200911172245.nAHMjEo9000533@imap1.linux-foundation.org>
Subject: [patch 3/3] kconfig CROSS_COMPILE option
From: akpm@linux-foundation.org
Date: Tue, 17 Nov 2009 14:45:14 -0800
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, roland@redhat.com

From: Roland McGrath <roland@redhat.com>

This adds CROSS_COMPILE as a kconfig string so you can store it in
.config.  Then you can use plain "make" in the configured kernel build
directory to do the right cross compilation without setting the
command-line or environment variable every time.

With this, you can set up different build directories for different kernel
configurations, whether native or cross-builds, and then use the simple:

	make -C /build/dir M=module-source-dir

idiom to build modules for any given target kernel, indicating which one
by nothing but the build directory chosen.

I tried a version that defaults the string with env="CROSS_COMPILE" so
that in a "make oldconfig" with CROSS_COMPILE in the environment you can
just hit return to store the way you're building it.  But the kconfig
prompt for strings doesn't give you any way to say you want an empty
string instead of the default, so I punted that.

Signed-off-by: Roland McGrath <roland@redhat.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Makefile     |    3 +++
 init/Kconfig |    8 ++++++++
 2 files changed, 11 insertions(+)

diff -puN Makefile~kconfig-cross_compile-option Makefile
--- a/Makefile~kconfig-cross_compile-option
+++ a/Makefile
@@ -177,11 +177,14 @@ SUBARCH := $(shell uname -m | sed -e s/i
 # CROSS_COMPILE can be set on the command line
 # make CROSS_COMPILE=ia64-linux-
 # Alternatively CROSS_COMPILE can be set in the environment.
+# A third alternative is to store a setting in .config so that plain
+# "make" in the configured kernel build directory always uses that.
 # Default value for CROSS_COMPILE is not to prefix executables
 # Note: Some architectures assign CROSS_COMPILE in their arch/*/Makefile
 export KBUILD_BUILDHOST := $(SUBARCH)
 ARCH		?= $(SUBARCH)
 CROSS_COMPILE	?=
+CROSS_COMPILE	?= $(CONFIG_CROSS_COMPILE:"%"=%)
 
 # Architecture as present in compile.h
 UTS_MACHINE 	:= $(ARCH)
diff -puN init/Kconfig~kconfig-cross_compile-option init/Kconfig
--- a/init/Kconfig~kconfig-cross_compile-option
+++ a/init/Kconfig
@@ -76,6 +76,14 @@ config INIT_ENV_ARG_LIMIT
 	  variables passed to init from the kernel command line.
 
 
+config CROSS_COMPILE
+	string "Cross-compiler tool prefix"
+	help
+	  Same as running 'make CROSS_COMPILE=prefix-' but stored for
+	  default make runs in this kernel build directory.  You don't
+	  need to set this unless you want the configured kernel build
+	  directory to select the cross-compiler automatically.
+
 config LOCALVERSION
 	string "Local version - append to kernel release"
 	help
_
