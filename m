Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu1sys200aog109.obsmtp.com ([207.126.144.127]:50150 "EHLO
	eu1sys200aog109.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754384Ab0LOIFj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 15 Dec 2010 03:05:39 -0500
From: Jonas Aaberg <jonas.aberg@stericsson.com>
Subject: [PATCH] kbuild: add numeric --set-val option to scripts/config
Date: Wed, 15 Dec 2010 08:37:00 +0100
Message-ID: <1292398620-13197-1-git-send-email-jonas.aberg@stericsson.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>
Cc: Jonas Aaberg <jonas.aberg@stericsson.com>

Add new option to scripts/config for changing .config numeric values

Acked-by: Linus Walleij <linus.walleij@stericsson.com>
Signed-off-by: Jonas Aaberg <jonas.aberg@stericsson.com>
---
 scripts/config |   11 +++++++++--
 1 files changed, 9 insertions(+), 2 deletions(-)

diff --git a/scripts/config b/scripts/config
index 608d7fd..5d8e57b 100755
--- a/scripts/config
+++ b/scripts/config
@@ -10,8 +10,10 @@ commands:
 	--enable|-e option   Enable option
 	--disable|-d option  Disable option
 	--module|-m option   Turn option into a module
-	--set-str option value
-	                     Set option to "value"
+	--set-str option string
+	                     Set option to "string"
+	--set-val option value
+	                     Set option to value
 	--state|-s option    Print state of option (n,y,m,undef)
 
 	--enable-after|-E beforeopt option
@@ -109,6 +111,11 @@ while [ "$1" != "" ] ; do
 		shift
 		;;
 
+	--set-val)
+		set_var "CONFIG_$ARG" "CONFIG_$ARG=$1"
+		shift
+		;;
+
 	--state|-s)
 		if grep -q "# CONFIG_$ARG is not set" $FN ; then
 			echo n
-- 
1.6.3.3

