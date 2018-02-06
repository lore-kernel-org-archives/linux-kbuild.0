Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conuserg-07.nifty.com ([210.131.2.74]:39620 "EHLO
        conuserg-07.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750872AbeBFAhv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Feb 2018 19:37:51 -0500
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Subject: [PATCH 05/14] kconfig: remove 'config*' pattern from .gitignnore
Date: Tue,  6 Feb 2018 09:34:45 +0900
Message-Id: <1517877294-4826-6-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Ulf Magnusson <ulfalizer@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kernel@vger.kernel.org

I could not figure out why this pattern should be ignored.
Checking commit 1e65174a3378 ("Add some basic .gitignore files")
did not help.

Let's remove this pattern, then see if it is really needed.

Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
---

 scripts/kconfig/.gitignore | 1 -
 1 file changed, 1 deletion(-)

diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
index 51f1c87..a76856e 100644
--- a/scripts/kconfig/.gitignore
+++ b/scripts/kconfig/.gitignore
@@ -1,7 +1,6 @@
 #
 # Generated files
 #
-config*
 *.lex.c
 *.tab.c
 *.tab.h
-- 
2.7.4

