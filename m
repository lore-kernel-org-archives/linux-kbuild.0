Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from imap.cs.msu.ru ([188.44.42.39]:54687 "EHLO mail.cs.msu.ru"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727103AbfCDQ6C (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Mar 2019 11:58:02 -0500
From: Arseny Maslennikov <ar@cs.msu.ru>
Date: Mon,  4 Mar 2019 19:57:29 +0300
Message-Id: <20190304165732.24043-1-ar@cs.msu.ru>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: [PATCH 0/3] kbuild: More KCONFIG_CONFIG ignorance
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Jeff Dike <jdike@addtoit.com>, Richard Weinberger <richard@nod.at>, Anton Ivanov <anton.ivanov@cambridgegreys.com>
Cc: Arseny Maslennikov <ar@cs.msu.ru>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-um@lists.infradead.org

Following a recent bug with `make *config' not supporting a redefined
kernel config file, I ran a `git grep -w -nE [.]config **/Makefile'
and discovered these:

Arseny Maslennikov (3):
  kconfig/Makefile: localmodconfig: use KCONFIG_CONFIG
  Makefile: kselftest: use KCONFIG_CONFIG
  arch/um/kernel/Makefile: use KCONFIG_CONFIG

 Makefile                 |  4 ++--
 arch/um/kernel/Makefile  |  2 +-
 scripts/kconfig/Makefile | 12 ++++++------
 3 files changed, 9 insertions(+), 9 deletions(-)

-- 
2.20.1
