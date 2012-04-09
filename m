Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:42886 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754355Ab2DIMtP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 9 Apr 2012 08:49:15 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH] scripts/config: properly report and set string options
Date: Mon,  9 Apr 2012 14:49:10 +0200
Message-Id: <1333975750-12154-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, stable@vger.kernel.org, Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>

Currently, scripts/config removes the leading double-quote from
string options, but leaves the trailing double-quote.

Also, double-quotes in a string are escaped, but scripts/config
does not unescape those when printing

Finally, scripts/config does not escape double-quotes when setting
string options.

Eg. the current behavior:
    $ grep -E '^CONFIG_FOO=' .config
    CONFIG_FOO="Bar \"Buz\" Meh"
    $ ./scripts/config -s FOO
    Bar \"Buz\" Meh"
    $ ./scripts/config --set-str FOO 'Alpha "Bravo" Charlie'
    $ grep -E '^CONFIG_FOO=' .config
    CONFIG_FOO="Alpha "Bravo" Charlie"

Fix those three, giving this new behavior:
    $ grep -E '^CONFIG_FOO=' .config
    CONFIG_FOO="Bar \"Buz\" Meh"
    $ ./scripts/config -s FOO
    Bar "Buz" Meh
    $ ./scripts/config --set-str FOO 'Alpha "Bravo" Charlie'
    $ grep -E '^CONFIG_FOO=' .config
    CONFIG_FOO="Alpha \"Bravo\" Charlie"

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: stable@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>
Cc: Michal Marek <mmarek@suse.cz>
---
 scripts/config |   11 +++++++----
 1 files changed, 7 insertions(+), 4 deletions(-)

diff --git a/scripts/config b/scripts/config
index a7c7c4b..ed6653e 100755
--- a/scripts/config
+++ b/scripts/config
@@ -107,7 +107,8 @@ while [ "$1" != "" ] ; do
 		;;
 
 	--set-str)
-		set_var "CONFIG_$ARG" "CONFIG_$ARG=\"$1\""
+		# sed swallows one level of escaping, so we need double-escaping
+		set_var "CONFIG_$ARG" "CONFIG_$ARG=\"${1//\"/\\\\\"}\""
 		shift
 		;;
 
@@ -124,9 +125,11 @@ while [ "$1" != "" ] ; do
 			if [ $? != 0 ] ; then
 				echo undef
 			else
-				V="${V/CONFIG_$ARG=/}"
-				V="${V/\"/}"
-				echo "$V"
+				V="${V/#CONFIG_$ARG=/}"
+				V="${V/#\"/}"
+				V="${V/%\"/}"
+				V="${V/\\\"/\"}"
+				echo "${V}"
 			fi
 		fi
 		;;
-- 
1.7.2.5

