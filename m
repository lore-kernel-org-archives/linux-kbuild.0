Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg009.nifty.com ([202.248.44.35]:57759 "EHLO
	conuserg009-v.nifty.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1751933AbbCMGW1 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 Mar 2015 02:22:27 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 2/6] kbuild: mergeconfig: move an error check to merge_config.sh
Date: Fri, 13 Mar 2015 15:21:39 +0900
Message-Id: <1426227703-31815-3-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
References: <1426227703-31815-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Josh Boyer <jwboyer@redhat.com>, Darren Hart <dvhart@linux.intel.com>, john stultz <johnstul@us.ibm.com>, Michal Marek <mmarek@suse.cz>, Josh Triplett <josh@joshtriplett.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org, "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, "make tinyconfig" does not work with "-j" option.

  $ make mrproper
  $ make -j8 tinyconfig
    HOSTCC  scripts/basic/fixdep
    HOSTCC  scripts/kconfig/conf.o
    SHIPPED scripts/kconfig/zconf.tab.c
    SHIPPED scripts/kconfig/zconf.lex.c
    SHIPPED scripts/kconfig/zconf.hash.c
    HOSTCC  scripts/kconfig/zconf.tab.o
    HOSTLD  scripts/kconfig/conf
  scripts/kconfig/conf --allnoconfig Kconfig
  #
  # configuration written to .config
  #
  scripts/kconfig/Makefile:122: *** You need an existing .config
  for this target.  Stop.
  make: *** [tinyconfig] Error 2

As shown above, "allnoconfig" has created the .config file before
mergeconfig is called, but Make still raises a false alarm because
of some sort of race condition.

We can fix this issue by moving the error check to the shell script.

Anyway, scripts/kconfig/merge_config.sh always requires an existing
.config as a base file.  It is reasonable to check its existence in
the shell script.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/Makefile        | 1 -
 scripts/kconfig/merge_config.sh | 5 +++++
 2 files changed, 5 insertions(+), 1 deletion(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index fc34f46..be0fad4 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -107,7 +107,6 @@ endif
 configfiles=$(wildcard $(srctree)/kernel/configs/$(1).config $(srctree)/arch/$(SRCARCH)/configs/$(1).config)
 
 define mergeconfig
-$(if $(wildcard $(objtree)/.config),, $(error You need an existing .config for this target))
 $(if $(call configfiles,$(1)),, $(error No configuration exists for this target on this architecture))
 $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh -m -O $(objtree) $(objtree)/.config $(call configfiles,$(1))
 +$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig
diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 2118af8..88d89b2 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -85,6 +85,11 @@ fi
 INITFILE=$1
 shift;
 
+if [ ! -r "$INITFILE" ]; then
+	echo "The base file '$INITFILE' does not exist.  Exit." >&2
+	exit 1
+fi
+
 MERGE_LIST=$*
 SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(CONFIG_[a-zA-Z0-9_]*\)[= ].*/\2/p"
 TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
-- 
1.9.1

