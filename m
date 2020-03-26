Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:47754 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725854AbgCZF60 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 26 Mar 2020 01:58:26 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH v2 3/4] net: wan: wanxl: refactor the firmware rebuild rule
Date: Thu, 26 Mar 2020 14:57:17 +0900
Message-Id: <20200326055719.16755-3-masahiroy@kernel.org>
In-Reply-To: <20200326055719.16755-1-masahiroy@kernel.org>
References: <20200326055719.16755-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: clang-built-linux@googlegroups.com, Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <masahiroy@kernel.org>, "David S. Miller" <davem@davemloft.net>, linux-kernel@vger.kernel.org, netdev@vger.kernel.org

Split the big recipe into 3 stages, compile, link, and hexdump.

After this commit, the build log with CONFIG_WANXL_BUILD_FIRMWARE
will look like this:

  M68KAS  drivers/net/wan/wanxlfw.o
  M68KLD  drivers/net/wan/wanxlfw.bin
  BLDFW   drivers/net/wan/wanxlfw.inc
  CC [M]  drivers/net/wan/wanxl.o

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

Changes in v2: None

 drivers/net/wan/Makefile | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
index cf7a0a65aae8..380271a011e4 100644
--- a/drivers/net/wan/Makefile
+++ b/drivers/net/wan/Makefile
@@ -47,14 +47,23 @@ else
   M68KLD = $(CROSS_COMPILE_M68K)ld
 endif
 
-quiet_cmd_build_wanxlfw = BLD FW  $@
-      cmd_build_wanxlfw = \
-	$(M68KCC) -D__ASSEMBLY__ -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $(obj)/wanxlfw.o $<; \
-	$(M68KLD) --oformat binary -Ttext 0x1000 $(obj)/wanxlfw.o -o $(obj)/wanxlfw.bin; \
-	hexdump -ve '"\n" 16/1 "0x%02X,"' $(obj)/wanxlfw.bin | sed 's/0x  ,//g;1s/^/static const u8 firmware[]={/;$$s/,$$/\n};\n/' >$(obj)/wanxlfw.inc; \
-	rm -f $(obj)/wanxlfw.bin $(obj)/wanxlfw.o
-
-$(obj)/wanxlfw.inc:	$(src)/wanxlfw.S
-	$(call if_changed_dep,build_wanxlfw)
-targets += wanxlfw.inc
+quiet_cmd_build_wanxlfw = BLDFW   $@
+      cmd_build_wanxlfw = hexdump -ve '"\n" 16/1 "0x%02X,"' $< | \
+	sed 's/0x  ,//g;1s/^/static const u8 firmware[]={/;$$s/,$$/\n};\n/' > $@
+
+$(obj)/wanxlfw.inc: $(obj)/wanxlfw.bin FORCE
+	$(call if_changed,build_wanxlfw)
+
+quiet_cmd_m68kld_bin_o = M68KLD  $@
+      cmd_m68kld_bin_o = $(M68KLD) --oformat binary -Ttext 0x1000 $< -o $@
+
+$(obj)/wanxlfw.bin: $(obj)/wanxlfw.o FORCE
+	$(call if_changed,m68kld_bin_o)
+
+quiet_cmd_m68kas_o_S = M68KAS  $@
+      cmd_m68kas_o_S = $(M68KCC) -D__ASSEMBLY__ -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $@ $<
+
+$(obj)/wanxlfw.o: $(src)/wanxlfw.S FORCE
+	$(call if_changed_dep,m68kas_o_S)
 endif
+targets += wanxlfw.inc wanxlfw.bin wanxlfw.o
-- 
2.17.1
