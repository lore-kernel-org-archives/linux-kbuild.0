Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-12.nifty.com ([210.131.2.79]:49222 "EHLO
        conuserg-12.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727472AbfLQEOo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Dec 2019 23:14:44 -0500
From: Masahiro Yamada <masahiroy@kernel.org>
Subject: [PATCH 0/8] kconfig: misc cleanups
Date: Tue, 17 Dec 2019 13:14:15 +0900
Message-Id: <20191217041424.29285-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Ulf Magnusson <ulfalizer@gmail.com>, Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org


Masahiro Yamada (8):
  kconfig: remove the rootmenu check in menu_add_prop()
  kconfig: use parent->dep as the parentdep of 'menu'
  kconfig: drop T_WORD from the RHS of 'prompt' symbol
  kconfig: remove 'prompt' symbol
  kconfig: move prompt handling to menu_add_prompt() from
    menu_add_prop()
  kconfig: remove 'prompt' argument from menu_add_prop()
  kconfig: remove sym from struct property
  kconfig: squash prop_alloc() into menu_add_prop()

 scripts/kconfig/expr.h   |   1 -
 scripts/kconfig/lkc.h    |   1 -
 scripts/kconfig/menu.c   | 103 ++++++++++++++++++++++-----------------
 scripts/kconfig/parser.y |  21 +++-----
 scripts/kconfig/symbol.c |  22 ---------
 5 files changed, 66 insertions(+), 82 deletions(-)

-- 
2.17.1
