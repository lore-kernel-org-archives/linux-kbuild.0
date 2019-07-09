Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-11.nifty.com ([210.131.2.78]:42787 "EHLO
        conuserg-11.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726032AbfGIGNO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 9 Jul 2019 02:13:14 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] kbuild: use -- separater intead of $(filter-out ...) for cc-cross-prefix
Date: Tue,  9 Jul 2019 15:13:00 +0900
Message-Id: <20190709061300.527-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org

arch/mips/Makefile passes prefixes that start with '-' to cc-cross-prefix
when $(tool-archpref) evaluates to the empty string.

They are filtered-out before the $(shell ...) invocation. Otherwise,
'command -v' would be confused.

  $ command -v -linux-gcc
  bash: command: -l: invalid option
  command: usage: command [-pVv] command [arg ...]

Since commit 913ab9780fc0 ("kbuild: use more portable 'command -v' for
cc-cross-prefix"), cc-cross-prefix throws away the stderr output, so
the console is not polluted in any way.

This is not a big deal in practice, but I see a slightly better taste
in adding '--' to teach it that '-linux-gcc' is an argument instead of
a command option.

This will cause extra forking of subshell, but it will not be noticeable
performance regression.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/Kbuild.include | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
index 222fd1d7d3ae..c62d690c7dcf 100644
--- a/scripts/Kbuild.include
+++ b/scripts/Kbuild.include
@@ -79,8 +79,8 @@ endef
 # would try to directly execute the shell builtin 'command'. This workaround
 # should be kept for a long time since this issue was fixed only after the
 # GNU Make 4.2.1 release.
-cc-cross-prefix = $(firstword $(foreach c, $(filter-out -%, $(1)), \
-			$(if $(shell command -v $(c)gcc 2>/dev/null), $(c))))
+cc-cross-prefix = $(firstword $(foreach c, $(1), \
+			$(if $(shell command -v -- $(c)gcc 2>/dev/null), $(c))))
 
 # output directory for tests below
 TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
-- 
2.17.1
