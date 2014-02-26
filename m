Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f177.google.com ([209.85.192.177]:38097 "EHLO
	mail-pd0-f177.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751491AbaBZBJd (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 25 Feb 2014 20:09:33 -0500
Received: by mail-pd0-f177.google.com with SMTP id g10so211817pdj.22
        for <linux-kbuild@vger.kernel.org>; Tue, 25 Feb 2014 17:09:33 -0800 (PST)
From: behanw@converseincode.com
Subject: [PATCH 3/5] kbuild: LLVMLinux: Fix LINUX_COMPILER definition script for compilation with clang
Date: Tue, 25 Feb 2014 17:08:41 -0800
Message-Id: <1393376923-21892-4-git-send-email-behanw@converseincode.com>
In-Reply-To: <1393376923-21892-1-git-send-email-behanw@converseincode.com>
References: <1393376923-21892-1-git-send-email-behanw@converseincode.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz, tglx@linutronix.de, mingo@redhat.com, hpa@zytor.com, x86@kernel.org, sparse@chrisli.org
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, linux-sparse@vger.kernel.org, torvalds@linux-foundation.org, dwmw2@infradead.org, pageexec@freemail.hu, =?UTF-8?q?Jan-Simon=20M=C3=B6ller?= <dl9pf@gmx.de>, Behan Webster <behanw@converseincode.com>, Mark Charlebois <charlebm@gmail.com>

From: Jan-Simon Möller <dl9pf@gmx.de>

When building the LINUX_COMPILER definition, instead of merely taking the last
line from "$(CC) -v", grep for ' version ' in the output. This supports both
gcc and clang.

Signed-off-by: Jan-Simon Möller <dl9pf@gmx.de>
Signed-off-by: Behan Webster <behanw@converseincode.com>
Signed-off-by: Mark Charlebois <charlebm@gmail.com>
Cc: PaX Team <pageexec@freemail.hu>
---
 scripts/mkcompile_h | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
index f221ddf..cfb8440 100755
--- a/scripts/mkcompile_h
+++ b/scripts/mkcompile_h
@@ -76,7 +76,7 @@ UTS_TRUNCATE="cut -b -$UTS_LEN"
   echo \#define LINUX_COMPILE_BY \"`echo $LINUX_COMPILE_BY | $UTS_TRUNCATE`\"
   echo \#define LINUX_COMPILE_HOST \"`echo $LINUX_COMPILE_HOST | $UTS_TRUNCATE`\"
 
-  echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | tail -n 1`\"
+  echo \#define LINUX_COMPILER \"`$CC -v 2>&1 | grep ' version '`\"
 ) > .tmpcompile
 
 # Only replace the real compile.h if the new one is different,
-- 
1.8.3.2

