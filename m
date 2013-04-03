Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f176.google.com ([209.85.217.176]:63132 "EHLO
	mail-lb0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758844Ab3DCOlC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Apr 2013 10:41:02 -0400
Received: by mail-lb0-f176.google.com with SMTP id y8so1651114lbh.21
        for <linux-kbuild@vger.kernel.org>; Wed, 03 Apr 2013 07:41:01 -0700 (PDT)
From: Antony Pavlov <antonynpavlov@gmail.com>
Subject: [PATCH v2] kbuild: fix ld-option function
Date: Wed,  3 Apr 2013 18:42:33 +0400
Message-Id: <1365000153-8318-1-git-send-email-antonynpavlov@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Sascha Hauer <s.hauer@pengutronix.de>, linux-kbuild@vger.kernel.org, Antony Pavlov <antonynpavlov@gmail.com>

The kbuild's ld-option function is broken because
the command
  $(CC) /dev/null -c -o "$$TMPO"
does not create object file!

I have used a relatively old mips gcc 3.4.6 cross-compiler
and a relatively new gcc 4.7.2 to check this fact
but the results are the same.

EXAMPLE:
  $ rm /tmp/1.o
  $ mips-linux-gcc /dev/null -c -o /tmp/1.o
  mips-linux-gcc: /dev/null: linker input file unused because linking not done
  $ ls -la /tmp/1.o
  ls: cannot access /tmp/1.o: No such file or directory

We can easily fix the problem by adding
the '-x c' compiler option.

EXAMPLE:
  $ rm /tmp/1.o
  $ mips-linux-gcc -x c /dev/null -c -o /tmp/1.o
  $ ls -la /tmp/1.o
  -rw-r--r-- 1 antony antony 778 Apr  2 20:40 /tmp/1.o

Also fix wrong ld-option example.

Signed-off-by: Antony Pavlov <antonynpavlov@gmail.com>
---
 Documentation/kbuild/makefiles.txt |    2 +-
 scripts/Kbuild.include             |    2 +-
 2 files changed, 2 insertions(+), 2 deletions(-)

diff --git a/Documentation/kbuild/makefiles.txt b/Documentation/kbuild/makefiles.txt
index 5198b74..5836294 100644
--- a/Documentation/kbuild/makefiles.txt
+++ b/Documentation/kbuild/makefiles.txt
@@ -593,7 +593,7 @@ more details, with real examples.
 
 	Example:
 		#Makefile
-		LDFLAGS_vmlinux += $(call really-ld-option, -X)
+		LDFLAGS_vmlinux += $(call ld-option, -X)
 
 
 === 4 Host Program support
diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 978416d..547e15d 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -148,7 +148,7 @@ cc-ldoption = $(call try-run,\
 # ld-option
 # Usage: LDFLAGS += $(call ld-option, -X)
 ld-option = $(call try-run,\
-	$(CC) /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
+	$(CC) -x c /dev/null -c -o "$$TMPO" ; $(LD) $(1) "$$TMPO" -o "$$TMP",$(1),$(2))
 
 # ar-option
 # Usage: KBUILD_ARFLAGS := $(call ar-option,D)
-- 
1.7.10.4

