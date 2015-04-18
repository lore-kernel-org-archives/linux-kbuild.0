Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:53999 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752034AbbDRUex (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 Apr 2015 16:34:53 -0400
From: Jiri Olsa <jolsa@kernel.org>
Subject: [PATCH 0/3] tools build: Fix tools Makefile
Date: Sat, 18 Apr 2015 22:34:37 +0200
Message-Id: <1429389280-18720-1-git-send-email-jolsa@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaldo Carvalho de Melo <acme@kernel.org>
Cc: Borislav Petkov <bp@suse.de>, Brian Norris <computersforpeace@gmail.com>, David Ahern <dsahern@gmail.com>, David Howells <dhowells@redhat.com>, Ingo Molnar <mingo@kernel.org>, Michal Marek <mmarek@suse.cz>, Namhyung Kim <namhyung@kernel.org>, Paul Mackerras <paulus@samba.org>, Peter Zijlstra <a.p.zijlstra@chello.nl>, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, lkml <linux-kernel@vger.kernel.org>

hi,
sending tools/Makefile fixes discussed in here:
  http://marc.info/?t=142250693600001&r=1&w=2

thanks,
jirka
---
Jiri Olsa (3):
      tools build: No need to make libapi for perf explicitly
      tools build: Fix Makefile(s) to properly invoke tools build
      perf tests: Add build tests for building perf from kernel source root and tools

 Makefile              |  5 ++---
 tools/Makefile        | 20 +++++++++++++++-----
 tools/perf/tests/make | 14 +++++++++++++-
 3 files changed, 30 insertions(+), 9 deletions(-)
