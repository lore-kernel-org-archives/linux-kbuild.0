Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:41173 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750854AbdLDTRm (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Dec 2017 14:17:42 -0500
Received: by mail-it0-f68.google.com with SMTP id x28so15477423ita.0
        for <linux-kbuild@vger.kernel.org>; Mon, 04 Dec 2017 11:17:42 -0800 (PST)
From: Paul Lawrence <paullawrence@google.com>
Subject: [PATCH v4 0/5] kasan: support alloca, LLVM
Date: Mon,  4 Dec 2017 11:17:30 -0800
Message-Id: <20171204191735.132544-1-paullawrence@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Paul Lawrence <paullawrence@google.com>

[PATCH v3 1/5] kasan: add compiler support for clang
  No change

[PATCH v3 2/5] kasan/Makefile: Support LLVM style asan parameters.
  Correctly attributed
  Changed to use strip to work in all environments

[PATCH v3 3/5] kasan: support alloca() poisoning
  No change

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

