Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:37038 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752691AbeFHSxS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 8 Jun 2018 14:53:18 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC v4 0/1] i-search functionality for mconf
Date: Fri,  8 Jun 2018 20:46:05 +0200
Message-Id: <20180608184606.5029-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Segher Boessenkool <segher@kernel.crashing.org>, Sam Ravnborg <sam@ravnborg.org>
Cc: Dirk Gouders <dirk@gouders.net>

Hello,

this version is a prototype of the idea, Sam suggested -- I hope I
undestood it correctly.

This is a remarkable change to mconf in it's behavior; mainly it now
differentiates two focuses and operates differently, depending on the
focus.  When the focus is on the menu, mconf is in i-search mode, for
a detailed description see 1/1.

As stated earlier, this is just a prototype, documentation is missing
and the code is not ready for a real commit.

Dirk

Dirk Gouders (1):
  Isearch functionality for mconf

 scripts/kconfig/lxdialog/dialog.h  |   3 +
 scripts/kconfig/lxdialog/menubox.c | 207 +++++++++++++++++++++++++++++++++----
 2 files changed, 189 insertions(+), 21 deletions(-)

-- 
2.16.4

