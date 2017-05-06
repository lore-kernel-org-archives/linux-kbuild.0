Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-10.nifty.com ([210.131.2.77]:53493 "EHLO
        conuserg-10.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754430AbdEFPlc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 6 May 2017 11:41:32 -0400
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH] docs: bump minimal GNU Make version to 3.81
Date: Sun,  7 May 2017 00:39:17 +0900
Message-Id: <1494085157-22826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: linux-kbuild@vger.kernel.org, Masahiro Yamada <yamada.masahiro@socionext.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, linux-doc@vger.kernel.org, Markus Heiser <markus.heiser@darmarit.de>, Jonathan Corbet <corbet@lwn.net>, linux-kernel@vger.kernel.org, SeongJae Park <sj38.park@gmail.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

Recent kernel versions have broken compatibility with GNU Make
version 3.80 here and there:

  $ git describe
  v4.11
  $ make --version | head -1
  GNU Make 3.80
  $ make defconfig
    HOSTCC  scripts/basic/fixdep
  scripts/Makefile.host:135: *** missing separator.  Stop.
  make: *** [defconfig] Error 2
  $ make ARCH=arm64 help
  arch/arm64/Makefile:43: *** unterminated call to function `warning': missing `)'.  Stop.
  $ make help >/dev/null
  ./Documentation/Makefile.sphinx:25: Extraneous text after `else' directive
  ./Documentation/Makefile.sphinx:31: *** only one `else' per conditional.  Stop.
  make: *** [help] Error 2

The first breakage was introduced by commit c8589d1e9e01 ("kbuild:
handle multi-objs dependency appropriately").  Since then (i.e. v3.18),
GNU Make 3.80 has not been able to compile the kernel for years, but
nobody has ever complained (noticed) about it.

Even GNU Make 3.81 is more than 10 years old.  It would not hurt to
match the documentation with reality instead of fixing makefiles.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

Hi Linus,

You acked this change already.
Could you apply this patch to your tree directly?
Thank you.


 Documentation/process/changes.rst | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/Documentation/process/changes.rst b/Documentation/process/changes.rst
index 01c5dbc..cef7bc4 100644
--- a/Documentation/process/changes.rst
+++ b/Documentation/process/changes.rst
@@ -30,7 +30,7 @@ you probably needn't concern yourself with isdn4k-utils.
         Program        Minimal version       Command to check the version
 ====================== ===============  ========================================
 GNU C                  3.2              gcc --version
-GNU make               3.80             make --version
+GNU make               3.81             make --version
 binutils               2.12             ld -v
 util-linux             2.10o            fdformat --version
 module-init-tools      0.9.10           depmod -V
-- 
2.7.4

