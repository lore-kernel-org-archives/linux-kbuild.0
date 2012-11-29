Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ezexch.ezchip.com ([212.179.42.101]:32233 "EHLO
	ezexch.ezchip.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751553Ab2K2LAQ convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Nov 2012 06:00:16 -0500
From: Noam Camus <noamc@ezchip.com>
Date: Thu, 29 Nov 2012 12:59:42 +0200
Subject: RE: Makefile race between jobs
Message-ID: <264C179F799EF24AB26D5319053335E80CC315EC6F@ezexch.ezchip.com>
References: <264C179F799EF24AB26D5319053335E80CC3049A10@ezexch.ezchip.com>
 <264C179F799EF24AB26D5319053335E80CC3049A11@ezexch.ezchip.com>
In-Reply-To: <264C179F799EF24AB26D5319053335E80CC3049A11@ezexch.ezchip.com>
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 8BIT
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "mmarek@suse.cz" <mmarek@suse.cz>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "torvalds@linux-foundation.org" <torvalds@linux-foundation.org>, Noam Camus <noamc@ezchip.com>

Hello Michal,

Below is my patch for dealing with race between 2 jobs of main Makefile.
This is the third time I try to get any response from you.
Will appreciate your comment.

From 697f6ffa0d67b676fc2d75f65541c6e12108829d Mon Sep 17 00:00:00 2001
From: Noam Camus <noamc@ezchip.com>
Date: Fri, 16 Nov 2012 15:12:48 +0200
Subject: [PATCH] Makefile: solve race between make jobs.

Fix occasionally compilation failures when source tree is distcleaned.
The compilation is failing over file scripts/mod/empty.c

The error is because empty.o depends on some headers from:
         arch/<arch>/include/generated/asm/

I see that there is a race between two targets in main Makefile (j=2):
        1) asm-generic
        2) scripts_basic

asm-generic:
        generates all wrappers in arch/<arch>/include/generated/asm/

scripts_basic:
        calls scripts/Makefile.build
        --> performs target __build
                --> depends on targets defined at variable $(always)
                        --> compile scripts/mod/empty.c

Occasionally compilation of empty.c starts before all its required headers created by asm-generic are available.

This dependency will make sure that this situation can not happen.

Signed-off-by: Noam Camus <noamc@ezchip.com>
---
 Makefile |    2 +-
 1 files changed, 1 insertions(+), 1 deletions(-)

diff --git a/Makefile b/Makefile
index 5be2ee8..00330a1 100644
--- a/Makefile
+++ b/Makefile
@@ -415,7 +415,7 @@ export RCS_TAR_IGNORE := --exclude SCCS --exclude BitKeeper --exclude .svn \

 # Basic helpers built in scripts/
 PHONY += scripts_basic
-scripts_basic:
+scripts_basic: asm-generic
        $(Q)$(MAKE) $(build)=scripts/basic
        $(Q)rm -f .tmp_quiet_recordmcount

--
1.7.1

Noam Camus
