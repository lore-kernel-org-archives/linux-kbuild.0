Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.cn.fujitsu.com ([183.91.158.132]:28609 "EHLO
        heian.cn.fujitsu.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S932237AbeBLEWt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Feb 2018 23:22:49 -0500
From: Cao jin <caoj.fnst@cn.fujitsu.com>
Subject: why scripts/link-vmlinux.sh has a final build of init/
Message-ID: <fb60e245-86f2-53c6-79d8-bd395ef011dd@cn.fujitsu.com>
Date: Mon, 12 Feb 2018 12:22:14 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi Masahiro-san,

  As I remember, init/ is already built during recursive make, and I did
a clean build(make mrproper, make localmodconfig) with all plugins
included on x86_64 with following patch, the kernel can boot without any
obvious problem. So, I don't figure out why we need this final build?


diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
index e6818b8e7141..086b2efd4d53 100755
--- a/scripts/link-vmlinux.sh
+++ b/scripts/link-vmlinux.sh
@@ -247,9 +247,6 @@ else
        expr 0$(cat .old_version) + 1 >.version;
 fi;

-# final build of init/
-${MAKE} -f "${srctree}/scripts/Makefile.build" obj=init
GCC_PLUGINS_CFLAGS="${GCC_PLUGINS_CFLAGS}"
-
 archive_builtin

 #link vmlinux.o

 --
Sincerely,
Cao jin


