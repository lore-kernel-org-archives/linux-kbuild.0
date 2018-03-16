Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:44536 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751774AbeCPCTM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 22:19:12 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v2 0/7] kbuild: various fix, clean-up, improvements of CONFIG_TRIM_UNUSED_KSYMS
Date: Fri, 16 Mar 2018 11:18:37 +0900
Message-Id: <1521166725-24157-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org


Masahiro Yamada (7):
  kbuild: clear LDFLAGS in the top Makefile
  kbuild: remove wrong 'touch' in adjust_autoksyms.sh
  kbuild: move 'scripts' target below
  kbuild: restore touching autoksyms.h to the top Makefile
  kbuild: move CONFIG_TRIM_UNUSED_KSYMS code unneeded for external
    module
  kbuild: move include/config/ksym/* to include/ksym/*
  kbuild: link vmlinux only once for CONFIG_TRIM_UNUSED_KSYMS

 .gitignore                  |  1 +
 Makefile                    | 66 ++++++++++++++++++++++-----------------------
 scripts/Kbuild.include      |  2 +-
 scripts/adjust_autoksyms.sh |  5 +---
 scripts/basic/fixdep.c      |  8 +++---
 scripts/kconfig/Makefile    |  2 --
 6 files changed, 39 insertions(+), 45 deletions(-)

-- 
2.7.4

