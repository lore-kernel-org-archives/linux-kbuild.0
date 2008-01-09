Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:60888 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753067AbYAIT56 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Jan 2008 14:57:58 -0500
Date: Wed, 9 Jan 2008 20:58:00 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: kbuild.git rebased
Message-ID: <20080109195800.GA7304@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild <linux-kbuild@vger.kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>

I have just rebased kbuild.git.
Content at the moment is:

Adrian Bunk (1):
      Remove references to "make dep"

Andi Kleen (3):
      kbuild: declare the modpost error functions as printf like
      kbuild: fix format string warnings in modpost
      kbuild: fix a buffer overflow in modpost

Andreas Mohr (1):
      kbuild: eradicate bashisms in scripts/patch-kernel

Andres Salomon (1):
      kconfig: use getopt() in conf.c for handling command line arguments

Aron Griffis (1):
      kbuild: support mercurial in setlocalversion

Geert Uytterhoeven (1):
      kbuild: Add missing srctree prefix for includecheck and versioncheck

Jan Engelhardt (1):
      kconfig: allow overriding symbols

Johannes Berg (7):
      kernel-doc: fix xml output mode
      kernel-doc: init kernel version
      kernel-doc: single DOC: selection
      kernel-doc: process functions, not DOC:
      kernel-doc: use no-doc option
      kernel-doc: new P directive for DOC: sections
      convert drivers/base/power/Makefile to ccflags

Josh Boyer (3):
      kbuild: merge mkubootimg tool for building U-Boot images
      kbuild: rework arch specific Makefiles to use mkubootimg
      Remove mkuboot.sh script

Ladislav Michl (3):
      kconfig: make kconfig MinGW friendly
      kconfig: fix whitespace and sort includes in conf.c
      kconfig: use C89 random functions in conf.c

Mike Frysinger (1):
      kbuild: fixup genksyms usage/getopt

Randy Dunlap (2):
      kbuild: add 'includecheck' help text
      kconfig: add hints/tips/tricks to Documentation/kbuild/kconfig-language.txt

Robert P. J. Day (2):
      Kbuild: Clarify the rpm-related make packaging targets
      A few corrections to include/linux/Kbuild

Sam Ravnborg (7):
      kbuild: document versioncheck in make help
      kconfig: if ncurses-devel is missing then say so
      kbuild: fix buglet in gcc-version.sh
      kbuild: ignore *.order files
      kbuild: fix installing external modules
      kconfig: rename E_OR & friends to avoid name clash
      kconfig: delete unused FILE_ and SYMBOL_ flags

Tejun Heo (1):
      kbuild: implement modules.order

Theodore Ts'o (3):
      kbuild: change CONFIG_LOCALVERSION_AUTO to use a git-describe-ish format
      kbuild: fix scripts/setlocalversion to avoid erroneous -dirty tag
      kbuild: fix false positive -dirty tag caused by make-kpkg

Uwe Kleine-König (1):
      kbuild: ignore cache modifiers for generating the tags files

Vegard Nossum (1):
      aic7(3*x): fix firmware build

WANG Cong (5):
      MIPS: Remove 'TOPDIR' from Makefiles
      CRIS: Remove 'TOPDIR' from Makefiles
      INFINIBAND: Remove 'TOPDIR' from Makefiles
      FRV: Drop 'TOPDIR' from Makefiles
      FS: Remove dead code

