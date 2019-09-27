Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:33063 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726365AbfI0JhC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Sep 2019 05:37:02 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/7] module: various bug-fixes and clean-ups for module namespace
Date: Fri, 27 Sep 2019 18:35:56 +0900
Message-Id: <20190927093603.9140-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Joel Fernandes <joel@joelfernandes.org>, Martijn Coenen <maco@android.com>, Will Deacon <will.deacon@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


I was hit by some problems caused by the module namespace feature
that was merged recently. At least, the breakage of
external module builds is a fatal one. I just took a look at the code
closer, and I noticed some more issues and improvements.

I hope these patches are mostly OK.
The 4th patch might have room for argument since it is a trade-off
of "cleaner implermentation" vs "code size".



Masahiro Yamada (7):
  modpost: fix broken sym->namespace for external module builds
  module: swap the order of symbol.namespace
  module: rename __kstrtab_ns_* to __kstrtabns_* to avoid symbol
    conflict
  module: avoid code duplication in include/linux/export.h
  kbuild: fix build error of 'make nsdeps' in clean tree
  nsdeps: fix hashbang of scripts/nsdeps
  nsdeps: make generated patches independent of locale

 Makefile               |   2 +-
 include/linux/export.h | 104 ++++++++++++++---------------------------
 kernel/module.c        |   2 +-
 scripts/mod/modpost.c  |  20 ++++----
 scripts/nsdeps         |   4 +-
 5 files changed, 47 insertions(+), 85 deletions(-)

-- 
2.17.1
