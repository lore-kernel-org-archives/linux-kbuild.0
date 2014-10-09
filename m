Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qa0-f50.google.com ([209.85.216.50]:48254 "EHLO
	mail-qa0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751006AbaJIR5a (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Oct 2014 13:57:30 -0400
Received: by mail-qa0-f50.google.com with SMTP id w8so536501qac.37
        for <linux-kbuild@vger.kernel.org>; Thu, 09 Oct 2014 10:57:29 -0700 (PDT)
From: Peter Foley <pefoley2@pefoley.com>
Subject: [PATCH] scripts: don't source auto.conf for LOCALVERSION
Date: Thu,  9 Oct 2014 13:57:03 -0400
Message-Id: <1412877423-19843-1-git-send-email-pefoley2@pefoley.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: foxwilson123@gmail.com, mmarek@suse.cz, fbuihuu@gmail.com, linux-kbuild@vger.kernel.org, Peter Foley <pefoley2@pefoley.com>

setlocalversion currently sources auto.conf to get a value for
CONFIG_LOCALVERSION. This interprets auto.conf as a bash script,
causing CONFIG_LOCALVERSION="`rm -rf --no-preserve-root /`" to
actually execute the command inside the backticks
when setlocalversion is called.
While the possibility of something like this happening is remote,
use sed to avoid potential harm from untrusted .config files.

Reported-by: Fox Wilson <foxwilson123@gmail.com>
Signed-off-by: Peter Foley <pefoley2@pefoley.com>
---
 scripts/setlocalversion | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 63d91e2..5b00123 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -141,7 +141,7 @@ if $scm_only; then
 fi
 
 if test -e include/config/auto.conf; then
-	. include/config/auto.conf
+	CONFIG_LOCALVERSION=$(sed -n 's/CONFIG_LOCALVERSION="\(.*\)"/\1/p' include/config/auto.conf)
 else
 	echo "Error: kernelrelease not valid - run 'make prepare' to update it"
 	exit 1
-- 
2.1.2

