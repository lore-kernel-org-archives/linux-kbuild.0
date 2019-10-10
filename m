Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f73.google.com ([209.85.221.73]:50413 "EHLO
        mail-wr1-f73.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726083AbfJJPQE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 10 Oct 2019 11:16:04 -0400
Received: by mail-wr1-f73.google.com with SMTP id m14so2889081wru.17
        for <linux-kbuild@vger.kernel.org>; Thu, 10 Oct 2019 08:16:01 -0700 (PDT)
Date: Thu, 10 Oct 2019 16:14:39 +0100
Message-Id: <20191010151443.7399-1-maennich@google.com>
Mime-Version: 1.0
Subject: [PATCH 0/4] export/modpost: avoid renaming __ksymtab entries for
 symbol namespaces
From: Matthias Maennich <maennich@google.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: kernel-team@android.com, maennich@google.com, Jessica Yu <jeyu@kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Martijn Coenen <maco@android.com>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Shaun Ruffell <sruffell@sruffell.net>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Will Deacon <will@kernel.org>, linux-kbuild@vger.kernel.org, linux-modules@vger.kernel.org

The introduction of the symbol namespace patches changed the way symbols are
named in the ksymtab entries. That caused userland tools to fail (such as
kmod's depmod). As depmod is used as part of the kernel build it was worth
having another look whether this name change can be avoided.

The main purpose of this series is to restore the original ksymtab entry names.
For that to happen and to remove some rough edges around that, the relevant
parts in modpost got a small refactoring as to when and how namespaces are
evaluated and set in the symbol struct.

Eventually, the namespace values can be read from __kstrtabns_ entries and
their corresponding __ksymtab_strings values. That removes the need to carry
the namespace names within the (anyway unique) symbol name entries.

The last patch of this series is adopted from Masahiro [1]. By allowing 'no
namespace' to be represented as empty string, large chunks of
include/linux/export.h could be consolidated. Technically, this last patch is
not absolutely necessary to fix functionality. It addresses concerns about
maintainability and readability. While I strongly suggest sending all of the
patches for 5.4, the last one could possible deferred to the next merge window.

This patch applies to the modules-linus [2] branch.

[1] https://lore.kernel.org/lkml/20190927093603.9140-5-yamada.masahiro@socionext.com/
[2] https://git.kernel.org/pub/scm/linux/kernel/git/jeyu/linux.git/log/?h=modules-linus

Cc: Jessica Yu <jeyu@kernel.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Martijn Coenen <maco@android.com>
Cc: Lucas De Marchi <lucas.de.marchi@gmail.com>
Cc: Shaun Ruffell <sruffell@sruffell.net>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: Will Deacon <will@kernel.org>
Cc: linux-kbuild@vger.kernel.org
Cc: linux-modules@vger.kernel.org


Matthias Maennich (4):
  modpost: delegate updating namespaces to separate function
  modpost: make updating the symbol namespace explict
  symbol namespaces: revert to previous __ksymtab name scheme
  export: avoid code duplication in include/linux/export.h

 include/linux/export.h | 97 +++++++++++++-----------------------------
 kernel/module.c        |  2 +-
 scripts/mod/modpost.c  | 58 ++++++++++++++++---------
 scripts/mod/modpost.h  |  1 +
 4 files changed, 69 insertions(+), 89 deletions(-)

-- 
2.23.0.581.g78d2f28ef7-goog
