Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:48511 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751142AbYBTUBP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Feb 2008 15:01:15 -0500
Date: Wed, 20 Feb 2008 21:01:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: rebuilding object files from asm files
Message-ID: <20080220200125.GF21139@uranus.ravnborg.org>
References: <200802201912.00091.ak@suse.de> <20080220191602.GA21139@uranus.ravnborg.org> <47BC84BC.6010303@suse.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <47BC84BC.6010303@suse.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@suse.de>
Cc: linux-kbuild@vger.kernel.org

On Wed, Feb 20, 2008 at 08:51:24PM +0100, Andi Kleen wrote:
> 
> > So building head_64.o requires a visit of all directories listed
> > in vmlinux-dirs before it can build head_64.o.
> > 
> > I do not see any clean way to fix this :-(
> 
> I see. Thanks for the investigation. If it only affects head_64.S
> I guess it is not so bad.

All of:
head-y                := arch/x86/kernel/head_$(BITS).o
head-$(CONFIG_X86_64) += arch/x86/kernel/head64.o
head-y                += arch/x86/kernel/init_task.o

But thats limited anyway.

	Sam
