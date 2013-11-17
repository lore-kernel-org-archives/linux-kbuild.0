Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-we0-f170.google.com ([74.125.82.170]:49195 "EHLO
	mail-we0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751393Ab3KQL4j (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Nov 2013 06:56:39 -0500
From: Clement Chauplannaz <chauplac@gmail.com>
Subject: [PATCH] scripts/config: allow setting a string which value contains a colon
Date: Sun, 17 Nov 2013 12:55:34 +0100
Message-Id: <1384689334-6979-1-git-send-email-chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, mmarek@suse.cz, sedat.dilek@gmail.com, linus.walleij@linaro.org, linux-kernel@vger.kernel.org

A bug in script `config' prevented from modifying an existing variable's
value to a string that contains a colon ':'.  The reason behind it is that
colons are used as a separator in `sed' commands that script `config'
relies on.

Escape colons in `sed' commands to allow values containing colons.

Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>
---
 scripts/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/config b/scripts/config
index 6804179..4b16260 100755
--- a/scripts/config
+++ b/scripts/config
@@ -78,7 +78,7 @@ txt_append() {
 
 txt_subst() {
 	local before="$1"
-	local after="$2"
+	local after="${2//:/\:}"
 	local infile="$3"
 	local tmpfile="$infile.swp"
 
-- 
1.8.3.2.dirty

