Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:60437 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755080AbbJ1NZ6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 28 Oct 2015 09:25:58 -0400
From: Michal Marek <mmarek@suse.cz>
Subject: [PATCH 2/3] kbuild: Allow to specify composite modules with modname-m
Date: Wed, 28 Oct 2015 14:25:41 +0100
Message-Id: <1446038742-13482-2-git-send-email-mmarek@suse.cz>
In-Reply-To: <1446038742-13482-1-git-send-email-mmarek@suse.cz>
References: <1446038742-13482-1-git-send-email-mmarek@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, daniel.vetter@ffwll.ch, Michal Marek <mmarek@suse.com>, Peter Chen <Peter.Chen@freescale.com>, linux-usb@vger.kernel.org, Joern Engel <joern@logfs.org>, Prasad Joshi <prasadjoshi.linux@gmail.com>, logfs@logfs.org

From: Michal Marek <mmarek@suse.com>

This allows to write

  drm-$(CONFIG_AGP) += drm_agpsupport.o

without having to handle CONFIG_AGP=y vs. CONFIG_AGP=m. Only support
this syntax for modules, since built-in code depending on something
modular cannot work and init/Makefile actually relies on the current
semantics. There are a few drivers which adapted to the current
semantics out of necessity; these are fixed to also work when the
respective subsystem is modular.

Cc: Peter Chen <Peter.Chen@freescale.com>
Cc: linux-usb@vger.kernel.org
Cc: Joern Engel <joern@logfs.org>
Cc: Prasad Joshi <prasadjoshi.linux@gmail.com>
Cc: logfs@logfs.org
Signed-off-by: Michal Marek <mmarek@suse.com>
---
 drivers/misc/ibmasm/ibmasm.h   | 2 +-
 drivers/usb/chipidea/otg_fsm.h | 2 +-
 fs/logfs/logfs.h               | 2 +-
 scripts/Makefile.build         | 8 ++++++--
 scripts/Makefile.lib           | 4 ++--
 5 files changed, 11 insertions(+), 7 deletions(-)

diff --git a/drivers/misc/ibmasm/ibmasm.h b/drivers/misc/ibmasm/ibmasm.h
index 9b08344..5bd1277 100644
--- a/drivers/misc/ibmasm/ibmasm.h
+++ b/drivers/misc/ibmasm/ibmasm.h
@@ -211,7 +211,7 @@ void ibmasmfs_unregister(void);
 void ibmasmfs_add_sp(struct service_processor *sp);
 
 /* uart */
-#ifdef CONFIG_SERIAL_8250
+#if IS_ENABLED(CONFIG_SERIAL_8250)
 void ibmasm_register_uart(struct service_processor *sp);
 void ibmasm_unregister_uart(struct service_processor *sp);
 #else
diff --git a/drivers/usb/chipidea/otg_fsm.h b/drivers/usb/chipidea/otg_fsm.h
index 2689375..262d6ef 100644
--- a/drivers/usb/chipidea/otg_fsm.h
+++ b/drivers/usb/chipidea/otg_fsm.h
@@ -62,7 +62,7 @@
 /* SSEND time before SRP */
 #define TB_SSEND_SRP         (1500)	/* minimum 1.5 sec, section:5.1.2 */
 
-#ifdef CONFIG_USB_OTG_FSM
+#if IS_ENABLED(CONFIG_USB_OTG_FSM)
 
 int ci_hdrc_otg_fsm_init(struct ci_hdrc *ci);
 int ci_otg_fsm_work(struct ci_hdrc *ci);
diff --git a/fs/logfs/logfs.h b/fs/logfs/logfs.h
index 5f09376..23f961a 100644
--- a/fs/logfs/logfs.h
+++ b/fs/logfs/logfs.h
@@ -485,7 +485,7 @@ static inline int logfs_get_sb_bdev(struct logfs_super *s,
 #endif
 
 /* dev_mtd.c */
-#ifdef CONFIG_MTD
+#if IS_ENABLED(CONFIG_MTD)
 int logfs_get_sb_mtd(struct logfs_super *s, int mtdnr);
 #else
 static inline int logfs_get_sb_mtd(struct logfs_super *s, int mtdnr)
diff --git a/scripts/Makefile.build b/scripts/Makefile.build
index 01df30a..2c47f9c 100644
--- a/scripts/Makefile.build
+++ b/scripts/Makefile.build
@@ -372,10 +372,14 @@ endif
 #    <composite-object>-objs := <list of .o files>
 #  or
 #    <composite-object>-y    := <list of .o files>
+#  or
+#    <composite-object>-m    := <list of .o files>
+#  The -m syntax only works if <composite object> is a module
 link_multi_deps =                     \
 $(filter $(addprefix $(obj)/,         \
 $($(subst $(obj)/,,$(@:.o=-objs)))    \
-$($(subst $(obj)/,,$(@:.o=-y)))), $^)
+$($(subst $(obj)/,,$(@:.o=-y)))       \
+$($(subst $(obj)/,,$(@:.o=-m)))), $^)
 
 quiet_cmd_link_multi-y = LD      $@
 cmd_link_multi-y = $(LD) $(ld_flags) -r -o $@ $(link_multi_deps) $(cmd_secanalysis)
@@ -390,7 +394,7 @@ $(call multi_depend, $(multi-used-y), .o, -objs -y)
 $(multi-used-m): FORCE
 	$(call if_changed,link_multi-m)
 	@{ echo $(@:.o=.ko); echo $(link_multi_deps); } > $(MODVERDIR)/$(@F:.o=.mod)
-$(call multi_depend, $(multi-used-m), .o, -objs -y)
+$(call multi_depend, $(multi-used-m), .o, -objs -y -m)
 
 targets += $(multi-used-y) $(multi-used-m)
 
diff --git a/scripts/Makefile.lib b/scripts/Makefile.lib
index 79e8661..e18957b 100644
--- a/scripts/Makefile.lib
+++ b/scripts/Makefile.lib
@@ -48,7 +48,7 @@ subdir-ym	:= $(sort $(subdir-y) $(subdir-m))
 
 # if $(foo-objs) exists, foo.o is a composite object
 multi-used-y := $(sort $(foreach m,$(obj-y), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
-multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))), $(m))))
+multi-used-m := $(sort $(foreach m,$(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))), $(m))))
 multi-used   := $(multi-used-y) $(multi-used-m)
 single-used-m := $(sort $(filter-out $(multi-used-m),$(obj-m)))
 
@@ -67,7 +67,7 @@ obj-dirs := $(dir $(multi-objs) $(obj-y))
 
 # Replace multi-part objects by their individual parts, look at local dir only
 real-objs-y := $(foreach m, $(filter-out $(subdir-obj-y), $(obj-y)), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m))) $(extra-y)
-real-objs-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y))),$($(m:.o=-objs)) $($(m:.o=-y)),$(m)))
+real-objs-m := $(foreach m, $(obj-m), $(if $(strip $($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m))),$($(m:.o=-objs)) $($(m:.o=-y)) $($(m:.o=-m)),$(m)))
 
 # Add subdir path
 
-- 
1.9.2

