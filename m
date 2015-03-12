Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f182.google.com ([209.85.192.182]:45053 "EHLO
	mail-pd0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753788AbbCLN75 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 12 Mar 2015 09:59:57 -0400
Date: Thu, 12 Mar 2015 21:59:33 +0800
From: Wang YanQing <udknight@gmail.com>
Subject: [PATCH] net:Kconfig: drop no sense dependence entry for BONDING
Message-ID: <20150312135933.GA3502@udknight>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: davem@davemloft.net
Cc: netdev@vger.kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, j.vosburgh@gmail.com, vfalico@gmail.com, gospo@cumulusnetworks.com

"IPV6 || IPV6=n" means no dependence!

Signed-off-by: Wang YanQing <udknight@gmail.com>
---
 drivers/net/Kconfig | 1 -
 1 file changed, 1 deletion(-)

diff --git a/drivers/net/Kconfig b/drivers/net/Kconfig
index df51d60..37b364f 100644
--- a/drivers/net/Kconfig
+++ b/drivers/net/Kconfig
@@ -40,7 +40,6 @@ if NET_CORE
 config BONDING
 	tristate "Bonding driver support"
 	depends on INET
-	depends on IPV6 || IPV6=n
 	---help---
 	  Say 'Y' or 'M' if you wish to be able to 'bond' multiple Ethernet
 	  Channels together. This is called 'Etherchannel' by Cisco,
-- 
2.2.2.dirty
