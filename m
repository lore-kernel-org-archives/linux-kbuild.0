Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f47.google.com ([74.125.83.47]:34387 "EHLO
        mail-pg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752615AbdFMXJ4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Jun 2017 19:09:56 -0400
Received: by mail-pg0-f47.google.com with SMTP id v18so66744312pgb.1
        for <linux-kbuild@vger.kernel.org>; Tue, 13 Jun 2017 16:09:56 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v2 0/4] x86: stack alignment for boot code and clang
Date: Tue, 13 Jun 2017 16:08:50 -0700
Message-Id: <20170613230854.112282-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

This series fixes an issue with the stack of the x86 boot code not
being aligned as intended. Further it adapts the Makefile to account
for the fact that clang uses a different option to configure the
stack alignment than gcc (-mstack-alignment=N vs
-mpreferred-stack-boundary=N)

Collaterally the series adds the new kbuild macros cc-option-raw and
hostcc-option, it also reworks cc-option to make use of cc-option-raw.

Matthias Kaehlcke (4):
  kbuild: Add cc-option-raw macro
  kbuild: Add hostcc-option macro
  x86/build: Use cc-option-raw for boot code compiler options
  x86/build: Specify stack alignment for clang

 Makefile               |  2 +-
 arch/x86/Makefile      | 33 +++++++++++++++++++++++++--------
 scripts/Kbuild.include | 13 +++++++++++--
 3 files changed, 37 insertions(+), 11 deletions(-)

-- 
2.13.1.518.g3df882009-goog

