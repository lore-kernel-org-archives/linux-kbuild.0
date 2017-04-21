Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:37618 "EHLO
        mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1423722AbdDUVk7 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 17:40:59 -0400
Received: by mail-it0-f47.google.com with SMTP id a140so1325671ita.0
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 14:40:59 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 2/2] kbuild: clang: Disable the 'duplicate-decl-specifier' warning
Date: Fri, 21 Apr 2017 14:39:31 -0700
Message-Id: <20170421213931.155210-3-mka@chromium.org>
In-Reply-To: <20170421213931.155210-1-mka@chromium.org>
References: <20170421213931.155210-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Matthias Kaehlcke <mka@chromium.org>

clang generates plenty of these warnings in different parts of the code.
They are mostly caused by container_of() and other macros which declare
a "const <type> *" variable for their internal use which triggers a
"duplicate 'const' specifier" warning if the <type> is already const
qualified.

Wording-mostly-from: Michael Davidson <md@google.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index df5abf346354..6cd6d428db43 100644
--- a/Makefile
+++ b/Makefile
@@ -704,6 +704,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
 KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
+KBUILD_CFLAGS += $(call cc-disable-warning, duplicate-decl-specifier)
 # Quiet clang warning: comparison of unsigned expression < 0 is always false
 KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
-- 
2.12.2.816.g2cccc81164-goog

