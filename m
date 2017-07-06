Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f48.google.com ([74.125.83.48]:33839 "EHLO
        mail-pg0-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752649AbdGFWBg (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 6 Jul 2017 18:01:36 -0400
Received: by mail-pg0-f48.google.com with SMTP id t186so7258889pgb.1
        for <linux-kbuild@vger.kernel.org>; Thu, 06 Jul 2017 15:01:36 -0700 (PDT)
From: Greg Hackmann <ghackmann@google.com>
Subject: [PATCH 0/4] kasan: add clang support
Date: Thu,  6 Jul 2017 15:01:10 -0700
Message-Id: <20170706220114.142438-1-ghackmann@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <aryabinin@virtuozzo.com>, Alexander Potapenko <glider@google.com>, Dmitry Vyukov <dvyukov@google.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: linux-kernel@vger.kernel.org, kasan-dev@googlegroups.com, linux-mm@kvack.org, linux-kbuild@vger.kernel.org, Matthias Kaehlcke <mka@chromium.org>, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>

This patch series adds support for building KASAN-enabled kernels with clang.
This mostly involves adding callbacks for a couple of new features in LLVM's
AddressSanitizer implementation.  We also need to probe for the (slightly
different) CFLAGS used to configure ASAN with clang.

*** BLURB HERE ***

Alexander Potapenko (1):
  kasan: added functions for unpoisoning stack variables

Greg Hackmann (3):
  kasan: support alloca() poisoning
  kasan: support LLVM-style asan parameters
  kasan: add compiler support for clang

 include/linux/compiler-clang.h | 10 ++++++++++
 lib/test_kasan.c               | 22 ++++++++++++++++++++++
 mm/kasan/kasan.c               | 41 +++++++++++++++++++++++++++++++++++++++++
 mm/kasan/kasan.h               |  8 ++++++++
 mm/kasan/report.c              |  3 +++
 scripts/Makefile.kasan         | 10 +++++++++-
 6 files changed, 93 insertions(+), 1 deletion(-)

-- 
2.13.2.725.g09c95d1e9-goog

