Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.136]:59659 "EHLO mail.kernel.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1030868AbbDWWDj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 23 Apr 2015 18:03:39 -0400
From: Arnaldo Carvalho de Melo <acme@kernel.org>
Subject: [PATCH 4/4] tools lib api: Undefine _FORTIFY_SOURCE before setting it
Date: Thu, 23 Apr 2015 19:03:10 -0300
Message-Id: <1429826590-32193-5-git-send-email-acme@kernel.org>
In-Reply-To: <1429826590-32193-1-git-send-email-acme@kernel.org>
References: <1429826590-32193-1-git-send-email-acme@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@kernel.org>
Cc: linux-kernel@vger.kernel.org, Bobby Powers <bobbypowers@gmail.com>, Dirk Gouders <dirk@gouders.net>, Michal Marek <mmarek@suse.cz>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, linux-kbuild@vger.kernel.org, Arnaldo Carvalho de Melo <acme@redhat.com>

From: Bobby Powers <bobbypowers@gmail.com>

Some toolchains (like Hardened Gentoo) define _FORTIFY_SOURCE in the
built-in, default args.  This causes perf builds to fail with:

<command-line>:0:0: error: "_FORTIFY_SOURCE" redefined [-Werror]
<built-in>: note: this is the location of the previous definition cc1:
all warnings being treated as errors

To avoid this, undefine _FORTIFY_SOURCE before (possibly re-)defining it
in tools/lib/api.

v2 applies cleanly on top of already pulled kbuild changes for 4.1-rc1.

Signed-off-by: Bobby Powers <bobbypowers@gmail.com>
Acked-by: Jiri Olsa <jolsa@kernel.org>
Cc: Dirk Gouders <dirk@gouders.net>
Cc: Michal Marek <mmarek@suse.cz>
Cc: Paul Mackerras <paulus@samba.org>
Cc: Peter Zijlstra <a.p.zijlstra@chello.nl>
Cc: linux-kbuild@vger.kernel.org
Link: http://lkml.kernel.org/r/1429658381-3039-1-git-send-email-bobbypowers@gmail.com
Signed-off-by: Arnaldo Carvalho de Melo <acme@redhat.com>
---
 tools/lib/api/Makefile | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/tools/lib/api/Makefile b/tools/lib/api/Makefile
index d8fe29fc19a4..8bd960658463 100644
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
1.9.3

