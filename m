Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:29887 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754827Ab2FGXtF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 19:49:05 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 1/3] scripts/config: add option to not upper-case symbols
Date: Fri,  8 Jun 2012 01:48:55 +0200
Message-Id: <1339112937-9055-2-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1339112937-9055-1-git-send-email-yann.morin.1998@free.fr>
References: <1339112937-9055-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

Currently, scripts/config mangles the config option symbols to always
be upper-case.

While the Linux kernel almost exclusively uses upper-case symbols, there
are still a few symbols with lower-case which this script can not handle:

  $ grep -r -E '^[[:space:]]*config[[:space:]]+[^[:space:]]*[[:lower:]][^[:space:]=.]*$' . |wc -l
  173
(that's roughly 1.3% of the symbols in 3.5-rc1)

Eg.:
  ./arch/arm/Kconfig:config VFPv3
  ./arch/powerpc/platforms/Kconfig.cputype:config 40x
  ./arch/x86/Kconfig:config SCx200HR_TIMER
  ./drivers/video/console/Kconfig:config FONT_8x8
  ./drivers/video/Kconfig:config NTSC_640x480

Also, other projects that use kconfig may allow for lower- or mixed-case
symbols, and may find easier to reuse this script than implement each
their own (potentially flawed) logic. For such a use-case, see:
    http://marc.info/?l=linux-kbuild&m=133409932115848&w=2

This patch adds a new option to keep the given case, and keep the current
default to upper-case the symbols.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/config |   18 +++++++++++++++---
 1 files changed, 15 insertions(+), 3 deletions(-)

diff --git a/scripts/config b/scripts/config
index ed6653e..c5639fe 100755
--- a/scripts/config
+++ b/scripts/config
@@ -26,10 +26,14 @@ commands:
 	commands can be repeated multiple times
 
 options:
-	--file .config file to change (default .config)
+	--file config-file   .config file to change (default .config)
+	--keep-case|-k       Keep next symbols' case (dont' upper-case it)
 
 config doesn't check the validity of the .config file. This is done at next
- make time.
+make time.
+
+By default, config will upper-case the given symbol. Use --keep-case to keep
+the case of all following symbols unchanged.
 EOL
 	exit 1
 }
@@ -44,7 +48,9 @@ checkarg() {
 		ARG="${ARG/CONFIG_/}"
 		;;
 	esac
-	ARG="`echo $ARG | tr a-z A-Z`"
+	if [ "$MUNGE_CASE" = "yes" ] ; then
+		ARG="`echo $ARG | tr a-z A-Z`"
+	fi
 }
 
 set_var() {
@@ -75,10 +81,16 @@ if [ "$1" = "" ] ; then
 	usage
 fi
 
+MUNGE_CASE=yes
 while [ "$1" != "" ] ; do
 	CMD="$1"
 	shift
 	case "$CMD" in
+	--keep-case|-k)
+		MUNGE_CASE=no
+		shift
+		continue
+		;;
 	--refresh)
 		;;
 	--*-after)
-- 
1.7.2.5

