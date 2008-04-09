Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from michael.checkpoint.com ([194.29.32.68]:51993 "EHLO
	michael.checkpoint.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751928AbYDIOt4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Apr 2008 10:49:56 -0400
Received: from [91.90.139.95] (localhost [127.0.0.1])
	by michael.checkpoint.com (8.12.10+Sun/8.12.10) with ESMTP id m39EIvfU004874
	for <linux-kbuild@vger.kernel.org>; Wed, 9 Apr 2008 17:18:57 +0300 (IDT)
Message-ID: <47FCD046.4060706@checkpoint.com>
Date: Wed, 09 Apr 2008 17:18:46 +0300
From: Anatoli Tubman <anatolit@checkpoint.com>
MIME-Version: 1.0
Subject: Combining several subdirectories into a single loadable module
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org

Hi all!

Sorry if this question is stupid, I'm new to this whole kbuild thing.

I have a kernel module with source scattered over several directories,
with a separate set of specific compilation flags for each directory.
How do I write Makefiles for it, assuming in-tree compilation?

Here's the situation in detail. Suppose I have this directory structure:

mymodule
mymodule/subdir1
mymodule/subdir1/source11.c
mymodule/subdir1/source12.c
...
mymodule/subdir1/source1N.c
mymodule/subdir2
mymodule/subdir2/source21.c
mymodule/subdir2/source22.c
...
mymodule/subdir2/source2M.c
...
mymodule/subdirK/sourceKL.c

Each subdirI needs to have its own Makefile with its own EXTRA_CFLAGS,
and all .o files created in subdirectories need be combined into single
mymodule.ko. How do I do that? There are no examples in the
documentation, nor in the kernel source.

The question could be subdivided in two.

1. How do I tell the build system to compile sourceIJ.c and then leave
   sourceIJ.o alone (do not include in the kernel, do not build a .ko)?

2. Given a set of already built sourceIJ.o files, how do I tell the
   build system to combine them into a single .ko without trying to
   compile the corresponding sources first? If I say something like

      mymodule-objs := subdir1/source11.o (etc)

   in mymodule/Makefile, the build system will try to compile
   subdir1/source11.c *with mymodule/Makefile*, which is wrong (I need
   it to be done with mymodule/subdir1/Makefile).

I also tried to build libraries (.a archives) instead of using
sourceIJ.o directly, but without success.

I tried to understand scripts/Makefile.build but it only gave me a
headache...

Regards
-- 
Anatoli Tubman
Connectra performance and infrastructure
Check Point Software Technologies
