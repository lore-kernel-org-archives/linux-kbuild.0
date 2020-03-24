Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:61250 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727164AbgCXQQN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Mar 2020 12:16:13 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 2/3] net: wan: wanxl: refactor the firmware rebuild rule
Date: Wed, 25 Mar 2020 01:15:38 +0900
Message-Id: <20200324161539.7538-2-masahiroy@kernel.org>
In-Reply-To: <20200324161539.7538-1-masahiroy@kernel.org>
References: <20200324161539.7538-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "David S . Miller" <davem@davemloft.net>, netdev@vger.kernel.org, linux-kernel@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>

Split the big recipe into 3 stages: compile, link, and hexdump.

After this commit, the build log with CONFIG_WANXL_BUILD_FIRMWARE
will look like this:

  AS68K   drivers/net/wan/wanxlfw.o
  LD68K   drivers/net/wan/wanxlfw.bin
  BLDFW   drivers/net/wan/wanxlfw.inc
  CC [M]  drivers/net/wan/wanxl.o

Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

 drivers/net/wan/Makefile | 29 +++++++++++++++++++----------
 1 file changed, 19 insertions(+), 10 deletions(-)

diff --git a/drivers/net/wan/Makefile b/drivers/net/wan/Makefile
index d21a99711070..b667eae65066 100644
--- a/drivers/net/wan/Makefile
+++ b/drivers/net/wan/Makefile
@@ -47,14 +47,23 @@ else
   LD68K = ld68k
 endif
 
-quiet_cmd_build_wanxlfw = BLD FW  $@
-      cmd_build_wanxlfw = \
-	$(CC68K) -D__ASSEMBLY__ -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $(obj)/wanxlfw.o $<; \
-	$(LD68K) --oformat binary -Ttext 0x1000 $(obj)/wanxlfw.o -o $(obj)/wanxlfw.bin; \
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
+quiet_cmd_m68kld_bin_o = LD68K   $@
+      cmd_m68kld_bin_o = $(LD68K) --oformat binary -Ttext 0x1000 $< -o $@
+
+$(obj)/wanxlfw.bin: $(obj)/wanxlfw.o FORCE
+	$(call if_changed,m68kld_bin_o)
+
+quiet_cmd_m68kas_o_S = AS68K   $@
+      cmd_m68kas_o_S = $(CC68K) -D__ASSEMBLY__ -Wp,-MD,$(depfile) -I$(srctree)/include/uapi -c -o $@ $<
+
+$(obj)/wanxlfw.o: $(src)/wanxlfw.S FORCE
+	$(call if_changed_dep,m68kas_o_S)
 endif
+targets += wanxlfw.inc wanxlfw.bin wanxlfw.o
-- 
2.17.1
