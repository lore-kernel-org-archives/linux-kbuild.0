Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f194.google.com ([209.85.160.194]:38408 "EHLO
        mail-qt1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726273AbeLQD4f (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Dec 2018 22:56:35 -0500
Received: by mail-qt1-f194.google.com with SMTP id p17so12667429qtl.5
        for <linux-kbuild@vger.kernel.org>; Sun, 16 Dec 2018 19:56:34 -0800 (PST)
From: Qian Cai <cai@lca.pw>
Subject: include/config/auto.conf not sync up with .config
Message-ID: <869bc700-1d6d-b950-76c7-5d0fc589152c@lca.pw>
Date: Sun, 16 Dec 2018 22:56:33 -0500
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com, michal.lkml@markovi.net
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

This bug can be reproduced this way on x86_64.

* make sure none of libelf-dev, libelf-devel or elfutils-libelf-devel installed.

# make distclean

* generate a default .config where CONFIG_UNWINDER_ORC is enabled by default.
# make menuconfig (exit -> save)

# grep CONFIG_UNWINDER_ORC .config
CONFIG_UNWINDER_ORC=y

# make menuconfig (unselect CONFIG_UNWINDER_ORC)

# grep CONFIG_UNWINDER_ORC .config
# CONFIG_UNWINDER_ORC is not set

# make
Cannot generate ORC metadata for CONFIG_UNWINDER_ORC=y, please install
libelf-dev, libelf-devel or elfutils-libelf-devel

# grep CONFIG_UNWINDER_ORC include/config/auto.conf
CONFIG_UNWINDER_ORC=y

This is due to this receipe in Makefile had never been executed even though
.config has is more recent than auto.conf.

# The actual configuration files used during the build are
# stored in include/generated/ and include/config/. Update
# them if .config is newer than include/config/auto.conf
#(which mirrors .config).
include/config/%.conf: $(KCONFIG_CONFIG) include/config/auto.conf.cmd
	$(Q)$(MAKE) -f $(srctree)/Makefile syncconfig

Actually, replaced that rule with any rule would never executed the recipe
there, For example,

/tmp/noexist:
	$(warning "never print anything")
