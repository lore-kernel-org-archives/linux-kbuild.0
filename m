Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qg0-f52.google.com ([209.85.192.52]:34434 "EHLO
	mail-qg0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S964880AbbDUXT4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 21 Apr 2015 19:19:56 -0400
From: Bobby Powers <bobbypowers@gmail.com>
Subject: [PATCH v2] tools/lib/api: undefine _FORTIFY_SOURCE before setting it
Date: Tue, 21 Apr 2015 19:19:41 -0400
Message-Id: <1429658381-3039-1-git-send-email-bobbypowers@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org, Kernel development list <linux-kernel@vger.kernel.org>
Cc: Bobby Powers <bobbypowers@gmail.com>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Paul Mackerras <paulus@samba.org>, Ingo Molnar <mingo@redhat.com>, Dirk Gouders <dirk@gouders.net>, Arnaldo Carvalho de Melo <acme@kernel.org>, Jiri Olsa <jolsa@kernel.org>, Michal Marek <mmarek@suse.cz>

Some toolchains (like Hardened Gentoo) define _FORTIFY_SOURCE in the
built-in, default args.  This causes perf builds to fail with:

<command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
<built-in>: note: this is the location of the previous definition
cc1: all warnings being treated as errors

To avoid this, undefine _FORTIFY_SOURCE before (possibly
re-)defining it in tools/lib/api.

v2 applies cleanly on top of already pulled kbuild changes for 4.1-rc1.

Signed-off-by: Bobby Powers <bobbypowers@gmail.com>
Acked-by: Jiri Olsa <jolsa@kernel.org>
---
 tools/lib/api/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index d8fe29f..8bd9606 100644
--- a/tools/lib/api/Makefile
+++ b/tools/lib/api/Makefile
@@ -16,7 +16,7 @@ MAKEFLAGS += --no-print-directory
 LIBFILE = $(OUTPUT)libapi.a
 
 CFLAGS := $(EXTRA_WARNINGS) $(EXTRA_CFLAGS)
-CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -D_FORTIFY_SOURCE=2 -fPIC
+CFLAGS += -ggdb3 -Wall -Wextra -std=gnu99 -Werror -O6 -U_FORTIFY_SOURCE -D_FORTIFY_SOURCE=2 -fPIC
 CFLAGS += -D_LARGEFILE64_SOURCE -D_FILE_OFFSET_BITS=64
 
 RM = rm -f
-- 
2.3.5

