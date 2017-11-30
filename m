Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:43999 "EHLO
        mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751642AbdK3XjK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:39:10 -0500
Received: by mail-io0-f195.google.com with SMTP id s37so9379104ioe.10
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:39:10 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 0/7] Add support for GNU gold
Date: Thu, 30 Nov 2017 15:38:58 -0800
Message-Id: <20171130233905.130602-1-samitolvanen@google.com>
In-Reply-To: <20171129234442.655-1-samitolvanen@google.com>
References: <20171129234442.655-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

These patches add macros for detecting the linker name and version,
and apply fixes and workarounds needed to link the arm64 kernel with
GNU gold.

Changes since v1:
  - moved LD_DEAD_CODE_DATA_ELIMINATION fixes to the beginning of the
    patch set and removed mentions of gold
  - renamed ld-if-name-version to __ld-ifversion for consistency
  - cleaned up the erratum changes in arch/arm64/Makefile

Sami Tolvanen (7):
  kbuild: fix LD_DEAD_CODE_DATA_ELIMINATION
  arm64: keep .altinstructions and .altinstr_replacement
  kbuild: add ld-name macro
  kbuild: add __ld-ifversion and linker-specific macros
  arm64: fix -m for GNU gold
  arm64: explicitly pass --no-fix-cortex-a53-843419 to GNU gold
  arm64: add a workaround for GNU gold with ARM64_MODULE_PLTS

 arch/arm64/Makefile               | 17 +++++++++++++++++
 arch/arm64/kernel/module.lds      |  4 ++--
 arch/arm64/kernel/vmlinux.lds.S   |  4 ++--
 include/asm-generic/vmlinux.lds.h |  8 ++++----
 scripts/Kbuild.include            | 16 ++++++++++++++++
 5 files changed, 41 insertions(+), 8 deletions(-)

-- 
2.15.0.531.g2ccb3012c9-goog

