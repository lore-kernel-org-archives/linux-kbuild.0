Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f172.google.com ([209.85.192.172]:36835 "EHLO
        mail-pf0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750986AbdFUX2V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 19:28:21 -0400
Received: by mail-pf0-f172.google.com with SMTP id q86so175437pfl.3
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Jun 2017 16:28:21 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH v5 0/3] x86: stack alignment for boot code and clang
Date: Wed, 21 Jun 2017 16:28:02 -0700
Message-Id: <20170621232805.149448-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

This series fixes an issue with the stack of the x86 boot code not
being aligned as intended. Further it adapts the Makefile to account
for the fact that clang uses a different option to configure the
stack alignment than gcc (-mstack-alignment=N vs
-mpreferred-stack-boundary=N)

Collaterally the series adds the new kbuild macro __cc-option and
refactors the macros cc-option and hostcc-option to make use of
__cc-option.

Matthias Kaehlcke (3):
  kbuild: Add __cc-option macro
  x86/build: Use __cc-option for boot code compiler options
  x86/build: Specify stack alignment for clang

 Makefile               |  2 +-
 arch/x86/Makefile      | 33 +++++++++++++++++++++++++--------
 scripts/Kbuild.include | 14 ++++++++++++--
 scripts/Makefile.host  |  6 ------
 4 files changed, 38 insertions(+), 17 deletions(-)

-- 
2.13.1.611.g7e3b11ae1-goog

