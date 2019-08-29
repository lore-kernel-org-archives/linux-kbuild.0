Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:50698 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1725782AbfH2MCW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 29 Aug 2019 08:02:22 -0400
From: Michal Suchanek <msuchanek@suse.de>
Subject: [PATCH] Makefile: Convert -Wimplicit-fallthrough to -Wimplicit-fallthrough=2
Date: Thu, 29 Aug 2019 14:02:15 +0200
Message-Id: <20190829120215.1977-1-msuchanek@suse.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Suchanek <msuchanek@suse.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

From gcc documentation:

-Wimplicit-fallthrough=0
  disables the warning altogether.
-Wimplicit-fallthrough=1
  matches .* regular expression, any comment is used as fallthrough comment.
-Wimplicit-fallthrough=2
  case insensitively matches .*falls?[ \t-]*thr(ough|u).* regular expression.
-Wimplicit-fallthrough=3
  case sensitively matches one of the following regular expressions:
   -fallthrough
   @fallthrough@
   lint -fallthrough[ \t]*
   [ \t.!]*(ELSE,? |INTENTIONAL(LY)? )?
   FALL(S | |-)?THR(OUGH|U)[ \t.!]*(-[^\n\r]*)?
   [ \t.!]*(Else,? |Intentional(ly)? )?
   Fall((s | |-)[Tt]|t)hr(ough|u)[ \t.!]*(-[^\n\r]*)?
   [ \t.!]*([Ee]lse,? |[Ii]ntentional(ly)? )?
   fall(s | |-)?thr(ough|u)[ \t.!]*(-[^\n\r]*)?
-Wimplicit-fallthrough=4
  case sensitively matches one of the following regular expressions:
   -fallthrough
   @fallthrough@
   lint -fallthrough[ \t]*
   [ \t]*FALLTHR(OUGH|U)[ \t]*
-Wimplicit-fallthrough=5
  doesn’t recognize any comments as fallthrough comments, only attributes disable the warning.

In particular the default value of 3 does not match the comments like
/* falls through to do foobar */
generating suprious warnings on properly annotated code.

Signed-off-by: Michal Suchanek <msuchanek@suse.de>
---
 Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Makefile b/Makefile
index f125625efd60..641ec413c2a6 100644
--- a/Makefile
+++ b/Makefile
@@ -846,7 +846,7 @@ NOSTDINC_FLAGS += -nostdinc -isystem $(shell $(CC) -print-file-name=include)
 KBUILD_CFLAGS += -Wdeclaration-after-statement
 
 # Warn about unmarked fall-throughs in switch statement.
-KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough,)
+KBUILD_CFLAGS += $(call cc-option,-Wimplicit-fallthrough=2,)
 
 # Variable Length Arrays (VLAs) should not be used anywhere in the kernel
 KBUILD_CFLAGS += -Wvla
-- 
2.22.0
