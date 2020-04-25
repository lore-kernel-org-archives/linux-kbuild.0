Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from m12-14.163.com ([220.181.12.14]:34093 "EHLO m12-14.163.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725837AbgDYGJO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 25 Apr 2020 02:09:14 -0400
From: Wang Nan <pi3orama@163.com>
Subject: [PATCH] kbuild: Add $(strip ...) before compare make variable with string
Date: Sat, 25 Apr 2020 14:07:38 +0800
Message-Id: <1587794858-938-1-git-send-email-pi3orama@163.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: wangnan0@huawei.com, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Wang Nan <pi3orama@163.com>

Some of ifneq in Makefile.build works improperly:

 ifneq ($(a)$(b)$(c),)
 ...
 endif

Because some make vairable contains unintended spaces introduced by:

 a := $(x) $(y)

This commit adds $(strip ...) to some potentially buggy ifneq.

Signed-off-by: Wang Nan <pi3orama@163.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>
---
 scripts/Makefile.build | 6 +++---
 1 file changed, 3 insertions(+), 3 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 9fcbfac..b2bc0db 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -46,7 +46,7 @@ include $(kbuild-file)
 include scripts/Makefile.lib
 
 # Do not include host rules unless needed
-ifneq ($(hostprogs)$(hostcxxlibs-y)$(hostcxxlibs-m),)
+ifneq ($(strip $(hostprogs) $(hostcxxlibs-y) $(hostcxxlibs-m)),)
 include scripts/Makefile.host
 endif
 
@@ -55,7 +55,7 @@ $(warning kbuild: Makefile.build is included improperly)
 endif
 
 ifeq ($(need-modorder),)
-ifneq ($(obj-m),)
+ifneq ($(strip $(obj-m)),)
 $(warning $(patsubst %.o,'%.ko',$(obj-m)) will not be built even though obj-m is specified.)
 $(warning You cannot use subdir-y/m to visit a module Makefile. Use obj-y/m instead.)
 endif
@@ -512,7 +512,7 @@ obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
 # If targets exist, their directories apparently exist. Skip mkdir.
 existing-dirs := $(sort $(patsubst %/,%, $(dir $(existing-targets))))
 obj-dirs := $(strip $(filter-out $(existing-dirs), $(obj-dirs)))
-ifneq ($(obj-dirs),)
+ifneq ($(strip $(obj-dirs)),)
 $(shell mkdir -p $(obj-dirs))
 endif
 endif
-- 
2.7.4
