Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f51.google.com ([209.85.214.51]:37347 "EHLO
        mail-it0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1033205AbdDYWse (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 25 Apr 2017 18:48:34 -0400
Received: by mail-it0-f51.google.com with SMTP id x188so85691939itb.0
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Apr 2017 15:48:34 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2] kbuild: clang: add -no-integrated-as to KBUILD_[AC]FLAGS
Date: Tue, 25 Apr 2017 15:47:35 -0700
Message-Id: <20170425224735.131835-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Michael Davidson <md@google.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Saleem Abdulrasool <compnerd@compnerd.org>, Matthias Kaehlcke <mka@chromium.org>

From: Michael Davidson <md@google.com>

The Linux Kernel relies on GCC's acceptance of inline assembly as an
opaque object which will not have any validation performed on the content.
The current behaviour in LLVM is to perform validation of the contents by
means of parsing the input if the MC layer can handle it.

Disable clangs integrated assembler and use the GNU assembler instead.

Wording-mostly-from: Saleem Abdulrasool <compnerd@compnerd.org>
Signed-off-by: Michael Davidson <md@google.com>
Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
---
Changes in v2:
- Added paragraph explaining why this change is needed
- Updated subject (was: Makefile, LLVM: add -no-integrated-as to KBUILD_[AC]FLAGS)

(agreed with Michael to update the patch)

 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 5039b9148d15..3832c8243334 100644
--- a/Makefile
+++ b/Makefile
@@ -710,6 +710,8 @@ KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
 # See modpost pattern 2
 KBUILD_CFLAGS += $(call cc-option, -mno-global-merge,)
 KBUILD_CFLAGS += $(call cc-option, -fcatch-undefined-behavior)
+KBUILD_CFLAGS += $(call cc-option, -no-integrated-as)
+KBUILD_AFLAGS += $(call cc-option, -no-integrated-as)
 else
 
 # These warnings generated too much noise in a regular build.
-- 
2.13.0.rc0.306.g87b477812d-goog

