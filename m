Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:33391 "EHLO
	asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754825AbaEKHbi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 11 May 2014 03:31:38 -0400
Date: Sun, 11 May 2014 09:31:22 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Searching for insight into lib-y and lib-m
Message-ID: <20140511073121.GA31169@ravnborg.org>
References: <20140511022458.12073.qmail@ns.horizon.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140511022458.12073.qmail@ns.horizon.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: George Spelvin <linux@horizon.com>
Cc: linux-kbuild@vger.kernel.org, tj@kernel.org

Hi George.

> I'm working on a patch to factor out some useful helper code
> (specifically, the glob_match() function) from drivers/ata/libata-core.c
> to a separate file lib/glob.c, so other drivers can use it.  But I'm
> having a hard time figuring out how to arrange for every caller to be
> able to call it.
> 
> In particular, suppose that CONFIG_ATA=m.  I'm trying to figure out
> what the various options I have are for handling my new option CONFIG_GLOB.
> 
> Here are the four basic possibilities (all combined with "select GLOB"
> by ATA):
> 
> 1) bool GLOB; obj-$(CONFIG_GLOB) += glob.o
> 
> I think this will atatically link the glob.o code into the kernel if
> CONFIG_ATA=y or CONFIG_ATA=m.  So everything will work, but there's no
> way for an out-of-tree driver to depend on the code if CONFIG_ATA=n.
> (Not supporting that case for now is definitely an option.)A
This is the typical way to solve this problem.
If you prepare your kernel for using a module that uses glob.c then
you pull in the required function in lib.
If out-of-tree modles has problems with this solution they
can fix this by becoming in-tree modules (via staging for example).

> 2) tristate GLOB; obj-$(CONFIG_GLOB) += glob.o
> 
> In this case, if CONFIG_ATA=m, I'll create a separate module glob.ko.
> I'd need to include <linux/module.h> and add the appropriate module
> declarations to glob.c.  Lots of code in lib/ seems to do this, but a
> proliferation if microscopic modules is annoying
This is overkill for glob.c

> 3) bool GLOB; lib-$(CONFIG_GLOB) += glob.o
> 
> This is where I get confused.  Documentation/kbuild/makefiles.txt says
> that glob.o will be included in the library lib.a.
> 
> But it then doesn't say anything about what (if anything) is linked
> against lib.a.  I assume (although it's not actually stated) that vmlinux
> is linked against it, so the linker will import any called functions.
This feature is made to support generic implmentations where the
architecture can provide there own implmentation.
This is not for drivers to use - becasue this prevents modles from being
loaded as you also conclude.

> 4) tristate GLOB; lib-$(CONFIG_GLOB) += glob.o
> 
> Documentation/kbuild/makefiles.txt suggests that CONFIG_GLOB=m would
> be synonymous with CONFIG_GLOB=y in this case, so the net effect would
> be identical to case 3.  Am I right?
Right

> The follow-on question is how to integrate the self-test code.  I had defined
> a preprocessor symbol which allowed a standalone "gcc -DUNITTEST glob.c" to
> make a user-space test driver, but I've been asked to kernelize it.  If using
> the full module route, I can just use __init code for it, like lib/list_sort.c.
> But for other options, its less clear.
Take a look at tools/testing/selftest - this should be the best "kernel" way to do this.

	Sam
