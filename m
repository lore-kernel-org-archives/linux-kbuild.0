Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f169.google.com ([209.85.192.169]:35677 "EHLO
        mail-pf0-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753122AbdFMA4A (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 12 Jun 2017 20:56:00 -0400
Received: by mail-pf0-f169.google.com with SMTP id l89so58874621pfi.2
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Jun 2017 17:56:00 -0700 (PDT)
From: Matthias Kaehlcke <mka@chromium.org>
Subject: [PATCH 0/3] x86: stack alignment for boot code and clang
Date: Mon, 12 Jun 2017 17:55:28 -0700
Message-Id: <20170613005531.77656-1-mka@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H . Peter Anvin" <hpa@zytor.com>, "H . J . Lu" <hjl.tools@gmail.com>, David Woodhouse <dwmw2@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>
Cc: x86@kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michael Davidson <md@google.com>, Greg Hackmann <ghackmann@google.com>, Nick Desaulniers <ndesaulniers@google.com>, Stephen Hines <srhines@google.com>, Kees Cook <keescook@chromium.org>, Arnd Bergmann <arnd@arndb.de>, Bernhard.Rosenkranzer@linaro.org, Peter Foley <pefoley2@pefoley.com>, Behan Webster <behanw@converseincode.com>, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>

This series fixes an issue with the stack of the x86 boot code not
being aligned as intended. Further it adapts the Makefile to account
for the fact that clang uses a different option to configure the
stack alignment than gcc (-mstack-alignment=N vs
-mpreferred-stack-boundary=N)

Matthias Kaehlcke (3):
  kbuild: Add cc-option-no-kbuild macro
  x86/build: Use cc-option-no-kbuild for boot code compiler options
  x86/build: Specify stack alignment for clang

 arch/x86/Makefile      | 25 +++++++++++++++++--------
 scripts/Kbuild.include |  5 +++++
 2 files changed, 22 insertions(+), 8 deletions(-)

-- 
2.13.1.508.gb3defc5cc-goog

