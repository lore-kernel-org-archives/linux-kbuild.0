Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:59233 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728180AbfJCH7R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 3 Oct 2019 03:59:17 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/6] module: various bug-fixes and clean-ups for module namespace
Date: Thu,  3 Oct 2019 16:58:20 +0900
Message-Id: <20191003075826.7478-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jessica Yu <jeyu@kernel.org>
Cc: Matthias Maennich <maennich@google.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Shaun Ruffell <sruffell@sruffell.net>, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Michal Marek <michal.lkml@markovi.net>, Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org


I was hit by some problems caused by the module namespace feature
that was merged recently. At least, the breakage of
external module builds is a fatal one. I just took a look at the code
closer, and I noticed some more issues (some are nit-picking).

V2:
 - I dropped "module: avoid code duplication in include/linux/export.h"
   because Matthias offered to refactor the code by himself.

 - V1 missed the problem when a symbol is preloaded before
  sym_add_exported() is called.  I fixed it too.



Masahiro Yamada (6):
  module: swap the order of symbol.namespace
  modpost: fix broken sym->namespace for external module builds
  module: rename __kstrtab_ns_* to __kstrtabns_* to avoid symbol
    conflict
  kbuild: fix build error of 'make nsdeps' in clean tree
  nsdeps: fix hashbang of scripts/nsdeps
  nsdeps: make generated patches independent of locale

 Makefile               |  2 +-
 include/linux/export.h | 10 +++++-----
 scripts/mod/modpost.c  | 29 +++++++++++++++--------------
 scripts/nsdeps         |  4 ++--
 4 files changed, 23 insertions(+), 22 deletions(-)

-- 
2.17.1
