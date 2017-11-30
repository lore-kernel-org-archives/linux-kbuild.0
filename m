Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:32845 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750898AbdK3Xie (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Nov 2017 18:38:34 -0500
Received: by mail-io0-f194.google.com with SMTP id t196so9435675iof.0
        for <linux-kbuild@vger.kernel.org>; Thu, 30 Nov 2017 15:38:34 -0800 (PST)
From: Sami Tolvanen <samitolvanen@google.com>
Subject: [PATCH v2 0/2] Add version macros for clang
Date: Thu, 30 Nov 2017 15:38:25 -0800
Message-Id: <20171130233827.130069-1-samitolvanen@google.com>
In-Reply-To: <20171129000011.55235-1-samitolvanen@google.com>
References: <20171129000011.55235-1-samitolvanen@google.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Matveev <alxmtvv@gmail.com>, Andi Kleen <ak@linux.intel.com>, Ard Biesheuvel <ard.biesheuvel@linaro.org>, Greg Hackmann <ghackmann@google.com>, Kees Cook <keescook@chromium.org>, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mark Rutland <mark.rutland@arm.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>, Michal Marek <michal.lkml@markovi.net>, Nick Desaulniers <ndesaulniers@google.com>, Yury Norov <ynorov@caviumnetworks.com>, Matthias Kaehlcke <mka@chromium.org>, Nicholas Piggin <npiggin@gmail.com>
Cc: Sami Tolvanen <samitolvanen@google.com>

This patch set adds macros for checking clang version.

Changes from v1:
  - fixed a comment in clang-version.sh
  - renamed macros to __cc-ifversion and __cc-if-fullversion
  - fixed a bug with non-bash shells
  - dropped the arm64 patch as unnecessary

Sami Tolvanen (2):
  kbuild: add clang-version.sh
  kbuild: add __cc-ifversion and compiler-specific variants

 scripts/Kbuild.include   | 41 ++++++++++++++++++++++++++++++++++-------
 scripts/clang-version.sh | 33 +++++++++++++++++++++++++++++++++
 2 files changed, 67 insertions(+), 7 deletions(-)
 create mode 100755 scripts/clang-version.sh

-- 
2.15.0.531.g2ccb3012c9-goog

