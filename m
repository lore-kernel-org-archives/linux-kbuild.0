Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:34788 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727368AbfCROnk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Mar 2019 10:43:40 -0400
From: David Howells <dhowells@redhat.com>
Subject: Commit seems to prevent use of GNUmakefile wrappers
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-ID: <23499.1552920217.1@warthog.procyon.org.uk>
Content-Transfer-Encoding: 8BIT
Date: Mon, 18 Mar 2019 14:43:37 +0000
Message-ID: <23500.1552920217@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: dhowells@redhat.com, Liz Zhang <lizzha@microsoft.com>, Lili Deng <v-lide@microsoft.com>, Manoj Srivastava <srivasta@debian.org>, torvalds@linux-foundation.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi Mashiro,

	commit 2b50f7ab63685cd247e32ad321f7338ed130d3d5
	Author: Masahiro Yamada <yamada.masahiro@socionext.com>
	kbuild: add workaround for Debian make-kpkg

seems to prevent the use of GNUmakefile wrappers to set the ARCH and
CROSS_COMPILE make variables.  With this commit, I now see:

	make: Entering directory '/data/fs/linux-fs'
	Makefile:39: Do not include top Makefile of Linux Kernel
	***
	*** Configuration file ".config" not found!
	***
	*** Please run some configurator (e.g. "make oldconfig" or
	*** "make menuconfig" or "make xconfig").
	***
	Makefile:605: include/config/auto.conf: No such file or directory
	make: *** No rule to make target '.config', needed by 'include/config/auto.conf'.  Stop.
	make: Leaving directory '/data/fs/linux-fs'

Do you have a suggestion as to how to work around this?  Here's a sample
GNUmakefile content:

	CROSS_COMPILE	:= x86_64-linux-gnu-
	ARCH		:= x86_64
	MFLAGS		+= CROSS_COMPILE=$(CROSS_COMPILE) ARCH=$(ARCH)
	export CROSS_COMPILE
	export ARCH
	include Makefile

David
