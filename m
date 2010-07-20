Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp1.linux-foundation.org ([140.211.169.13]:58737 "EHLO
	smtp1.linux-foundation.org" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S932072Ab0GTWYB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 20 Jul 2010 18:24:01 -0400
Message-Id: <201007202223.o6KMNRpV021360@imap1.linux-foundation.org>
Subject: [patch 1/1] kbuild: fix CONFIG_CROSS_COMPILE issue in .config
From: akpm@linux-foundation.org
Date: Tue, 20 Jul 2010 15:23:27 -0700
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: mmarek@suse.cz
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org, tiago.maluta@gmail.com

From: Tiago Maluta <tiago.maluta@gmail.com>

Linux has an recent option to define CROSS_COMPILE in menuconfig.

Typically, one of the options when building for another target is
('arm' is just an example):

# make ARCH=arm CROSS_COMPILE=arm-cc O=../build

If I omit CROSS_COMPILE and use the new way in .config:
CONFIG_CROSS_COMPILE="arm-cc"

I got:

   cc1: error: unrecognized command line option "-mlittle-endian"
   cc1: error: unrecognized command line option "-mabi=aapcs-linux"
   cc1: error: unrecognized command line option "-mno-thumb-interwork"
   /usr/src/linux/kernel/bounds.c:1: error: bad value (armv5t) for -march= switch
   /usr/src/linux/kernel/bounds.c:1: error: bad value (armv5t) for -mtune= switch
   make[2]: *** [kernel/bounds.s] Error 1
   make[1]: *** [prepare0] Error 2
   make: *** [sub-make] Error 2

Verbose output clearly says that I'm using the host compiler instead cross
compiler.  This patch fixed my problem.

Cc: Michal Marek <mmarek@suse.cz>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---

 Makefile |    2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff -puN Makefile~kbuild-fix-config_cross_compile-issue-in-config Makefile
--- a/Makefile~kbuild-fix-config_cross_compile-issue-in-config
+++ a/Makefile
@@ -190,7 +190,7 @@ SUBARCH := $(shell uname -m | sed -e s/i
 export KBUILD_BUILDHOST := $(SUBARCH)
 ARCH		?= $(SUBARCH)
 CROSS_COMPILE	?=
-CROSS_COMPILE	?= $(CONFIG_CROSS_COMPILE:"%"=%)
+CROSS_COMPILE	:= $(shell grep CONFIG_CROSS_COMPILE .config | cut -d'"' -f2)
 
 # Architecture as present in compile.h
 UTS_MACHINE 	:= $(ARCH)
_
