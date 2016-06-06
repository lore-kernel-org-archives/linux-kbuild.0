Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from sauhun.de ([89.238.76.85]:49955 "EHLO pokefinder.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751043AbcFFTAr (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Jun 2016 15:00:47 -0400
From: Wolfram Sang <wsa@the-dreams.de>
Subject: [PATCH] kbuild: setlocalversion: print error to STDERR
Date: Mon,  6 Jun 2016 21:00:38 +0200
Message-Id: <1465239638-20314-1-git-send-email-wsa@the-dreams.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.com>, Wolfram Sang <wsa@the-dreams.de>

I tried to use 'make O=...' from an unclean source tree. This triggered
the error path of setlocalversion. But by printing to STDOUT, it created
a broken localversion which then caused another (unrelated) error:

"4.7.0-rc2Error: kernelrelease not valid - run make prepare to update it" exceeds 64 characters

After printing to STDERR, the true build error gets displayed later:

  /home/wsa/Kernel/linux is not clean, please run 'make mrproper'
  in the '/home/wsa/Kernel/linux' directory.

Signed-off-by: Wolfram Sang <wsa@the-dreams.de>
---
 scripts/setlocalversion | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/setlocalversion b/scripts/setlocalversion
index 63d91e22ed7ccd..966dd3924ea9cb 100755
--- a/scripts/setlocalversion
+++ b/scripts/setlocalversion
@@ -143,7 +143,7 @@ fi
 if test -e include/config/auto.conf; then
 	. include/config/auto.conf
 else
-	echo "Error: kernelrelease not valid - run 'make prepare' to update it"
+	echo "Error: kernelrelease not valid - run 'make prepare' to update it" >&2
 	exit 1
 fi
 
-- 
2.8.1

