Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f54.google.com ([74.125.83.54]:34109 "EHLO
        mail-pg0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755292AbdCUAOO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Mar 2017 20:14:14 -0400
Received: by mail-pg0-f54.google.com with SMTP id 21so51810857pgg.1
        for <linux-kbuild@vger.kernel.org>; Mon, 20 Mar 2017 17:14:13 -0700 (PDT)
Date: Mon, 20 Mar 2017 17:14:11 -0700
From: Kees Cook <keescook@chromium.org>
Subject: [PATCH v2] Kbuild: make designated_init attribute fatal
Message-ID: <20170321001411.GA142235@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org, Josh Triplett <josh@joshtriplett.org>, linux-kernel@vger.kernel.org

If a structure is marked with __attribute__((designated_init)) from
GCC or Sparse, it needs to have all static initializers using designated
initialization. Fail the build for any missing cases. This attribute will
be used by the randstruct plugin to make sure randomized structures are
being correctly initialized.

Signed-off-by: Kees Cook <keescook@chromium.org>
---
v2: update subject to more clearly describe change, Masahiro Yamada
---
 Makefile | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/Makefile b/Makefile
index b841fb36beb2..142ab7b96130 100644
--- a/Makefile
+++ b/Makefile
@@ -795,6 +795,9 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
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
