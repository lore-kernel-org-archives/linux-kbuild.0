Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.mei.co.jp ([133.183.100.20]:44234 "EHLO smtp.mei.co.jp"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751144AbaFJK1m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 Jun 2014 06:27:42 -0400
From: Masahiro Yamada <yamada.m@jp.panasonic.com>
Subject: [PATCH v2] kbuild: make KBUILD_SHELL overridable and document it
Date: Tue, 10 Jun 2014 19:27:23 +0900
Message-Id: <1402396043-31532-1-git-send-email-yamada.m@jp.panasonic.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.m@jp.panasonic.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>

It seems reasonable enough to allow users to change KBUILD_SHELL from
environments. Also describe it in Documentation/kbuild/kbuild.txt.

Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: Sam Ravnborg <sam@ravnborg.org>
Cc: Michal Marek <mmarek@suse.cz>
---

Changes in v2:
  - set KBUILD_SHELL by "?="

 Documentation/kbuild/kbuild.txt | 5 +++++
 Makefile                        | 2 +-
 2 files changed, 6 insertions(+), 1 deletion(-)

diff --git a/Documentation/kbuild/kbuild.txt b/Documentation/kbuild/kbuild.txt
index 6466704..425cd2e 100644
--- a/Documentation/kbuild/kbuild.txt
+++ b/Documentation/kbuild/kbuild.txt
@@ -233,3 +233,8 @@ KBUILD_VMLINUX_MAIN
 All object files for the main part of vmlinux.
 KBUILD_VMLINUX_INIT and KBUILD_VMLINUX_MAIN together specify
 all the object files used to link vmlinux.
+
+KBUILD_SHELL
+--------------------------------------------------
+Specify which shell to use to run shell scripts in Kbuild.
+Assigned by the top-level Makefile.
diff --git a/Makefile b/Makefile
index f691dc2..079f663 100644
--- a/Makefile
+++ b/Makefile
@@ -235,7 +235,7 @@ KCONFIG_CONFIG	?= .config
 export KCONFIG_CONFIG
 
 # SHELL used by kbuild
-KBUILD_SHELL := $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
+KBUILD_SHELL ?= $(shell if [ -x "$$BASH" ]; then echo $$BASH; \
 	  else if [ -x /bin/bash ]; then echo /bin/bash; \
 	  else echo sh; fi ; fi)
 
-- 
1.9.1

