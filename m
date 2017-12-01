Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:41715 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751119AbdLAVg4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Dec 2017 16:36:56 -0500
Received: by mail-it0-f67.google.com with SMTP id x28so4036518ita.0
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Dec 2017 13:36:56 -0800 (PST)
From: Paul Lawrence <paullawrence@google.com>
Subject: [PATCH v3 0/5] kasan: support alloca, LLVM
Date: Fri,  1 Dec 2017 13:36:38 -0800
Message-Id: <20171201213643.2506-1-paullawrence@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Paul Lawrence <paullawrence@google.com>

[PATCH v3 1/5] kasan: add compiler support for clang
  Moved to start of patchset

[PATCH v3 2/5] kasan/Makefile: Support LLVM style asan parameters.
  Using Andrey's version.
  Fixed up bug with testing CFLAGS_KASAN_SHADOW
  Modifed to not output gcc style options on llvm

[PATCH v3 3/5] kasan: support alloca() poisoning
  Added alloca makefile option here
  Modified to only unpoison the last block

[PATCH v3 4/5] kasan: Add tests for alloca poisoning
  No change

[PATCH v3 5/5] kasan: added functions for unpoisoning stack variables
  No change

Paul Lawrence (5):
  kasan: add compiler support for clang
  kasan/Makefile: Support LLVM style asan parameters.
  kasan: support alloca() poisoning
  kasan: Add tests for alloca poisonong
  kasan: added functions for unpoisoning stack variables

 include/linux/compiler-clang.h |  8 +++++++
 lib/test_kasan.c               | 22 +++++++++++++++++++
 mm/kasan/kasan.c               | 49 ++++++++++++++++++++++++++++++++++++++++++
 mm/kasan/kasan.h               |  8 +++++++
 mm/kasan/report.c              |  4 ++++
 scripts/Makefile.kasan         | 30 ++++++++++++++++----------
 6 files changed, 110 insertions(+), 11 deletions(-)

-- 
2.15.0.531.g2ccb3012c9-goog

