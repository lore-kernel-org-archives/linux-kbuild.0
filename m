Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f195.google.com ([209.85.215.195]:35562 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726692AbeJ2CJT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 28 Oct 2018 22:09:19 -0400
Received: by mail-pg1-f195.google.com with SMTP id 32-v6so2752753pgu.2
        for <linux-kbuild@vger.kernel.org>; Sun, 28 Oct 2018 10:24:04 -0700 (PDT)
Date: Sun, 28 Oct 2018 10:24:01 -0700
From: Kees Cook <keescook@chromium.org>
Subject: [GIT PULL] VLA removal for v4.20-rc1
Message-ID: <20181028172401.GA41102@beast>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, David Airlie <airlied@linux.ie>, dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org, linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Nick Desaulniers <ndesaulniers@google.com>

Hi Linus,

Please pull these VLA removal changes for v4.20-rc1. This turns on "-Wvla"
globally now that the last few trees with their VLA removals have landed
(crypto, block, net, and powerpc). Arnd mentioned that there may be a
couple more VLAs hiding in hard-to-find randconfigs, but nothing big has
shaken out in the last month or so in linux-next. We should be basically
VLA-free now! Wheee. :)

Thanks!

-Kees

The following changes since commit 57361846b52bc686112da6ca5368d11210796804:

  Linux 4.19-rc2 (2018-09-02 14:37:30 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/kees/linux.git tags/vla-v4.20-rc1

for you to fetch changes up to 0bb95f80a38f82884693194ea720e9cca5e12ada:

  Makefile: Globally enable VLA warning (2018-10-11 08:17:50 -0700)

----------------------------------------------------------------
Globally warn on VLA use

- Remove unused fallback for BUILD_BUG_ON (which technically contains a VLA)
- Lift -Wvla to the top-level Makefile

----------------------------------------------------------------
Kees Cook (1):
      Makefile: Globally enable VLA warning

Masahiro Yamada (1):
      compiler.h: give up __compiletime_assert_fallback()

 Makefile                      |  3 +++
 drivers/gpu/drm/i915/Makefile |  2 +-
 include/linux/compiler.h      | 17 +----------------
 lib/Makefile                  |  2 ++
 scripts/Makefile.extrawarn    |  1 -
 5 files changed, 7 insertions(+), 18 deletions(-)

-- 
Kees Cook
