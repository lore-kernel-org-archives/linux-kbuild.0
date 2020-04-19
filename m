Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:41070 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725905AbgDSOTP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Apr 2020 10:19:15 -0400
From: Leon Romanovsky <leon@kernel.org>
Subject: [PATCH net-next v2 4/4] kernel/module: Hide vermagic header file from general use
Date: Sun, 19 Apr 2020 17:18:50 +0300
Message-Id: <20200419141850.126507-5-leon@kernel.org>
In-Reply-To: <20200419141850.126507-1-leon@kernel.org>
References: <20200419141850.126507-1-leon@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "David S. Miller" <davem@davemloft.net>, Jakub Kicinski <kuba@kernel.org>
Cc: Leon Romanovsky <leonro@mellanox.com>, Borislav Petkov <bp@suse.de>, Jessica Yu <jeyu@kernel.org>, linux-kbuild@vger.kernel.org, Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>

From: Leon Romanovsky <leonro@mellanox.com>

VERMAGIC* definitions are not supposed to be used by the drivers,
see this [1] bug report, so introduce special define to guard inclusion
of this header file and define it in kernel/modules.h and in internal
script that generates *.mod.c files.

In-tree module build:
➜  kernel git:(vermagic) ✗ make clean
➜  kernel git:(vermagic) ✗ make M=drivers/infiniband/hw/mlx5
➜  kernel git:(vermagic) ✗ modinfo drivers/infiniband/hw/mlx5/mlx5_ib.ko
filename:	/images/leonro/src/kernel/drivers/infiniband/hw/mlx5/mlx5_ib.ko
<...>
vermagic:       5.6.0+ SMP mod_unload modversions

Out-of-tree module build:
➜  mlx5 make -C /images/leonro/src/kernel clean M=/tmp/mlx5
➜  mlx5 make -C /images/leonro/src/kernel M=/tmp/mlx5
➜  mlx5 modinfo /tmp/mlx5/mlx5_ib.ko
filename:       /tmp/mlx5/mlx5_ib.ko
<...>
vermagic:       5.6.0+ SMP mod_unload modversions

[1] https://lore.kernel.org/lkml/20200411155623.GA22175@zn.tnic
Reported-by: Borislav Petkov <bp@suse.de>
Acked-by: Borislav Petkov <bp@suse.de>
Acked-by: Jessica Yu <jeyu@kernel.org>
Co-developed-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
Signed-off-by: Leon Romanovsky <leonro@mellanox.com>
---
 include/linux/vermagic.h | 5 +++++
 kernel/module.c          | 3 +++
 scripts/mod/modpost.c    | 1 +
 3 files changed, 9 insertions(+)

diff --git a/include/linux/vermagic.h b/include/linux/vermagic.h
index 9aced11e9000..7768d20ada39 100644
--- a/include/linux/vermagic.h
+++ b/include/linux/vermagic.h
@@ -1,4 +1,9 @@
 /* SPDX-License-Identifier: GPL-2.0 */
+
+#ifndef INCLUDE_VERMAGIC
+#error "This header can be included from kernel/module.c or *.mod.c only"
+#endif
+
 #include <generated/utsrelease.h>

 /* Simply sanity version stamp for modules. */
diff --git a/kernel/module.c b/kernel/module.c
index 646f1e2330d2..8833e848b73c 100644
--- a/kernel/module.c
+++ b/kernel/module.c
@@ -4,6 +4,9 @@
    Copyright (C) 2001 Rusty Russell, 2002, 2010 Rusty Russell IBM.

 */
+
+#define INCLUDE_VERMAGIC
+
 #include <linux/export.h>
 #include <linux/extable.h>
 #include <linux/moduleloader.h>
diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
index 5c3c50c5ec52..7f7d4ee7b652 100644
--- a/scripts/mod/modpost.c
+++ b/scripts/mod/modpost.c
@@ -2251,6 +2251,7 @@ static void add_header(struct buffer *b, struct module *mod)
 	 * Include build-salt.h after module.h in order to
 	 * inherit the definitions.
 	 */
+	buf_printf(b, "#define INCLUDE_VERMAGIC\n");
 	buf_printf(b, "#include <linux/build-salt.h>\n");
 	buf_printf(b, "#include <linux/vermagic.h>\n");
 	buf_printf(b, "#include <linux/compiler.h>\n");
--
2.25.2
