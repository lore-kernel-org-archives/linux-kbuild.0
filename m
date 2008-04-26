Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.queued.net ([207.210.101.209]:4703 "EHLO mail.queued.net"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754824AbYDZCkJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Apr 2008 22:40:09 -0400
Date: Fri, 25 Apr 2008 22:35:27 -0400
From: Andres Salomon <dilinger@queued.net>
Subject: [PATCH 3/4] kconfig: conf -D just takes default config w/out
 assuming input_mode is set_default
Message-ID: <20080425223527.494da196@ephemeral>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: sam@ravnborg.org
Cc: Andrew Morton <akpm@linux-foundation.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org


Previously, both -d and -D specified that input_mode was set_default; the
only difference was that -D took an argument (setting defconfig_file).

With this change, -d specifies set_default, and -D merely sets defconfig_file.
This means that (for example) 'make i386_defconfig' becomes
'conf -d -D $def $(Kconfig)'.  The goal here is to enable future targets to
specify a default conf file without being forced to set input_mode to
set_default.

Signed-off-by: Andres Salomon <dilinger@debian.org>
---
 scripts/kconfig/Makefile |    4 ++--
 scripts/kconfig/conf.c   |    1 -
 2 files changed, 2 insertions(+), 3 deletions(-)

diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
index 7df7ea6..ce7d754 100644
--- a/scripts/kconfig/Makefile
+++ b/scripts/kconfig/Makefile
@@ -66,11 +66,11 @@ ifeq ($(KBUILD_DEFCONFIG),)
 	$< -d $(Kconfig)
 else
 	@echo "*** Default configuration is based on '$(KBUILD_DEFCONFIG)'"
-	$(Q)$< -D arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
+	$(Q)$< -d -D arch/$(SRCARCH)/configs/$(KBUILD_DEFCONFIG) $(Kconfig)
 endif
 
 %_defconfig: $(obj)/conf
-	$(Q)$< -D arch/$(SRCARCH)/configs/$@ $(Kconfig)
+	$(Q)$< -d -D arch/$(SRCARCH)/configs/$@ $(Kconfig)
 
 # Help text used by make help
 help:
diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
index e17767e..9a27638 100644
--- a/scripts/kconfig/conf.c
+++ b/scripts/kconfig/conf.c
@@ -515,7 +515,6 @@ int main(int ac, char **av)
 			input_mode = set_default;
 			break;
 		case 'D':
-			input_mode = set_default;
 			defconfig_file = optarg;
 			break;
 		case 'n':
-- 
1.5.5

