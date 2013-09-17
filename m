Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm22-vm6.access.bullet.mail.gq1.yahoo.com ([216.39.63.170]:25157
	"EHLO nm22-vm6.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753853Ab3IQXOV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 Sep 2013 19:14:21 -0400
From: danielfsantos@att.net
Subject: [PATCH 2/5] lib: Add .config options for error strings in printks
Date: Tue, 17 Sep 2013 18:08:34 -0500
Message-Id: <1379459317-13046-3-git-send-email-daniel.santos@pobox.com>
In-Reply-To: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
References: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, David Howells <dhowells@redhat.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>
Cc: Daniel Santos <daniel.santos@pobox.com>

This adds to lib/Kconfig.debug the options for printk messages to
display either error number only (the current behavior), number and
error name or number, name and description. These options in turn select
STRERROR_NAME and STRERROR as needed, so I'm not adding any direct
options to enable those, although it can be added later if somebody
needs strerror() or strerror_name() when not enabled in printks.

kconfg

Signed-off-by: Daniel Santos <daniel.santos@pobox.com>
---
 lib/Kconfig.debug | 53 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 1 file changed, 53 insertions(+)

diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
index c9eef36..919f371 100644
--- a/lib/Kconfig.debug
+++ b/lib/Kconfig.debug
@@ -58,6 +58,7 @@ config DYNAMIC_DEBUG
 	  implicitly compiles in all pr_debug() and dev_dbg() calls, which
 	  enlarges the kernel text size by about 2%.
 
+
 	  If a source file is compiled with DEBUG flag set, any
 	  pr_debug() calls in it are enabled by default, but can be
 	  disabled at runtime as below.  Note that DEBUG flag is
@@ -113,6 +114,58 @@ config DYNAMIC_DEBUG
 
 	  See Documentation/dynamic-debug-howto.txt for additional information.
 
+choice
+	prompt "Display errors in printk as"
+	default PRINTK_ERROR_CODES_ONLY
+	depends on PRINTK
+	help
+	  This option tells printk how to display error codes when
+	  formatted with the %de format code (a Linux printk extension).
+	  Error codes are most commonly passed to userspace when syscalls
+	  return where they are then translated into localized descrptions
+	  via libc's strerror(), perror(), etc.  However, many error
+	  conditions (for drivers and such) are only reported via printks
+	  where there is no such userspace mechanism to reliably translate
+	  error numbers into something a little more human.
+
+	  This option allows you to perform that translation in the kernel,
+	  at the cost of a slightly larger kernel. Note that no native
+	  language support is currently, or may ever be provided.
+
+	  If unsure, choose "Error codes only".
+
+config PRINTK_ERROR_CODES_ONLY
+	bool "Error codes only"
+	help
+	  Just display the error number.
+
+config PRINTK_ERROR_NAMES
+	bool "Error names"
+	select STRERROR_NAME
+	help
+	  This option causes printk messages containing an error code to
+	  print the name of the error in addition to the error number.
+	  Enabling this adds about 2k. Example: -22 (EINVAL)
+
+config PRINTK_ERROR_DESCS
+	bool "Full descrptions"
+	select STRERROR
+	select STRERROR_NAME
+	help
+	  This option causes printk messages containing an error code to
+	  print the description of errors (in addition to the name and
+	  number) and can be helpful for those with aversions to search
+	  engines. Enabling this adds about 6k over error codes alone.
+	  Example: -90 (EMSGSIZE: Message too long)
+
+endchoice
+
+config STRERROR
+	bool
+
+config STRERROR_NAME
+	bool
+
 endmenu # "printk and dmesg options"
 
 menu "Compile-time checks and compiler options"
-- 
1.8.1.5

