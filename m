Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:34638 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751222Ab3ELTJD (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 May 2013 15:09:03 -0400
Received: by mail-wi0-f181.google.com with SMTP id hi5so838158wib.2
        for <linux-kbuild@vger.kernel.org>; Sun, 12 May 2013 12:09:01 -0700 (PDT)
From: Clement Chauplannaz <chauplac@gmail.com>
Subject: [PATCH 2/2] scripts/config: fix assignment of parameters for short version of --*-after options
Date: Sun, 12 May 2013 21:08:52 +0200
Message-Id: <f0a94b2157c7bde8ec8a275d2f8f648f2e6b7c47.1368379475.git.chauplac@gmail.com>
In-Reply-To: <cover.1368379475.git.chauplac@gmail.com>
References: <cover.1368379475.git.chauplac@gmail.com>
In-Reply-To: <cover.1368379475.git.chauplac@gmail.com>
References: <cover.1368379475.git.chauplac@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: mmarek@suse.cz, andi@firstfloor.org, yann.morin.1998@free.fr

When --*-after options are used, two parameters are parsed from the
command-line before the adequate function is called:
  - the `before' option, after which the new option will be inserted,
  - the name of the option to enable/disable/modularise.

With the short version of --*-after options (namely -E, -D, -M), the
parsing step is not performed which leads to processing unset variables.

Add options -E, -D, -M to the test that triggers assignment of parameters
for --*-after options.

Signed-off-by: Clement Chauplannaz <chauplac@gmail.com>
---
 scripts/config | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/config b/scripts/config
index 6b3272e..567120a 100755
--- a/scripts/config
+++ b/scripts/config
@@ -107,7 +107,7 @@ while [ "$1" != "" ] ; do
 		;;
 	--refresh)
 		;;
-	--*-after)
+	--*-after|-E|-D|-M)
 		checkarg "$1"
 		A=$ARG
 		checkarg "$2"
-- 
1.8.3.rc1.44.gb387c77.dirty

