Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp06.smtpout.orange.fr ([80.12.242.128]:44113 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1756841Ab2FFW3R (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jun 2012 18:29:17 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/3] scripts/config: be case-sensitive on config option symbols
Date: Thu,  7 Jun 2012 00:29:09 +0200
Message-Id: <1339021751-26474-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, scripts/config mangles the config option symbols to always
be upper-case.

While the Linux kernel almost exclusively uses upper-case symbols, there
are still a few symbols with lower-case which this script can not handle:

  $ grep -r -E '^[[:space:]]*config[[:space:]]+[^:space:]]*[[:lower:]]' .
  ./arch/powerpc/platforms/8xx/Kconfig:config 8xx_COPYBACK
  ./arch/powerpc/platforms/8xx/Kconfig:config 8xx_GPIO
  ./arch/powerpc/platforms/8xx/Kconfig:config 8xx_CPU6
  ./arch/powerpc/platforms/8xx/Kconfig:config 8xx_CPU15
  ./arch/powerpc/platforms/Kconfig.cputype:config 6xx
  ./arch/powerpc/platforms/Kconfig.cputype:config 8xx
  ./arch/powerpc/platforms/Kconfig.cputype:config 4xx
  ./arch/powerpc/Kconfig:config 4xx_SOC
  ./drivers/watchdog/Kconfig:config 8xxx_WDT

Also, other projects that use kconfig may allow for lower- or mixed-case
symbols, and may find easier to reuse this script than implement each
their own (potentially flawed) logic. For such a use-case, see:
    http://marc.info/?l=linux-kbuild&m=133409932115848&w=2

With this patch, if the KCONFIG_CASE environment variable is set to (with
no quotes):
  - 'upper': force symbols to upper-case
  - 'lower': force symbols to lower-case

The default if KCONFIG_CASE is not set, or is set and empty, or is set to
any other value, is to not change the symbol's case.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/config |   15 +++++++++++++--
 1 files changed, 13 insertions(+), 2 deletions(-)

diff --git a/scripts/config b/scripts/config
index ed6653e..5bae72d 100755
--- a/scripts/config
+++ b/scripts/config
@@ -29,7 +29,11 @@ options:
 	--file .config file to change (default .config)
 
 config doesn't check the validity of the .config file. This is done at next
- make time.
+make time.
+
+If the variable KCONFIG_CASE is set in the environment to either 'upper' or
+'lower', option symbols will be forced to the corresponding case. Any other
+value (or if it is not set) leaves the symbol's case unchanged.
 EOL
 	exit 1
 }
@@ -44,7 +48,14 @@ checkarg() {
 		ARG="${ARG/CONFIG_/}"
 		;;
 	esac
-	ARG="`echo $ARG | tr a-z A-Z`"
+	case "${KCONFIG_CASE}" in
+	upper)
+		ARG="`echo $ARG | tr a-z A-Z`"
+		;;
+	lower)
+		ARG="`echo $ARG | tr A-Z a-z`"
+		;;
+	esac
 }
 
 set_var() {
-- 
1.7.2.5

