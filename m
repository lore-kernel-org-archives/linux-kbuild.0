Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:39160 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933382AbeFVTcZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 22 Jun 2018 15:32:25 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [PATCH 0/3] Fixes concerning zconfdump()
Date: Fri, 22 Jun 2018 21:27:36 +0200
Message-Id: <20180622192739.5327-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Dirk Gouders <dirk@gouders.net>, Sam Ravnborg <sam@ravnborg.org>

Hi Masahiro,

this series contains two actual fixes, the third patch is rather aimed
to be an RFC.  I find it quite useful to have a target at hand to
easily generate debugging output from the parser when needed.  I could
imagine this target could also be used to add some parser tests to the
recently introduced automated tests, but perhap you already have other
plans or better suggestions.

Dirk

Dirk Gouders (3):
  kconfig: avoid assert()-triggered segfaults in xfwrite()
  kconfig: handle P_SYMBOL in print_symbol()
  kconfig: add debugconfig target for debugging purposes

 scripts/kconfig/Makefile | 10 ++++++++-
 scripts/kconfig/dconf.c  | 55 ++++++++++++++++++++++++++++++++++++++++++++++++
 scripts/kconfig/expr.c   |  5 ++++-
 scripts/kconfig/expr.h   |  3 +++
 scripts/kconfig/zconf.y  |  4 ++++
 5 files changed, 75 insertions(+), 2 deletions(-)
 create mode 100644 scripts/kconfig/dconf.c

-- 
2.13.6

