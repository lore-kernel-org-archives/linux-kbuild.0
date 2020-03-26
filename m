Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ot1-f67.google.com ([209.85.210.67]:36742 "EHLO
        mail-ot1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727354AbgCZTmV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 15:42:21 -0400
From: Nathan Chancellor <natechancellor@gmail.com>
Subject: [PATCH v2] kbuild: Enable -Wtautological-compare
Date: Thu, 26 Mar 2020 12:41:55 -0700
Message-Id: <20200326194155.29107-1-natechancellor@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, clang-built-linux@googlegroups.com, Nick Desaulniers <ndesaulniers@google.com>, Dmitry Vyukov <dvyukov@google.com>, "Gustavo A. R. Silva" <gustavo@embeddedor.com>, Nathan Chancellor <natechancellor@gmail.com>

Currently, we disable -Wtautological-compare, which in turn disables a
bunch of more specific tautological comparison warnings that are useful
for the kernel such as -Wtautological-bitwise-compare. See clang's
documentation below for the other warnings that are suppressed by
-Wtautological-compare. Now that all of the major/noisy warnings have
been fixed, enable -Wtautological-compare so that more issues can be
caught at build time by various continuous integration setups.

-Wtautological-constant-out-of-range-compare is kept disabled under a
normal build but visible at W=1 because there are places in the kernel
where a constant or variable size can change based on the kernel
configuration. These are not fixed in a clean/concise way and the ones
I have audited so far appear to be harmless. It is not a subgroup but
rather just one warning so we do not lose out on much coverage by
default.

Link: https://github.com/ClangBuiltLinux/linux/issues/488
Link: http://releases.llvm.org/10.0.0/tools/clang/docs/DiagnosticsReference.html#wtautological-compare
Link: https://bugs.llvm.org/show_bug.cgi?id=42666
Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
---

v1 -> v2: https://lore.kernel.org/lkml/20200219045423.54190-7-natechancellor@gmail.com/

* Expand commit message a bit by adding more reasoning behind change.
* Disable -Wtautological-constant-out-of-range-compare under a normal
  build but allow it to show up at W=1 for easy auditing.

I hope this can be accepted for 5.7. There are two warnings that I see
still across a bunch of allyesconfig/allmodconfig builds that have
patches sent but not accepted. I will ping them today.

* https://lore.kernel.org/lkml/20191023002014.22571-1-natechancellor@gmail.com/
* https://lore.kernel.org/lkml/20200220051011.26113-1-natechancellor@gmail.com/

 Makefile                   | 2 --
 scripts/Makefile.extrawarn | 1 +
 2 files changed, 1 insertion(+), 2 deletions(-)

diff --git a/Makefile b/Makefile
index db442a9ee6b2..05f9f50dda3e 100644
--- a/Makefile
+++ b/Makefile
@@ -746,8 +746,6 @@ ifdef CONFIG_CC_IS_CLANG
 KBUILD_CPPFLAGS += -Qunused-arguments
 KBUILD_CFLAGS += -Wno-format-invalid-specifier
 KBUILD_CFLAGS += -Wno-gnu
-# Quiet clang warning: comparison of unsigned expression < 0 is always false
-KBUILD_CFLAGS += -Wno-tautological-compare
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
 # source of a reference will be _MergedGlobals and not on of the whitelisted names.
 # See modpost pattern 2
diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
index ca08f2fe7c34..4aea7cf71d11 100644
--- a/scripts/Makefile.extrawarn
+++ b/scripts/Makefile.extrawarn
@@ -49,6 +49,7 @@ KBUILD_CFLAGS += -Wno-format
 KBUILD_CFLAGS += -Wno-sign-compare
 KBUILD_CFLAGS += -Wno-format-zero-length
 KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
+KBUILD_CFLAGS += -Wno-tautological-constant-out-of-range-compare
 endif
 
 endif
-- 
2.26.0
