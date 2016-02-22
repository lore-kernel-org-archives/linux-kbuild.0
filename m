Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg011.nifty.com ([202.248.44.37]:32571 "EHLO
	conuserg011-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1753474AbcBVHb7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 22 Feb 2016 02:31:59 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 4/6] ARM: decompressor: drop redundant FORCE in Makefile
Date: Mon, 22 Feb 2016 16:31:15 +0900
Message-Id: <1456126277-14633-5-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
References: <1456126277-14633-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-arm-kernel@lists.infradead.org
Cc: Russell King <rmk+kernel@arm.linux.org.uk>, Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Magnus Damm <damm+renesas@opensource.se>, Kees Cook <keescook@chromium.org>, linux-kernel@vger.kernel.org, Roy Franz <roy.franz@linaro.org>, Russell King <linux@arm.linux.org.uk>, Geert Uytterhoeven <geert+renesas@glider.be>, Simon Horman <horms+renesas@verge.net.au>

The object "piggy.$(suffix_y).o" is created from "piggy.$(suffix).S"
by the following pattern rule defined in scripts/Makefile.build:

  $(obj)/%.o: $(src)/%.S FORCE
          $(call if_changed_dep,as_o_S)

FORCE is already added to the prerequisite of the object there.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 arch/arm/boot/compressed/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/arch/arm/boot/compressed/Makefile b/arch/arm/boot/compressed/Makefile
index f9e8e68..903b953 100644
--- a/arch/arm/boot/compressed/Makefile
+++ b/arch/arm/boot/compressed/Makefile
@@ -187,7 +187,7 @@ $(obj)/vmlinux: $(obj)/vmlinux.lds $(obj)/$(HEAD) $(obj)/piggy.$(suffix_y).o \
 $(obj)/piggy.$(suffix_y): $(obj)/../Image FORCE
 	$(call if_changed,$(suffix_y))
 
-$(obj)/piggy.$(suffix_y).o:  $(obj)/piggy.$(suffix_y) FORCE
+$(obj)/piggy.$(suffix_y).o:  $(obj)/piggy.$(suffix_y)
 
 CFLAGS_font.o := -Dstatic=
 
-- 
1.9.1

