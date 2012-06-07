Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp05.smtpout.orange.fr ([80.12.242.127]:33727 "EHLO
	smtp.smtpout.orange.fr" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753774Ab2FGXtF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jun 2012 19:49:05 -0400
From: "Yann E. MORIN" <yann.morin.1998@free.fr>
Subject: [PATCH 3/3] scripts/config: add option to undef a symbol
Date: Fri,  8 Jun 2012 01:48:57 +0200
Message-Id: <1339112937-9055-4-git-send-email-yann.morin.1998@free.fr>
In-Reply-To: <1339112937-9055-1-git-send-email-yann.morin.1998@free.fr>
References: <1339112937-9055-1-git-send-email-yann.morin.1998@free.fr>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Andi Kleen <andi@firstfloor.org>, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>

It is currently possible to enable, disable or modularise
a symbol. Also, an undefined symbol is reported as such.

Add a new command to undefine a symbol, by removing the
corresponding line from the .config file.

Signed-off-by: "Yann E. MORIN" <yann.morin.1998@free.fr>
---
 scripts/config |   10 ++++++++++
 1 files changed, 10 insertions(+), 0 deletions(-)

diff --git a/scripts/config b/scripts/config
index 9723c7d..f65a44a 100755
--- a/scripts/config
+++ b/scripts/config
@@ -17,6 +17,7 @@ commands:
 	                     Set option to "string"
 	--set-val option value
 	                     Set option to value
+	--undefine|-u option Undefine option
 	--state|-s option    Print state of option (n,y,m,undef)
 
 	--enable-after|-E beforeopt option
@@ -73,6 +74,12 @@ set_var() {
 	fi
 }
 
+undef_var() {
+	local name=$1
+
+	sed -ri "/^($name=|# $name is not set)/d" "$FN"
+}
+
 if [ "$1" = "--file" ]; then
 	FN="$2"
 	if [ "$FN" = "" ] ; then
@@ -134,6 +141,9 @@ while [ "$1" != "" ] ; do
 		set_var "${CONFIG_}$ARG" "${CONFIG_}$ARG=$1"
 		shift
 		;;
+	--undefine|-u)
+		undef_var "${CONFIG_}$ARG"
+		;;
 
 	--state|-s)
 		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
-- 
1.7.2.5

