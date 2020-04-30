Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:35227 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726337AbgD3GTF (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 02:19:05 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] kconfig: announce removal of 'kvmconfig' and 'xenconfig' shorthands
Date: Thu, 30 Apr 2020 15:18:45 +0900
Message-Id: <20200430061845.775144-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: kvm@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

kvmconfig' is a shorthand for kvm_guest.config to save 7 character typing.

xenconfig' is a shorthand for xen.config to save 1 character typing.

There is nothing more than that.

There are more files in kernel/configs/, so it is not maintainable
to wire-up every config fragment to the Kconfig Makefile. Hence,
we should not do this at all.

These will be removed after Linux 5.10. Meanwhile, the following
warning message will be displayed if they are used.

WARNING: 'make kvmconfig' will be removed after Linux 5.10
         Please use 'make kvm_guest.config' instead.

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 scripts/kconfig/Makefile | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 1015abec9e58..30c69e83652b 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -96,11 +96,13 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 
 PHONY += kvmconfig
 kvmconfig: kvm_guest.config
-	@:
+	@echo >&2 "WARNING: 'make $@' will be removed after Linux 5.10"
+	@echo >&2 "         Please use 'make $<' instead."
 
 PHONY += xenconfig
 xenconfig: xen.config
-	@:
+	@echo >&2 "WARNING: 'make $@' will be removed after Linux 5.10"
+	@echo >&2 "         Please use 'make $<' instead."
 
 PHONY += tinyconfig
 tinyconfig:
@@ -137,9 +139,6 @@ help:
 	@echo  '  helpnewconfig   - List new options and help text'
 	@echo  '  olddefconfig	  - Same as oldconfig but sets new symbols to their'
 	@echo  '                    default value without prompting'
-	@echo  '  kvmconfig	  - Enable additional options for kvm guest kernel support'
-	@echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel'
-	@echo  '                    support'
 	@echo  '  tinyconfig	  - Configure the tiniest possible kernel'
 	@echo  '  testconfig	  - Run Kconfig unit tests (requires python3 and pytest)'
 
-- 
2.25.1
