Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:35086 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751070AbdL2Qrl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 29 Dec 2017 11:47:41 -0500
Date: Fri, 29 Dec 2017 10:47:39 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: [Regression 4.15] Can't kill CONFIG_UNWINDER_ORC with fire or
 plague.
Message-ID: <20171229164739.rgcqmam6wtno6hge@treble>
References: <20171226043003.GB10431@windriver.com>
 <d053e6df-ed00-2a02-eb27-4287b7549276@infradead.org>
 <20171229021323.GF10431@windriver.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20171229021323.GF10431@windriver.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Gortmaker <paul.gortmaker@windriver.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Ingo Molnar <mingo@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Dec 28, 2017 at 09:13:24PM -0500, Paul Gortmaker wrote:
> > > There is a regression new to 4.15 that happens in a rather common
> > > workflow which results in the frustrating situation where the user has
> > > clearly disabled UNWINDER_ORC in their ".config" file, and yet they
> > > still get the immediate false error saying they need libelf-dev since
> > > "CONFIG_UNWINDER_ORC=y" is still set, and hence they can not build.
> > > 
> > > The regression requires UNWINDER_ORC=y (now the default in commit
> > > fc72ae40e303) followed by the user subsequently disabling it, which is
> > > common if the user doesn't have libelf-dev and doesn't care about ORC.
> > > 
> > > This happens because the recently added test in the top level Makefile
> > > assumes that ,config data will be mapped into include/config/auto.conf
> > > either by the end user running "make oldconfig" or the Makefile itself
> > > detecting that "silentoldconfig" should be run.  As the simple
> > > reproducer below shows, this clearly does not happen as expected.

This seems to be related to a kconfig quirk where only silentoldconfig
updates the include/config/auto.conf file.  The other config targets
(oldconfig, defconfig, etc) don't touch it.  It seems intentional, but I
have no idea why.

That causes the Makefile to get stale data for 'CONFIG_*' variables when
it includes auto.conf.  So I don't think this is specific to the ORC
check.  It seems like it could also cause bugs elsewhere.

The below (ugly) patch fixes it, though I'm not sure this is the best
way to do it.  We probably need Masahiro or Michal to chime in here.

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 297c1bf35140..3a0d92040a9c 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -21,18 +21,23 @@ unexport CONFIG_
 
 xconfig: $(obj)/qconf
 	$< $(silent) $(Kconfig)
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 gconfig: $(obj)/gconf
 	$< $(silent) $(Kconfig)
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 menuconfig: $(obj)/mconf
 	$< $(silent) $(Kconfig)
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 config: $(obj)/conf
 	$< $(silent) --oldaskconfig $(Kconfig)
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 nconfig: $(obj)/nconf
 	$< $(silent) $(Kconfig)
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 silentoldconfig: $(obj)/conf
 	$(Q)mkdir -p include/config include/generated
@@ -85,6 +90,7 @@ PHONY += $(simple-targets)
 
 $(simple-targets): $(obj)/conf
 	$< $(silent) --$@ $(Kconfig)
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 PHONY += oldnoconfig savedefconfig defconfig
 
@@ -108,9 +114,11 @@ else
 	$(Q)$(MAKE) -f $(srctree)/Makefile $(KBUILD_DEFCONFIG)
 endif
 endif
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 %_defconfig: $(obj)/conf
 	$(Q)$< $(silent) --defconfig=arch/$(SRCARCH)/configs/$@ $(Kconfig)
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/configs/$@)
 
@@ -118,6 +126,7 @@ configfiles=$(wildcard $(srctree)/kernel/configs/$@ $(srctree)/arch/$(SRCARCH)/c
 	$(if $(call configfiles),, $(error No configuration exists for this target on this architecture))
 	$(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m .config $(configfiles)
 	+$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 PHONY += kvmconfig
 kvmconfig: kvm_guest.config
@@ -130,6 +139,7 @@ xenconfig: xen.config
 PHONY += tinyconfig
 tinyconfig:
 	$(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config
+	$(Q)$(MAKE) -f $(srctree)/Makefile silentoldconfig
 
 # Help text used by make help
 help:
