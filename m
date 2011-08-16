Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f174.google.com ([209.85.161.174]:43613 "EHLO
	mail-gx0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751840Ab1HPFYE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 16 Aug 2011 01:24:04 -0400
Received: by gxk21 with SMTP id 21so3604014gxk.19
        for <linux-kbuild@vger.kernel.org>; Mon, 15 Aug 2011 22:24:03 -0700 (PDT)
From: Arnaud Lacombe <lacombar@gmail.com>
Subject: [PATCH 3/3] kconfig/streamline_config.pl: merge local{mod,yes}config
Date: Tue, 16 Aug 2011 01:23:53 -0400
Message-Id: <1313472233-14094-3-git-send-email-lacombar@gmail.com>
In-Reply-To: <1313472233-14094-1-git-send-email-lacombar@gmail.com>
References: <1313472233-14094-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Arnaud Lacombe <lacombar@gmail.com>, Steven Rostedt <rostedt@goodmis.org>

The two targets `localmodconfig' and `localyesconfig' only differs from the
sed(1) ran on the result of `streamline_config.pl' to convert symbols set to
`modules' to `yes'. This conversion can be made directly from the perl script,
and thus avoid duplicating the command to generate the configuration.

Cc: Steven Rostedt <rostedt@goodmis.org>
Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
---
 scripts/kconfig/Makefile |   18 +-----------------
 1 files changed, 1 insertions(+), 17 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 4de8973..ba573fe 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -33,7 +33,7 @@ silentoldconfig: $(obj)/conf
 	$(Q)mkdir -p include/generated
 	$< --$@ $(Kconfig)
 
-localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
+localyesconfig localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 	$(Q)mkdir -p include/generated
 	$(Q)perl $< --$@ $(srctree) $(Kconfig) > .tmp.config
 	$(Q)if [ -f .config ]; then 					\
@@ -48,22 +48,6 @@ localmodconfig: $(obj)/streamline_config.pl $(obj)/conf
 	fi
 	$(Q)rm -f .tmp.config
 
-localyesconfig: $(obj)/streamline_config.pl $(obj)/conf
-	$(Q)mkdir -p include/generated
-	$(Q)perl $< --$@ $(srctree) $(Kconfig) > .tmp.config
-	$(Q)sed -i s/=m/=y/ .tmp.config
-	$(Q)if [ -f .config ]; then					\
-			cmp -s .tmp.config .config ||			\
-			(mv -f .config .config.old.1;			\
-			 mv -f .tmp.config .config;			\
-			 $(obj)/conf --silentoldconfig $(Kconfig);	\
-			 mv -f .config.old.1 .config.old)		\
-	else								\
-			mv -f .tmp.config .config;			\
-			$(obj)/conf --silentoldconfig $(Kconfig);	\
-	fi
-	$(Q)rm -f .tmp.config
-
 # Create new linux.pot file
 # Adjust charset to UTF-8 in .po file to accept UTF-8 in Kconfig files
 # The symlink is used to repair a deficiency in arch/um
-- 
1.7.6.153.g78432

