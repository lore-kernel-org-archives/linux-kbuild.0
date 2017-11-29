Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:37634 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751496AbdK2AAW (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 28 Nov 2017 19:00:22 -0500
Received: by mail-it0-f65.google.com with SMTP id d137so1982330itc.2
        for <linux-kbuild@vger.kernel.org>; Tue, 28 Nov 2017 16:00:21 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH 0/3] Add version macros for clang and fix arm64 for clang <6.0
Date: Tue, 28 Nov 2017 16:00:08 -0800
Message-Id: <20171129000011.55235-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>
Cc: Sami Tolvanen <samitolvanen@google.com>

In order to build an arm64 kernel with clang <6.0, we need to work
around LLVM bug 30792 by using -mno-implicit-float instead of
-mgeneral-regs-only.

This patch set adds macros for checking clang version, and enable the
workaround only for affected compiler versions.

Greg Hackmann (1):
  arm64: use -mno-implicit-float instead of -mgeneral-regs-only

Sami Tolvanen (2):
  kbuild: add clang-version.sh
  kbuild: add cc-if-name-version and compiler-specific variants

 arch/arm64/Makefile      |  5 ++++-
 scripts/Kbuild.include   | 31 +++++++++++++++++++++++++++++++
 scripts/clang-version.sh | 33 +++++++++++++++++++++++++++++++++
 3 files changed, 68 insertions(+), 1 deletion(-)
 create mode 100755 scripts/clang-version.sh

-- 
2.15.0.417.g466bffb3ac-goog

