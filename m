Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-09.nifty.com ([210.131.2.76]:29498 "EHLO
        conuserg-09.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965321AbeFNOkh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 14 Jun 2018 10:40:37 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/3] net: bpfilter: clean-up build rules
Date: Thu, 14 Jun 2018 23:39:29 +0900
Message-Id: <1528987172-19810-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: netdev@vger.kernel.org, Alexei Starovoitov <ast@kernel.org>, "David S . Miller" <davem@davemloft.net>
Cc: Arnd Bergmann <arnd@arndb.de>, Geert Uytterhoeven <geert@linux-m68k.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Alexei Starovoitov <ast@fb.com>, Daniel Borkmann <daniel@iogearbox.net>, YueHaibing <yuehaibing@huawei.com>


Clean-up from Kbuild/Kconfig point of view.

I confirmed this series can apply and compile
based on today's Linus tree.
(commit 2837461dbe6f)



Masahiro Yamada (3):
  bpfilter: add bpfilter_umh to .gitignore
  bpfilter: include bpfilter_umh in assembly instead of using objcopy
  bpfilter: check compiler capability in Kconfig

 Makefile                         |  5 -----
 net/Makefile                     |  4 ----
 net/bpfilter/.gitignore          |  1 +
 net/bpfilter/Kconfig             |  2 +-
 net/bpfilter/Makefile            | 15 ++-------------
 net/bpfilter/bpfilter_kern.c     | 11 +++++------
 net/bpfilter/bpfilter_umh_blob.S |  7 +++++++
 scripts/cc-can-link.sh           |  2 +-
 8 files changed, 17 insertions(+), 30 deletions(-)
 create mode 100644 net/bpfilter/.gitignore
 create mode 100644 net/bpfilter/bpfilter_umh_blob.S

-- 
2.7.4

