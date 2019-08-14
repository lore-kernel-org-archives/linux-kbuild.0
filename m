Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:28766 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725955AbfHNPUk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 14 Aug 2019 11:20:40 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 2/2] treewide: remove dummy Makefiles for single targets
Date: Thu, 15 Aug 2019 00:19:19 +0900
Message-Id: <20190814151919.16300-2-yamada.masahiro@socionext.com>
In-Reply-To: <20190814151919.16300-1-yamada.masahiro@socionext.com>
References: <20190814151919.16300-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Alexei Starovoitov <ast@kernel.org>, Boris Pismenny <borisp@mellanox.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, Leon Romanovsky <leon@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Saeed Mahameed <saeedm@mellanox.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com

Now that the single target build descends into sub-directories in the
same way as the normal build, these dummy Makefiles are not needed
any more.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Changes in v2: None

 drivers/net/ethernet/aquantia/atlantic/hw_atl/Makefile      | 2 --
 drivers/net/ethernet/mellanox/mlx5/core/accel/Makefile      | 2 --
 drivers/net/ethernet/mellanox/mlx5/core/diag/Makefile       | 2 --
 drivers/net/ethernet/mellanox/mlx5/core/en/Makefile         | 2 --
 drivers/net/ethernet/mellanox/mlx5/core/en/xsk/Makefile     | 1 -
 drivers/net/ethernet/mellanox/mlx5/core/en_accel/Makefile   | 2 --
 drivers/net/ethernet/mellanox/mlx5/core/fpga/Makefile       | 2 --
 drivers/net/ethernet/mellanox/mlx5/core/ipoib/Makefile      | 2 --
 drivers/net/ethernet/mellanox/mlx5/core/lib/Makefile        | 2 --
 drivers/net/ethernet/netronome/nfp/bpf/Makefile             | 2 --
 drivers/net/ethernet/netronome/nfp/flower/Makefile          | 2 --
 drivers/net/ethernet/netronome/nfp/nfpcore/Makefile         | 2 --
 drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000/Makefile | 2 --
 drivers/net/ethernet/netronome/nfp/nic/Makefile             | 2 --
 14 files changed, 27 deletions(-)
 delete mode 100644 drivers/net/ethernet/aquantia/atlantic/hw_atl/Makefile
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/accel/Makefile
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/diag/Makefile
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/Makefile
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en/xsk/Makefile
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/en_accel/Makefile
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/fpga/Makefile
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/ipoib/Makefile
 delete mode 100644 drivers/net/ethernet/mellanox/mlx5/core/lib/Makefile
 delete mode 100644 drivers/net/ethernet/netronome/nfp/bpf/Makefile
 delete mode 100644 drivers/net/ethernet/netronome/nfp/flower/Makefile
 delete mode 100644 drivers/net/ethernet/netronome/nfp/nfpcore/Makefile
 delete mode 100644 drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000/Makefile
 delete mode 100644 drivers/net/ethernet/netronome/nfp/nic/Makefile

diff --git a/drivers/net/ethernet/aquantia/atlantic/hw_atl/Makefile b/drivers/net/ethernet/aquantia/atlantic/hw_atl/Makefile
deleted file mode 100644
index 805fa28f391a..000000000000
--- a/drivers/net/ethernet/aquantia/atlantic/hw_atl/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# kbuild requires Makefile in a directory to build individual objects
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/accel/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/accel/Makefile
deleted file mode 100644
index c78512eed8d7..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/accel/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-subdir-ccflags-y += -I$(src)/..
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/diag/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/diag/Makefile
deleted file mode 100644
index c78512eed8d7..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/diag/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-subdir-ccflags-y += -I$(src)/..
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/en/Makefile
deleted file mode 100644
index c78512eed8d7..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-subdir-ccflags-y += -I$(src)/..
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/Makefile
deleted file mode 100644
index 5ee42991900a..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/en/xsk/Makefile
+++ /dev/null
@@ -1 +0,0 @@
-subdir-ccflags-y += -I$(src)/../..
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/en_accel/Makefile
deleted file mode 100644
index c78512eed8d7..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/en_accel/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-subdir-ccflags-y += -I$(src)/..
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/fpga/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/fpga/Makefile
deleted file mode 100644
index c78512eed8d7..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/fpga/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-subdir-ccflags-y += -I$(src)/..
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/ipoib/Makefile
deleted file mode 100644
index c78512eed8d7..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/ipoib/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-subdir-ccflags-y += -I$(src)/..
diff --git a/drivers/net/ethernet/mellanox/mlx5/core/lib/Makefile b/drivers/net/ethernet/mellanox/mlx5/core/lib/Makefile
deleted file mode 100644
index c78512eed8d7..000000000000
--- a/drivers/net/ethernet/mellanox/mlx5/core/lib/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0-only
-subdir-ccflags-y += -I$(src)/..
diff --git a/drivers/net/ethernet/netronome/nfp/bpf/Makefile b/drivers/net/ethernet/netronome/nfp/bpf/Makefile
deleted file mode 100644
index 805fa28f391a..000000000000
--- a/drivers/net/ethernet/netronome/nfp/bpf/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# kbuild requires Makefile in a directory to build individual objects
diff --git a/drivers/net/ethernet/netronome/nfp/flower/Makefile b/drivers/net/ethernet/netronome/nfp/flower/Makefile
deleted file mode 100644
index 805fa28f391a..000000000000
--- a/drivers/net/ethernet/netronome/nfp/flower/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# kbuild requires Makefile in a directory to build individual objects
diff --git a/drivers/net/ethernet/netronome/nfp/nfpcore/Makefile b/drivers/net/ethernet/netronome/nfp/nfpcore/Makefile
deleted file mode 100644
index 805fa28f391a..000000000000
--- a/drivers/net/ethernet/netronome/nfp/nfpcore/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# kbuild requires Makefile in a directory to build individual objects
diff --git a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000/Makefile b/drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000/Makefile
deleted file mode 100644
index 805fa28f391a..000000000000
--- a/drivers/net/ethernet/netronome/nfp/nfpcore/nfp6000/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# kbuild requires Makefile in a directory to build individual objects
diff --git a/drivers/net/ethernet/netronome/nfp/nic/Makefile b/drivers/net/ethernet/netronome/nfp/nic/Makefile
deleted file mode 100644
index 805fa28f391a..000000000000
--- a/drivers/net/ethernet/netronome/nfp/nic/Makefile
+++ /dev/null
@@ -1,2 +0,0 @@
-# SPDX-License-Identifier: GPL-2.0
-# kbuild requires Makefile in a directory to build individual objects
-- 
2.17.1
