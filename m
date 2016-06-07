Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36505 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932163AbcFGVwl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 7 Jun 2016 17:52:41 -0400
Date: Tue, 7 Jun 2016 23:52:37 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: Regression in "kbuild: fix if_change and friends to consider
 argument order"
Message-ID: <20160607215237.GA13237@sepie.suse.cz>
References: <1465263518.3885.9.camel@intel.com>
 <5756960E.5020706@suse.com>
 <57569ACC.8050503@suse.cz>
 <CAK7LNARPUqD9BY5p-=M49KkQM7+j0bVFBX2On_rqdJjRs=zeTQ@mail.gmail.com>
 <5756A675.3080003@suse.cz>
 <CAK7LNAS4228scb3Ep1MT_FZhHS_+ckJCJZSDT-TN9hcvJ7Wq0A@mail.gmail.com>
 <1465308627.3885.61.camel@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1465308627.3885.61.camel@intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Cc: "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>, "mmarek@suse.cz" <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "nicolas.pitre@linaro.org" <nicolas.pitre@linaro.org>

On Tue, Jun 07, 2016 at 02:10:28PM +0000, Zanoni, Paulo R wrote:
> I tested both patches you provided:
>  - kbuild: do not append NOSTDINC_FLAGS to avoid rebuild in package
> targets
>  - kbuild: Initialize NOSTDINC_CFLAGS
> 
> Both seem to improve the situation to a point where, at least for a
> tinyconfig, timings are acceptable. But it's important to notice that
> none of the changes are equivalent to just reverting the first bad
> commit. We still recompile some additional files that were not compiled
> with the full revert. Let me show you:

[...]

> So after some grepping, I tried to also initialize LDFLAGS_vmlinux, in
> the same way you did with NOSTDINC_FLAGS, and it fixed the problem for
> me:

Good catch! I my tests, I was interrupting the build early and only
checking the content of kernel/.bounds.s.cmd; lazy me :). I'm going to
apply the patch below to kbuild.git#rc-fixes.


> I also wondered that maybe we need to also initialize
> KBUILD_LDFLAGS_MODULE, but it seems what fixed the problem was just
> LDFLAGS_vmlinux. So I'm not sure if we'll need this. I also have no
> idea whether this would cause other unintended regressions. It's up to
> you, Makefile maintainers, to judge. 

I did check the += assignments now and I only see

$ awk '/\+=/ { print $1 }' Makefile  | sort -u | while read v; do grep
-m1 "$v" Makefile; done | grep '+='
CLEAN_DIRS  += $(MODVERDIR)
MAKEFLAGS += -rR --include-dir=$(CURDIR)
MRPROPER_DIRS  += include/config usr/include include/generated
\
MRPROPER_FILES += .config .config.old .version .old_version \

The MAKEFLAGS assignment is correct, the CLEAN_DIRS and MRPROPER_*
+= assignments are unnecessary, but none of these variables is exported.
So we are fine _with respect to the main Makefile_. It's possible that
e.g. some arch Makefile has a skeleton in the cupboard. We will see.

Michal


From b36fad65d61fffe4b662d4bfb1ed673c455a36a2 Mon Sep 17 00:00:00 2001
From: Michal Marek <mmarek@suse.com>
Date: Tue, 7 Jun 2016 11:57:02 +0200
Subject: [PATCH] kbuild: Initialize exported variables

The NOSTDINC_FLAGS variable is exported, so it needs to be cleared to
avoid duplicating its content when running make from within make (e.g.
in the packaging targets). This became an issue after commit
9c8fa9bc08f6 ("kbuild: fix if_change and friends to consider argument
order"), which no longer ignores the duplicate options. As Paulo Zanoni
points out, the LDFLAGS_vmlinux variable has the same problem.

Reported-by: "Zanoni, Paulo R" <paulo.r.zanoni@intel.com>
Fixes: 9c8fa9bc08f6 ("kbuild: fix if_change and friends to consider argument order")
Signed-off-by: Michal Marek <mmarek@suse.com>
---
 Makefile | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Makefile b/Makefile
index 0f70de63cfdb..af0c463e908f 100644
--- a/Makefile
+++ b/Makefile
@@ -363,11 +363,13 @@ CHECK		= sparse
 
 CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
 		  -Wbitwise -Wno-return-void $(CF)
+NOSTDINC_FLAGS  =
 CFLAGS_MODULE   =
 AFLAGS_MODULE   =
 LDFLAGS_MODULE  =
 CFLAGS_KERNEL	=
 AFLAGS_KERNEL	=
+LDFLAGS_vmlinux =
 CFLAGS_GCOV	= -fprofile-arcs -ftest-coverage -fno-tree-loop-im -Wno-maybe-uninitialized
 CFLAGS_KCOV	= -fsanitize-coverage=trace-pc
 
-- 
2.6.2

