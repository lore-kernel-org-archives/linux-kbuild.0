Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:39862 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751900AbdJ3PfM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 30 Oct 2017 11:35:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 3/3] kbuild: clean up *.dtb and *.dtb.S patterns from top-level Makefile
Date: Tue, 31 Oct 2017 00:33:47 +0900
Message-Id: <1509377627-11362-4-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com>
References: <1509377627-11362-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Pantelis Antoniou <pantelis.antoniou@konsulko.com>, devicetree@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>

We need to add "clean-files" in Makfiles to clean up DT blobs, but we
often miss to do so.

Since there are no source files that end with .dtb or .dtb.S, so we
can clean-up those files from the top-level Makefile.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index 63a4c0e..c577c63 100644
--- a/Makefile
+++ b/Makefile
@@ -1544,7 +1544,7 @@ clean: $(clean-dirs)
 	$(call cmd,rmfiles)
 	@find $(if $(KBUILD_EXTMOD), $(KBUILD_EXTMOD), .) $(RCS_FIND_IGNORE) \
 		\( -name '*.[oas]' -o -name '*.ko' -o -name '.*.cmd' \
-		-o -name '*.ko.*' \
+		-o -name '*.ko.*' -o -name '*.dtb' -o -name '*.dtb.S' \
 		-o -name '*.dwo'  \
 		-o -name '*.su'  \
 		-o -name '.*.d' -o -name '.*.tmp' -o -name '*.mod.c' \
-- 
2.7.4

