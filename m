Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rcsinet14.oracle.com ([148.87.113.126]:48258 "EHLO
	rgminet14.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751749AbYKRCPF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Nov 2008 21:15:05 -0500
Received: from rgminet11.oracle.com (rcsinet11.oracle.com [148.87.113.123])
	by rgminet14.oracle.com (Switch-3.3.1/Switch-3.3.1) with ESMTP id mAI2FrE4010074
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2008 02:15:54 GMT
Received: from rgminet15.oracle.com (rcsinet15.oracle.com [148.87.113.117])
	by rgminet11.oracle.com (Switch-3.3.1/Switch-3.3.1) with ESMTP id mAI2E6kk023848
	(version=TLSv1/SSLv3 cipher=DHE-RSA-AES256-SHA bits=256 verify=OK)
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2008 02:14:07 GMT
Received: from acsmt704.oracle.com (acsmt704.oracle.com [141.146.40.82])
	by rgminet15.oracle.com (Switch-3.3.1/Switch-3.3.1) with ESMTP id mAI2DVC7009763
	for <linux-kbuild@vger.kernel.org>; Tue, 18 Nov 2008 02:13:33 GMT
Message-ID: <4922238C.40807@oracle.com>
Date: Tue, 18 Nov 2008 10:08:12 +0800
From: Wenji Huang <wenji.huang@oracle.com>
Reply-To: wenji.huang@oracle.com
MIME-Version: 1.0
Subject: [PATCH] Kbuild: generate debug info in building
Content-Type: text/plain; charset=windows-1251; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

This patch will generate kernel debuginfo in Kbuild when invoking "make
debug_info". The separate debug files are in .debug under building tree.
They can help the cases of requiring debug info for tracing/debug tools,
especially cross-compilation. Moreover, it can simplify or standardize
the packaging process for the distributions those will provide
kernel-debuginfo.

Signed-off-by: Wenji Huang <wenji.huang@oracle.com>
---
  Makefile                 |   14 ++++++++++++++
  scripts/Makefile.modpost |   14 ++++++++++++++
  2 files changed, 28 insertions(+), 0 deletions(-)

diff --git a/Makefile b/Makefile
index 7f9ff9b..eed7510 100644
--- a/Makefile
+++ b/Makefile
@@ -814,6 +814,20 @@ define rule_vmlinux-modpost
  	$(Q)echo 'cmd_$@ := $(cmd_vmlinux-modpost)' > $(dot-target).cmd
  endef

+ifdef CONFIG_DEBUG_INFO
+quiet_cmd_vmlinux_debug = GEN     $<.debug
+      cmd_vmlinux_debug = mkdir -p .debug;                          \
+                          $(OBJCOPY) --only-keep-debug              \
+                                     $< .debug/$<.debug
+targets += vmlinux.debug
+endif
+
+debug_info: vmlinux FORCE
+ifdef CONFIG_DEBUG_INFO
+	$(call if_changed,vmlinux_debug)
+	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost $@
+endif
+
  # vmlinux image - including updated kernel symbols
  vmlinux: $(vmlinux-lds) $(vmlinux-init) $(vmlinux-main) vmlinux.o
$(kallsyms.o) FORCE
  ifdef CONFIG_HEADERS_CHECK
diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
index f4053dc..0df73b2 100644
--- a/scripts/Makefile.modpost
+++ b/scripts/Makefile.modpost
@@ -137,6 +137,20 @@ $(modules): %.ko :%.o %.mod.o FORCE

  targets += $(modules)

+modules-debug := $(modules:.ko=.ko.debug)
+ifdef CONFIG_DEBUG_INFO
+quiet_cmd_debug_ko = GEN     $@
+      cmd_debug_ko = mkdir -p .debug/`dirname $@`;			\
+		     $(OBJCOPY) --only-keep-debug $< .debug/$@
+targets += $(modules-debug)
+endif
+
+debug_info: $(modules-debug) FORCE
+
+$(modules-debug): $(modules) FORCE
+ifdef CONFIG_DEBUG_INFO
+	$(call if_changed,debug_ko)
+endif

  # Add FORCE to the prequisites of a target to force it to be always
rebuilt.
  #
---------------------------------------------------------------------------
-- 
1.5.6

--
To unsubscribe from this list: send the line "unsubscribe linux-kernel" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
Please read the FAQ at  http://www.tux.org/lkml/

