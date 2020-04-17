Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-db8eur05on2064.outbound.protection.outlook.com ([40.107.20.64]:22465
        "EHLO EUR05-DB8-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730573AbgDQUHb (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 17 Apr 2020 16:07:31 -0400
From: Saeed Mahameed <saeedm@mellanox.com>
Subject: [RFC PATCH v2 2/3] net/mlx5: Kconfig: Use "uses" instead of "imply"
Date: Fri, 17 Apr 2020 13:06:26 -0700
Message-Id: <20200417200627.129849-2-saeedm@mellanox.com>
In-Reply-To: <20200417200627.129849-1-saeedm@mellanox.com>
References: <20200417200627.129849-1-saeedm@mellanox.com>
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>, linux-kbuild@vger.kernel.org
Cc: Arnd Bergmann <arnd@arndb.de>, Jason Gunthorpe <jgg@ziepe.ca>, Nicolas Pitre <nico@fluxnic.net>, Jani Nikula <jani.nikula@linux.intel.com>, Saeed Mahameed <saeedm@mellanox.com>, narmstrong@baylibre.com, Laurent.pinchart@ideasonboard.com, leon@kernel.org, kieran.bingham+renesas@ideasonboard.com, jonas@kwiboo.se, airlied@linux.ie, jernej.skrabec@siol.net, linux-kernel@vger.kernel.org, netdev@vger.kernel.org, linux-rdma@vger.kernel.org

mlx5 uses the imply keyword to force weak dependencies on the implied
modules, to make sure they are always reachable by mlx5.

"imply" doesn't work this way any more, and it was wrong to use it in
first place.

The right solution is to use: "depends on symbol || !symbol", which is
exactly what the uses keyword is there for.

Use the new "uses" keyword to replace all mlx5 implied dependencies.

Signed-off-by: Saeed Mahameed <saeedm@mellanox.com>
Cc: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org
---
 drivers/net/ethernet/mellanox/mlx5/core/Kconfig | 8 ++++----
 1 file changed, 4 insertions(+), 4 deletions(-)

diff --git a/drivers/net/ethernet/mellanox/mlx5/core/Kconfig b/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
index 312e0a1ad43d..4e07179217e8 100644
--- a/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
+++ b/drivers/net/ethernet/mellanox/mlx5/core/Kconfig
@@ -7,10 +7,10 @@ config MLX5_CORE
 	tristate "Mellanox 5th generation network adapters (ConnectX series) core driver"
 	depends on PCI
 	select NET_DEVLINK
-	imply PTP_1588_CLOCK
-	imply VXLAN
-	imply MLXFW
-	imply PCI_HYPERV_INTERFACE
+	uses PTP_1588_CLOCK
+	uses VXLAN
+	uses MLXFW
+	uses PCI_HYPERV_INTERFACE
 	default n
 	---help---
 	  Core driver for low level functionality of the ConnectX-4 and
-- 
2.25.2
