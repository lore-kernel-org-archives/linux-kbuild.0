Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f201.google.com ([209.85.215.201]:33214 "EHLO
        mail-pg1-f201.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388241AbfBKTax (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Feb 2019 14:30:53 -0500
Received: by mail-pg1-f201.google.com with SMTP id y1so59127pgo.0
        for <linux-kbuild@vger.kernel.org>; Mon, 11 Feb 2019 11:30:52 -0800 (PST)
Date: Mon, 11 Feb 2019 11:30:07 -0800
In-Reply-To: <20190211193008.24101-1-ndesaulniers@google.com>
Message-Id: <20190211193008.24101-5-ndesaulniers@google.com>
Mime-Version: 1.0
References: <20190211193008.24101-1-ndesaulniers@google.com>
Subject: [PATCH v2 0/4] Improve kernel LLD support
From: ndesaulniers@google.com
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: yamada.masahiro@socionext.com
Cc: natechancellor@gmail.com, sedat.dilek@gmail.com, keescook@chromium.org, samitolvanen@google.com, michal.lkml@markovi.net, akpm@linux-foundation.org, hannes@cmpxchg.org, peterz@infradead.org, linux@dominikbrodowski.net, npiggin@gmail.com, mathieu.desnoyers@efficios.com, gor@linux.ibm.com, adrian@lisas.de, rgb@redhat.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Nick Desaulniers <ndesaulniers@google.com>

This patch cleans up a few places in the Makefile to make way for
landing LLD support in the kernel.  There are still a few arch specific
fixes that need to get upstreamed, but this core set of patches should
be arch independent.

Some very rough numbers: LLD is improving the overall build time of
Google Pixel kernels by about 9%.  The build is mostly dominated by
compilation, but LLD is able to shave off quite a bit of time.

One of the included patches helps get LLD linked kernels to competitive
binary size, but there still some bugs in LLD causing it not to discard
certain sections.  Once that's fixed, I estimate an LLD linked kernel to
be just barely smaller than a BFD linked kernel (less than 1%).

Folks looking to test should use LLD built from source, as I recently
fixed a bug in LLD that prevented LLD linked kernel modules from being
loadable.

$ make LD=ld.lld

Nick Desaulniers (4):
  init/Kconfig: add config support for detecting linker
  Makefile: clang: choose GCC_TOOLCHAIN_DIR not on LD
  Makefile: lld: tell clang to use lld
  Makefile: lld: set -O2 linker flag when linking with LLD

Changes since v1:
* collect reviewed-by, sugguested-by, tested-by tags.
* move where -fuse-ld=lld is added to CFLAGS.

 Makefile     | 9 ++++++++-
 init/Kconfig | 9 +++++++++
 2 files changed, 17 insertions(+), 1 deletion(-)

-- 
2.20.1.791.gb4d0f1c61a-goog
