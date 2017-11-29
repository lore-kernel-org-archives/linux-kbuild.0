Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:33462 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752448AbdK2Xot (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 29 Nov 2017 18:44:49 -0500
Received: by mail-pg0-f65.google.com with SMTP id g7so2216222pgs.0
        for <linux-kbuild@vger.kernel.org>; Wed, 29 Nov 2017 15:44:49 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH 0/7] Add support for GNU gold
Date: Wed, 29 Nov 2017 15:44:35 -0800
Message-Id: <20171129234442.655-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

These patches add macros for detecting the linker name and version,
and apply fixes and workarounds needed to link the arm64 kernel with
GNU gold.

Sami Tolvanen (7):
  kbuild: add ld-name macro and support for GNU gold
  kbuild: add ld-if-name-version and linker-specific macros
  kbuild: fix LD_DEAD_CODE_DATA_ELIMINATION with GNU gold
  arm64: fix -m for GNU gold
  arm64: keep .altinstructions and .altinstr_replacement
  arm64: explicitly pass --no-fix-cortex-a53-843419 to GNU gold
  arm64: add a workaround for GNU gold with ARM64_MODULE_PLTS

 Makefile                          |  5 +++++
 arch/arm64/Makefile               | 17 +++++++++++++++++
 arch/arm64/kernel/module.lds      |  4 ++--
 arch/arm64/kernel/vmlinux.lds.S   |  4 ++--
 include/asm-generic/vmlinux.lds.h |  8 ++++----
 scripts/Kbuild.include            | 16 ++++++++++++++++
 6 files changed, 46 insertions(+), 8 deletions(-)

-- 
2.15.0.531.g2ccb3012c9-goog

