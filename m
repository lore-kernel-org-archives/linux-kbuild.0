Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf1-f170.google.com ([209.85.210.170]:43575 "EHLO
        mail-pf1-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726832AbfBGVDN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Feb 2019 16:03:13 -0500
Received: by mail-pf1-f170.google.com with SMTP id w73so526586pfk.10
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Feb 2019 13:03:13 -0800 (PST)
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Thu, 7 Feb 2019 13:03:01 -0800
Message-ID: <CAKwvOdkkJ48d_a1K-LPRsTweDXgpGX51NH=nuWK5weNfQ_8RBw@mail.gmail.com>
Subject: CONFIG_CC_IS_CLANG
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Nathan Chancellor <natechancellor@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Masahiro,
I was looking into sprucing up Kbuild for improved LLD support.  One
thing I was curious about was the different checks for clang in the
top level Makefile.

How come a change like:
diff --git a/Makefile b/Makefile
index 3142e67d03f1..525b3fef7d27 100644
--- a/Makefile
+++ b/Makefile
@@ -489,7 +489,7 @@ ifneq ($(KBUILD_SRC),)
  $(Q)$(CONFIG_SHELL) $(srctree)/scripts/mkmakefile $(srctree)
 endif

-ifneq ($(shell $(CC) --version 2>&1 | head -n 1 | grep clang),)
+ifdef CONFIG_CC_IS_CLANG
 ifneq ($(CROSS_COMPILE),)
 CLANG_FLAGS := --target=$(notdir $(CROSS_COMPILE:%-=%))
 GCC_TOOLCHAIN_DIR := $(dir $(shell which $(LD)))


doesn't work?  It's odd that later on in the top level Makefile, we
have that kind of check.  I was hoping to do something similar for
LLD, but it seems that the config options are not defined for that
particular make target?  Does this have to do with config-targets?

-- 
Thanks,
~Nick Desaulniers
