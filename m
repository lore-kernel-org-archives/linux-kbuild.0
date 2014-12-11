Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f179.google.com ([209.85.192.179]:50008 "EHLO
	mail-pd0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758931AbaLKUwt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Dec 2014 15:52:49 -0500
Received: by mail-pd0-f179.google.com with SMTP id fp1so5717254pdb.38
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Dec 2014 12:52:49 -0800 (PST)
From: Olof Johansson <olof@lixom.net>
Subject: [PATCH 1/2] merge_config.sh: Display usage if given too few arguments
Date: Thu, 11 Dec 2014 12:55:03 -0800
Message-Id: <1418331304-4821-1-git-send-email-olof@lixom.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yann.morin.1998@free.fr
Cc: linux-kbuild@vger.kernel.org, dvhart@linux.intel.com, linux-kernel@vger.kernel.org, Olof Johansson <olof@lixom.net>

Two or more arguments are always expected. Show usage and exit if
given less.

Signed-off-by: Olof Johansson <olof@lixom.net>
---
 scripts/kconfig/merge_config.sh |    5 +++++
 1 file changed, 5 insertions(+)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 81b0c61..2ab91b9 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -77,6 +77,11 @@ while true; do
 	esac
 done
 
+if [ "$#" -lt 2 ] ; then
+	usage
+	exit
+fi
+
 INITFILE=$1
 shift;
 
-- 
1.7.10.4

