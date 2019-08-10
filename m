Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:34081 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725862AbfHJPyV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:54:21 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 03/11] kbuild: fix modkern_aflags implementation
Date: Sun, 11 Aug 2019 00:52:59 +0900
Message-Id: <20190810155307.29322-4-yamada.masahiro@socionext.com>
In-Reply-To: <20190810155307.29322-1-yamada.masahiro@socionext.com>
References: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

For the single target building %.symtypes from %.S, $(a_flags) is
expanded into the _KERNEL flags even if the object is a part of a
module.

$(real-obj-m:.o=.symtypes): modkern_aflags := $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE)

... would fix the issue, but it is not nice to duplicate similar code
for every suffix.

Implement modkern_aflags in the same way as modkern_cflags.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Makefile.build | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 64e47a9a54c5..3633558f7861 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -309,10 +309,9 @@ $(obj)/%.h.s: $(src)/%.h FORCE
 # Compile assembler sources (.S)
 # ---------------------------------------------------------------------------
 
-modkern_aflags := $(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL)
-
-$(real-obj-m)      : modkern_aflags := $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE)
-$(real-obj-m:.o=.s): modkern_aflags := $(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE)
+modkern_aflags = $(if $(part-of-module),				\
+			$(KBUILD_AFLAGS_MODULE) $(AFLAGS_MODULE),	\
+			$(KBUILD_AFLAGS_KERNEL) $(AFLAGS_KERNEL))
 
 # .S file exports must have their C prototypes defined in asm/asm-prototypes.h
 # or a file that it includes, in order to get versioned symbols. We build a
-- 
2.17.1
