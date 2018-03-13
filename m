Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:44716 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751391AbeCMGLz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Mar 2018 02:11:55 -0400
Received: by mail-pg0-f67.google.com with SMTP id l4so7557399pgp.11
        for <linux-kbuild@vger.kernel.org>; Mon, 12 Mar 2018 23:11:55 -0700 (PDT)
From: Douglas Anderson <dianders@chromium.org>
Subject: [PATCH v3 0/2] kbuild: Fix corner caches with .cache.mk
Date: Mon, 12 Mar 2018 23:11:07 -0700
Message-Id: <20180313061109.72629-1-dianders@chromium.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: malat@debian.org, dave.hansen@intel.com, yang.s@alibaba-inc.com, linux@roeck-us.net, Douglas Anderson <dianders@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <michal.lkml@markovi.net>, Ingo Molnar <mingo@kernel.org>, Nick Desaulniers <ndesaulniers@google.com>

This two-patches fixes two corner cases with .cache.mk that have been
reported.  Neither problem was catastrophic, but certainly several
people ran into the problem solved by the first patch (can't build
after gcc upgrade) and wasted time debugging, so it's really a good
idea to fix.

Sorry for the big delay between v2 and v3.  I never quite caught up
with email after the holidays, but hopefully better late than never...

Changes in v3:
- Fix as per Masahiro Yamada (move change to main Makefile)
- Use "uid 0" as the heuristic instead of install
- Do the checking in the main Makefile instead of Kbuild.include

Changes in v2:
- Don't error if MAKECMDGOALS is blank.

Douglas Anderson (2):
  kbuild: Require a 'make clean' if we detect gcc changed underneath us
  kbuild: Don't mess with the .cache.mk when root

 Makefile               | 15 +++++++++++++++
 scripts/Kbuild.include |  2 ++
 2 files changed, 17 insertions(+)

-- 
2.16.2.660.g709887971b-goog

