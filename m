Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-08.nifty.com ([210.131.2.75]:20644 "EHLO
        conuserg-08.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753098AbeCPHhn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Mar 2018 03:37:43 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH v4 0/7] kbuild: various fix, clean-up, improvements of CONFIG_TRIM_UNUSED_KSYMS
Date: Fri, 16 Mar 2018 16:37:08 +0900
Message-Id: <1521185836-19120-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Michal Marek <michal.lkml@markovi.net>, Nicolas Pitre <nicolas.pitre@linaro.org>, linux-kernel@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>


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
 Makefile                    | 64 ++++++++++++++++++++++-----------------------
 scripts/Kbuild.include      |  2 +-
 scripts/adjust_autoksyms.sh |  5 +---
 scripts/basic/fixdep.c      |  8 +++---
 scripts/kconfig/Makefile    |  2 --
 6 files changed, 39 insertions(+), 43 deletions(-)

-- 
2.7.4

