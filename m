Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f170.google.com ([209.85.212.170]:34662 "EHLO
	mail-wi0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751320AbbHTOGQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Aug 2015 10:06:16 -0400
From: Gabriel de Perthuis <g2p.code@gmail.com>
Subject: [PATCH] kconfig/merge_config.sh: Accept a single file
Date: Thu, 20 Aug 2015 16:06:10 +0200
Message-Id: <d0d3192eeda637ceed8cb82db0b092fa44afc603.1440079557.git.g2p.code@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E . MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Gabriel de Perthuis <g2p.code@gmail.com>

merge_config.sh can usefully be applied to a single file.
It does an implicit merge with the default configuration.

Signed-off-by: Gabriel de Perthuis <g2p.code@gmail.com>
---
 scripts/kconfig/merge_config.sh | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
index 7b53f02..e914c5a 100755
--- a/scripts/kconfig/merge_config.sh
+++ b/scripts/kconfig/merge_config.sh
@@ -75,11 +75,11 @@ while true; do
 		break
 		;;
 	esac
 done
 
-if [ "$#" -lt 2 ] ; then
+if [ "$#" -lt 1 ] ; then
 	usage
 	exit
 fi
 
 INITFILE=$1
-- 
2.5.0.347.g10df1da

