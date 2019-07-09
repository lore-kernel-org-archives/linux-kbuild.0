Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from youngberry.canonical.com ([91.189.89.112]:56934 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726133AbfGIStY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 14:49:24 -0400
Received: from mail-io1-f69.google.com ([209.85.166.69])
        by youngberry.canonical.com with esmtps (TLS1.0:RSA_AES_128_CBC_SHA1:16)
        (Exim 4.76)
        (envelope-from <seth.forshee@canonical.com>)
        id 1hkvB4-0006CP-8Q
        for linux-kbuild@vger.kernel.org; Tue, 09 Jul 2019 18:49:22 +0000
Received: by mail-io1-f69.google.com with SMTP id f22so24034402ioj.9
        for <linux-kbuild@vger.kernel.org>; Tue, 09 Jul 2019 11:49:22 -0700 (PDT)
From: Seth Forshee <seth.forshee@canonical.com>
Subject: [PATCH] kbuild: add -fcf-protection=none to retpoline flags
Date: Tue,  9 Jul 2019 13:49:19 -0500
Message-Id: <20190709184919.20178-1-seth.forshee@canonical.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

-mindirect-branch and -fcf-protection are not compatible, and
so kernel builds fail with a gcc build where -fcf-protection is
enabled by default. Add -fcf-protection=none to the retpoline
flags to fix this.

Signed-off-by: Seth Forshee <seth.forshee@canonical.com>
---
 Makefile | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Makefile b/Makefile
index 3e4868a6498b..050f11d19777 100644
--- a/Makefile
+++ b/Makefile
@@ -636,6 +636,10 @@ RETPOLINE_CFLAGS_CLANG := -mretpoline-external-thunk
 RETPOLINE_VDSO_CFLAGS_CLANG := -mretpoline
 RETPOLINE_CFLAGS := $(call cc-option,$(RETPOLINE_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_CFLAGS_CLANG)))
 RETPOLINE_VDSO_CFLAGS := $(call cc-option,$(RETPOLINE_VDSO_CFLAGS_GCC),$(call cc-option,$(RETPOLINE_VDSO_CFLAGS_CLANG)))
+# -mindirect-branch is incompatible with -fcf-protection, so ensure the
+# latter is disabled
+RETPOLINE_CFLAGS += $(call cc-option,-fcf-protection=none,)
+RETPOLINE_VDSO_CFLAGS += $(call cc-option,-fcf-protection=none,)
 export RETPOLINE_CFLAGS
 export RETPOLINE_VDSO_CFLAGS
 
-- 
2.20.1
