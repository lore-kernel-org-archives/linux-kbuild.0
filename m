Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from services.gouders.net ([141.101.32.176]:41111 "EHLO
        services.gouders.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752006AbeFFWKC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jun 2018 18:10:02 -0400
From: Dirk Gouders <dirk@gouders.net>
Subject: [RFC 0/1] mconf: Emacs-like isearch
Date: Wed,  6 Jun 2018 23:56:15 +0200
Message-Id: <20180606215616.12817-1-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Dirk Gouders <dirk@gouders.net>

Hello,

being an Emacs user, I frequently find myself pressing CTRL-s in mconf
to search for some menu entry, especially in large menus.

I decided to implement a basic isearch in mconf and would like to hear
if others find this functionality useful, as well.

The new functionality is started with pressing CTRL-s followed by
characters that form the search string.  To search for further
occurences of an entered string, press CTRL-s instead of further
characters.

For example: to navigate to the USB device drivers, press CTRL-s de ENTER ENTER usb ENTER ENTER

Pressing just CTRL-s subsequently results in line-by-line navigation
through the menu (search for empty strings).

The isearch is terminated by pressing either ESC ESC or ENTER.

Because I expect that errors are found in the code and changes are requested, I
completely left out the documentation part and will add it to V2
should anyone find this functionality useful.

Thanks,

Dirk

Dirk Gouders (1):
  Emacs-like isearch for mconf.

 scripts/kconfig/lxdialog/dialog.h  |   5 ++
 scripts/kconfig/lxdialog/menubox.c | 140 ++++++++++++++++++++++++++++++++++++-
 scripts/kconfig/lxdialog/util.c    |   1 +
 3 files changed, 145 insertions(+), 1 deletion(-)

-- 
2.16.4

