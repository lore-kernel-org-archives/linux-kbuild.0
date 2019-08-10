Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:35281 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726382AbfHJPzY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 10 Aug 2019 11:55:24 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 00/11] kbuild: clean-ups and improvement of single targets
Date: Sun, 11 Aug 2019 00:52:56 +0900
Message-Id: <20190810155307.29322-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Christoph Hellwig <hch@lst.de>, Sam Ravnborg <sam@ravnborg.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Alexei Starovoitov <ast@kernel.org>, Boris Pismenny <borisp@mellanox.com>, Daniel Borkmann <daniel@iogearbox.net>, "David S. Miller" <davem@davemloft.net>, Igor Russkikh <igor.russkikh@aquantia.com>, Jakub Kicinski <jakub.kicinski@netronome.com>, Leon Romanovsky <leon@kernel.org>, Martin KaFai Lau <kafai@fb.com>, Michal Marek <michal.lkml@markovi.net>, Saeed Mahameed <saeedm@mellanox.com>, Song Liu <songliubraving@fb.com>, Yonghong Song <yhs@fb.com>, bpf@vger.kernel.org, linux-kernel@vger.kernel.org, linux-rdma@vger.kernel.org, netdev@vger.kernel.org, oss-drivers@netronome.com


01/11-09/11 are trivial clean-ups.

10/11 makes the single targets work more correctly.

11/11 cleans up Makefiles that have been added
to work aroud the single target issues.



Masahiro Yamada (11):
  kbuild: move the Module.symvers check for external module build
  kbuild: refactor part-of-module more
  kbuild: fix modkern_aflags implementation
  kbuild: remove 'make /' support
  kbuild: remove meaningless 'targets' in ./Kbuild
  kbuild: do not descend to ./Kbuild when cleaning
  kbuild: unset variables in top Makefile instead of setting 0
  kbuild: unify vmlinux-dirs and module-dirs rules
  kbuild: unify clean-dirs rule for in-kernel and external module
  kbuild: make single targets work more correctly
  treewide: remove dummy Makefiles for single targets

 Kbuild                                        |   7 -
 Makefile                                      | 193 ++++++++++--------
 .../aquantia/atlantic/hw_atl/Makefile         |   2 -
 .../mellanox/mlx5/core/accel/Makefile         |   2 -
 .../ethernet/mellanox/mlx5/core/diag/Makefile |   2 -
 .../ethernet/mellanox/mlx5/core/en/Makefile   |   2 -
 .../mellanox/mlx5/core/en/xsk/Makefile        |   1 -
 .../mellanox/mlx5/core/en_accel/Makefile      |   2 -
 .../ethernet/mellanox/mlx5/core/fpga/Makefile |   2 -
 .../mellanox/mlx5/core/ipoib/Makefile         |   2 -
 .../ethernet/mellanox/mlx5/core/lib/Makefile  |   2 -
 .../net/ethernet/netronome/nfp/bpf/Makefile   |   2 -
 .../ethernet/netronome/nfp/flower/Makefile    |   2 -
 .../ethernet/netronome/nfp/nfpcore/Makefile   |   2 -
 .../netronome/nfp/nfpcore/nfp6000/Makefile    |   2 -
 .../net/ethernet/netronome/nfp/nic/Makefile   |   2 -
 scripts/Makefile.build                        |  55 +++--
 17 files changed, 149 insertions(+), 133 deletions(-)
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

-- 
2.17.1
