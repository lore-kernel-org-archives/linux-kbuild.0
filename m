Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:47150 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727283AbfHUENX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Aug 2019 00:13:23 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/4] video/logo: various fix and cleanups of drivers/video/logo/Makefile
Date: Wed, 21 Aug 2019 13:12:33 +0900
Message-Id: <20190821041237.23197-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, dri-devel@lists.freedesktop.org, linux-fbdev@vger.kernel.org
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Changes in v2:
  - Fix commit log

Masahiro Yamada (4):
  video/logo: remove unneeded *.o pattern from clean-files
  video/logo: do not generate unneeded logo C files
  video/logo: simplify cmd_logo
  video/logo: move pnmtologo tool to drivers/video/logo/ from scripts/

 drivers/video/logo/.gitignore               |  1 +
 drivers/video/logo/Makefile                 | 36 ++++-----------------
 {scripts => drivers/video/logo}/pnmtologo.c |  0
 scripts/.gitignore                          |  1 -
 scripts/Makefile                            |  2 --
 5 files changed, 8 insertions(+), 32 deletions(-)
 rename {scripts => drivers/video/logo}/pnmtologo.c (100%)

-- 
2.17.1
