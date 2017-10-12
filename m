Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:26495 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750907AbdJLJ5d (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 12 Oct 2017 05:57:33 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 0/2] kbuild: use relative path from $(srctree) instead of __FILE__
Date: Thu, 12 Oct 2017 18:56:02 +0900
Message-Id: <1507802164-31614-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Joe Perches <joe@perches.com>, Tom Rini <trini@konsulko.com>, Geert Uytterhoeven <geert+renesas@glider.be>, Masahiro Yamada <yamada.masahiro@socionext.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, James Hogan <jhogan@kernel.org>, linux-kernel@vger.kernel.org, =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>, Michal Marek <michal.lkml@markovi.net>, Douglas Anderson <dianders@chromium.org>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>, Mark Charlebois <charlebm@gmail.com>


Kbuild works in objtree, not in srctree.  So, __FILE__ is prefixed
with $(srctree)/ for out-of-tree build.

For example, WARN_ON() will look as follows if you built your kernel
out of source tree:

WARNING: CPU: 1 PID: 1 at /path/to/build/directory/arch/arm64/kernel/foo.c:...

With this series, it will always look like follows regardless of O= option.

WARNING: CPU: 1 PID: 1 at arch/arm64/kernel/foo.c:...

If GCC does not support -Wno-builtin-macro-redefined (i.e. gcc version < 4.4),
the output is prefixed with absolute path.



Masahiro Yamada (2):
  kbuild: add stringify helper to quote a string passed to C files
  kbuild: redefine __FILE__ as relative path from $(srctree) if possible

 Makefile               | 9 +++++++++
 scripts/Kbuild.include | 4 ++++
 scripts/Makefile.lib   | 2 +-
 3 files changed, 14 insertions(+), 1 deletion(-)

-- 
2.7.4

