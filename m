Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ns.horizon.com ([71.41.210.147]:15520 "HELO ns.horizon.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with SMTP
	id S1751983AbaEKCbl (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 10 May 2014 22:31:41 -0400
Date: 10 May 2014 22:24:58 -0400
Message-ID: <20140511022458.12073.qmail@ns.horizon.com>
From: "George Spelvin" <linux@horizon.com>
Subject: Searching for insight into lib-y and lib-m
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux@horizon.com, tj@kernel.org

I'm working on a patch to factor out some useful helper code
(specifically, the glob_match() function) from drivers/ata/libata-core.c
to a separate file lib/glob.c, so other drivers can use it.  But I'm
having a hard time figuring out how to arrange for every caller to be
able to call it.

In particular, suppose that CONFIG_ATA=m.  I'm trying to figure out
what the various options I have are for handling my new option CONFIG_GLOB.

Here are the four basic possibilities (all combined with "select GLOB"
by ATA):

1) bool GLOB; obj-$(CONFIG_GLOB) += glob.o

I think this will atatically link the glob.o code into the kernel if
CONFIG_ATA=y or CONFIG_ATA=m.  So everything will work, but there's no
way for an out-of-tree driver to depend on the code if CONFIG_ATA=n.
(Not supporting that case for now is definitely an option.)

2) tristate GLOB; obj-$(CONFIG_GLOB) += glob.o

In this case, if CONFIG_ATA=m, I'll create a separate module glob.ko.
I'd need to include <linux/module.h> and add the appropriate module
declarations to glob.c.  Lots of code in lib/ seems to do this, but a
proliferation if microscopic modules is annoying.

3) bool GLOB; lib-$(CONFIG_GLOB) += glob.o

This is where I get confused.  Documentation/kbuild/makefiles.txt says
that glob.o will be included in the library lib.a.

But it then doesn't say anything about what (if anything) is linked
against lib.a.  I assume (although it's not actually stated) that vmlinux
is linked against it, so the linker will import any called functions.

But if CONFIG_ATA=m, presumably the linker won't import glob_match().
What then will happen if ata.ko is loaded?  Does it get linked statically
against lib.a at module build time?  Or will module loading just fail?
Looking at the output of "make V=1 modules", I don't see any .a files
mentioned.

Is there some other magic I don't understand that will make it work?

The static linking would be nice; although that would result in code
duplication if multiple modules used the code, the code is awfully
small (658 bytes of text) and it would take a lot of modules to make it
a problem.

As to what this would do to out-of-tree drivers, I have no idea...

4) tristate GLOB; lib-$(CONFIG_GLOB) += glob.o

Documentation/kbuild/makefiles.txt suggests that CONFIG_GLOB=m would
be synonymous with CONFIG_GLOB=y in this case, so the net effect would
be identical to case 3.  Am I right?


May I humbly beg some guidance as to the best way to proceed?  My current code
takes option 2 and builds its own module if CONFIG_ATA=m, but people are asking if
that's really necessary.

(v1 patch at https://lkml.org/lkml/2014/5/9/663 if anyone wants more details.)

The follow-on question is how to integrate the self-test code.  I had defined
a preprocessor symbol which allowed a standalone "gcc -DUNITTEST glob.c" to
make a user-space test driver, but I've been asked to kernelize it.  If using
the full module route, I can just use __init code for it, like lib/list_sort.c.
But for other options, its less clear.
