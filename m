Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:52635 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755569AbYBTTPw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Feb 2008 14:15:52 -0500
Date: Wed, 20 Feb 2008 20:16:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: rebuilding object files from asm files
Message-ID: <20080220191602.GA21139@uranus.ravnborg.org>
References: <200802201912.00091.ak@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200802201912.00091.ak@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@suse.de>
Cc: linux-kbuild@vger.kernel.org

Hi Andi.

On Wed, Feb 20, 2008 at 07:12:00PM +0100, Andi Kleen wrote:
> 
> Here's a small kbuild quirk I noticed on 2.6.25rc2. I tried to rebuild
> the obj file of a assembler file (.S) with make path/to/file.o.
> 
> Normally when I do this for .o file only its dependencies and 
> and the object file are built as I expect.
> 
> But with an assembler file (like arch/x86/kernel/head_64.o) kbuild
> starts to rebuild everything. 

Took a look at this.
You will notice that there is a difference in the behaviour
betweet arch/x86/kernel/entry_64.o and head_64.o from same dir.
For entry_64.o it works as expected.

The 'problem' is that kbuild when deciding to use the rule:
%.o: %.S prepare scripts FORCE
        $(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)

Already have done most of the work and mainly is has defined
the dependencies for vmlinux.
As head_64.o is listed in $(head-y) kbuild do as
told in following rule:

Note: vmlinux-init is equal to $(head-y) + $(init-y)

# The actual objects are generated when descending,
# make sure no implicit rule kicks in
$(sort $(vmlinux-init) $(vmlinux-main)) $(vmlinux-lds): $(vmlinux-dirs) ;

So building head_64.o requires a visit of all directories listed
in vmlinux-dirs before it can build head_64.o.

I do not see any clean way to fix this :-(

	Sam
