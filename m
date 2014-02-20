Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:51373 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754524AbaBTOVt convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:5:1>);
	Thu, 20 Feb 2014 09:21:49 -0500
Message-Id: <53061D88020000780011DFD2@nat28.tlf.novell.com>
Date: Thu, 20 Feb 2014 14:21:44 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: [PATCH] fix build with make 3.80 again
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>
Cc: Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, linux-kbuild@vger.kernel.org

According to Documentation/Changes, make 3.80 is still being supported
for building the kernel, hence make files must not make (unconditional)
use of features introduced only in newer versions. Commit 8779657d
("stackprotector: Introduce CONFIG_CC_STACKPROTECTOR_STRONG") however
introduced an "else ifdef" construct which make 3.80 doesn't understand.

Also correct a warning message still referencing the old config option
name.

Apart from that I question the use of "ifdef" here (but it was used
that way already prior to said commit): ifeq (,y) would seem more to
the point.

Signed-off-by: Jan Beulich <jbeulich@suse.com>
Cc: Kees Cook <keescook@chromium.org>
Cc: Ingo Molnar <mingo@kernel.org>
---
 Makefile |    6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

--- 3.14-rc3/Makefile
+++ 3.14-rc3-make-3.80/Makefile
@@ -605,10 +605,11 @@ endif
 ifdef CONFIG_CC_STACKPROTECTOR_REGULAR
   stackp-flag := -fstack-protector
   ifeq ($(call cc-option, $(stackp-flag)),)
-    $(warning Cannot use CONFIG_CC_STACKPROTECTOR: \
+    $(warning Cannot use CONFIG_CC_STACKPROTECTOR_REGULAR: \
 	      -fstack-protector not supported by compiler))
   endif
-else ifdef CONFIG_CC_STACKPROTECTOR_STRONG
+else
+ifdef CONFIG_CC_STACKPROTECTOR_STRONG
   stackp-flag := -fstack-protector-strong
   ifeq ($(call cc-option, $(stackp-flag)),)
     $(warning Cannot use CONFIG_CC_STACKPROTECTOR_STRONG: \
@@ -618,6 +619,7 @@ else
   # Force off for distro compilers that enable stack protector by default.
   stackp-flag := $(call cc-option, -fno-stack-protector)
 endif
+endif
 KBUILD_CFLAGS += $(stackp-flag)
 
 # This warning generated too much noise in a regular build.



