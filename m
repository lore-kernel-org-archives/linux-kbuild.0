Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:60187 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751033Ab2AUMed (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 21 Jan 2012 07:34:33 -0500
Date: Sat, 21 Jan 2012 13:34:15 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: details on internal kbuild magic
Message-ID: <20120121123415.GA22266@merkur.ravnborg.org>
References: <201201180713.41922.vapier@gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <201201180713.41922.vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

Hi Mike.

On Wed, Jan 18, 2012 at 07:13:41AM -0500, Mike Frysinger wrote:
> i've been flipping through the source but haven't made much headway.  the 
> documentation doesn't really cover kbuild internals, so that didn't help.  
> hopefully someone here can point me in the right direction.
> 
> i'm interested in the exact make mechanics that kbuild utilizes to avoid make 
> recursion (`make -C`) but while supporting its own include recursion.
> 
> for example, fs/Makefile has lines like:
> 	obj-y += ramfs/
> where is the logic that parses $(obj-y) and knows that it needs to recursively 
> include ramfs/Makefile ?

When the 'core' part of kbuild is started then this is done using:

	$(Q)$(MAKE) -f scripts/Makefile.build obj=$@

Where obj is the directory which contains the files to be build.
In your example obj=fs

Makefile.build will include the following files:
-include include/config/auto.conf    <= The configuration (CONFIG_ symbols)
include scripts/Kbuild.include       <= core Kbuild stuff
include $(obj)/Makefile              <= the ramfs Makefile
include scripts/Makefile.lib         <= additional kbuild stuff required after ramfs file include


In Makefile.lib we append built-in.o to $(obj-y) and we prefix with $(obj)
so we end up with:
obj-y == fs/ramfs/built-in.o

Later we add a dependency like this:

    fs/built-in.o: fs/ramfs/built-in.o

    It looks like this in Makefile.build:

    $(builtin-target): $(obj-y) FORCE
            $(call if_changed,link_o_target)


So make knows it need to build fs/ramfs/built-in.o first.

In Makefile.lib we build up a list of .o files which does not
live in the current directory in $(subdir-obj-y)

And in Makefile.build we tell make to visit the subdirs to build these files using:
    # To build objects in subdirs, we need to descend into the directories
    $(sort $(subdir-obj-y)): $(subdir-ym) ;

    PHONY += $(subdir-ym)
    $(subdir-ym):
            $(Q)$(MAKE) $(build)=$@


So make will visit fs/ and see that it needs to visit fs/ramfs/ before
if can link fs/built-in.o

Simple - no?
Hope this helps.

	Sam
