Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f181.google.com ([209.85.192.181]:36847 "EHLO
        mail-pf0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751861AbdBAXE1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Feb 2017 18:04:27 -0500
Received: by mail-pf0-f181.google.com with SMTP id 189so121937749pfu.3
        for <linux-kbuild@vger.kernel.org>; Wed, 01 Feb 2017 15:04:27 -0800 (PST)
Date: Wed, 1 Feb 2017 15:04:25 -0800
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH] Kbuild: support designated_init attribute
Message-ID: <20170201230425.GA75891@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

If a structure is marked with __attribute__((designated_init)) from
GCC or Sparse, it needs to have all static initializers using designated
initialization. Fail the build for any missing cases. This attribute will
be used by the randstruct plugin to make sure randomized structures are
being correctly initialized.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index 96b27a888285..d4e0550e7abd 100644
--- a/Makefile
+++ b/Makefile
@@ -793,6 +793,9 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
 # enforce correct pointer usage
 KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
 
+# Require designated initializers for all marked structures
+KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
+
 # use the deterministic mode of AR if available
 KBUILD_ARFLAGS := $(call ar-option,D)
 
-- 
2.7.4


-- 
Kees Cook
Pixel Security
