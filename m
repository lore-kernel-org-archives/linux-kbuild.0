Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw1-f74.google.com ([209.85.161.74]:42002 "EHLO
        mail-yw1-f74.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726101AbfCGNfa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 7 Mar 2019 08:35:30 -0500
Received: by mail-yw1-f74.google.com with SMTP id c74so23231780ywc.9
        for <linux-kbuild@vger.kernel.org>; Thu, 07 Mar 2019 05:35:30 -0800 (PST)
Date: Thu,  7 Mar 2019 14:35:13 +0100
Message-Id: <20190307133514.44378-1-glider@google.com>
Mime-Version: 1.0
Subject: [PATCH 0/1] RFC: introduce CONFIG_INIT_ALL_MEMORY
From: Alexander Potapenko <glider@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, jmorris@namei.org, serge@hallyn.com
Cc: linux-security-module@vger.kernel.org, linux-kbuild@vger.kernel.org, ndesaulniers@google.com, kcc@google.com, dvyukov@google.com, keescook@chromium.org, sspatil@android.com

This patch is a part of a bigger initiative to allow initializing
heap/stack memory in the Linux kernels by default.
The rationale behind doing so is to reduce the severity of bugs caused
by using uninitialized memory.

Over the last two years KMSAN (https://github.com/google/kmsan/) has
found more than a hundred bugs running in a really moderate setup (orders
of magnitude less CPU/months than KASAN). Some of those bugs led to
information leaks if uninitialized memory was copied to the userspace,
other could cause DoS because of subverted control flow.
A lot more bugs remain uncovered, so we want to provide the distros and OS
vendors with a last resort measure to mitigate such bugs.

Our plan is to introduce configuration flags to force initialization of
stack and heap variables with a fixed pattern.
This is going to render information leaks inefficient (as we'll only leak
pattern data) and make uses of uninitialized values in conditions more
deterministic and discoverable.

The stack instrumentation part is only implemented in Clang at the moment
(see https://reviews.llvm.org/D54604 ; there's also a GCC feature request
for a similar flag: https://gcc.gnu.org/bugzilla/show_bug.cgi?id=87210).
The heap initialization part (still work in progress) is going to be
compiler-agnostic.

It'll be possible to opt-out from stack initalization by annotating local
variables as knowingly initialized, or by disabling the feature for a
single translation unit.
Opting out for a heap allocation will be done using a special GFP flag.

Alexander Potapenko (1):
  initmem: introduce CONFIG_INIT_ALL_MEMORY and CONFIG_INIT_ALL_STACK

 Makefile                 |  3 ++-
 scripts/Makefile.initmem | 17 +++++++++++++++++
 scripts/Makefile.lib     |  6 ++++++
 security/Kconfig         |  1 +
 security/Kconfig.initmem | 22 ++++++++++++++++++++++
 5 files changed, 48 insertions(+), 1 deletion(-)
 create mode 100644 scripts/Makefile.initmem
 create mode 100644 security/Kconfig.initmem

-- 
2.21.0.352.gf09ad66450-goog
