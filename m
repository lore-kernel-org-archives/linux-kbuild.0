Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:49549 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726387AbgCKGbQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Mar 2020 02:31:16 -0400
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH] net: drop_monitor: use IS_REACHABLE() to guard net_dm_hw_report()
Date: Wed, 11 Mar 2020 15:29:25 +0900
Message-Id: <20200311062925.5163-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Neil Horman <nhorman@tuxdriver.com>, netdev@vger.kernel.org, "David S . Miller" <davem@davemloft.net>
Cc: Ido Schimmel <idosch@mellanox.com>, Jiri Pirko <jiri@mellanox.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Nicolas Pitre <nico@fluxnic.net>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Jakub Kicinski <kuba@kernel.org>, linux-kernel@vger.kernel.org

In net/Kconfig, NET_DEVLINK implies NET_DROP_MONITOR.

The original behavior of the 'imply' keyword prevents NET_DROP_MONITOR
from being 'm' when NET_DEVLINK=y.

With the planned Kconfig change that relaxes the 'imply', the
combination of NET_DEVLINK=y and NET_DROP_MONITOR=m would be allowed.

Use IS_REACHABLE() to avoid the vmlinux link error for this case.

Reported-by: Stephen Rothwell <sfr@canb.auug.org.au>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
---

This build error was reported in linux-next.
https://lkml.org/lkml/2020/3/10/1936

If this patch is acceptable,
I'd like to get Ack from the maintainers,
and insert this patch before my Kconfig change.


 include/net/drop_monitor.h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/include/net/drop_monitor.h b/include/net/drop_monitor.h
index 2ab668461463..f68bc373544a 100644
--- a/include/net/drop_monitor.h
+++ b/include/net/drop_monitor.h
@@ -19,7 +19,7 @@ struct net_dm_hw_metadata {
 	struct net_device *input_dev;
 };
 
-#if IS_ENABLED(CONFIG_NET_DROP_MONITOR)
+#if IS_REACHABLE(CONFIG_NET_DROP_MONITOR)
 void net_dm_hw_report(struct sk_buff *skb,
 		      const struct net_dm_hw_metadata *hw_metadata);
 #else
-- 
2.17.1
