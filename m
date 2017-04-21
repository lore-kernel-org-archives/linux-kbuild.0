Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:34301 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1423465AbdDUVky (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 17:40:54 -0400
Received: by mail-it0-f51.google.com with SMTP id 193so337008itm.1
        for <linux-kbuild@vger.kernel.org>; Fri, 21 Apr 2017 14:40:54 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 1/2] kbuild: clang: Disable 'address-of-packed-member' warning
Date: Fri, 21 Apr 2017 14:39:30 -0700
Message-Id: <20170421213931.155210-2-mka@chromium.org>
In-Reply-To: <20170421213931.155210-1-mka@chromium.org>
References: <20170421213931.155210-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>, Matthias Kaehlcke <mka@chromium.org>

clang generates plenty of these warnings in different parts of the code,
to an extent that the warnings are little more than noise. Disable the
'address-of-packed-member' warning.

Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
 Makefile | 1 +
 1 file changed, 1 insertion(+)

diff --git a/Makefile b/Makefile
index 5039b9148d15..df5abf346354 100644
--- a/Makefile
+++ b/Makefile
@@ -703,6 +703,7 @@ KBUILD_CPPFLAGS += $(call cc-option,-Wno-unknown-warning-option,)
 KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
 KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
 KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
+KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
 # Quiet clang warning: comparison of unsigned expression < 0 is always false
 KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
-- 
2.12.2.816.g2cccc81164-goog

