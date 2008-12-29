Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga11.intel.com ([192.55.52.93]:62585 "EHLO mga11.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750874AbYL2Bbq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 28 Dec 2008 20:31:46 -0500
Date: Mon, 29 Dec 2008 09:31:45 +0800
From: Shaohua Li <shaohua.li@intel.com>
Subject: Re: add a piece of code to each module
Message-ID: <20081229013144.GA21080@sli10-desk.sh.intel.com>
References: <1230277739.4780.9.camel@sli10-desk.sh.intel.com> <20081227214349.GA16901@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20081227214349.GA16901@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

On Sun, Dec 28, 2008 at 05:43:49AM +0800, Sam Ravnborg wrote:
> On Fri, Dec 26, 2008 at 03:48:59PM +0800, Shaohua Li wrote:
> > Hi,
> > I'm now porting dyn ftrace to IA64. To make modules work, I must add a
> > piece of code (trampoline code) to each module. I can't add the
> > trampoline code in module load, because at that time, only PLT
> > trampoline code can be added, and that code isn't ok for ftrace. I
> > wonder if this can be done in kbuild. If yes, how can I do it?
> 
> Powerpc does something remotely similar.
> In their arch Makefile they have:
> 
> LDFLAGS_MODULE  += arch/powerpc/lib/crtsavres.o
> 
> 
> But there is some issues with it.
> If you do a plain "make modules" then arch/powerpc/lib/crtsavres.o is not
> built and module link fails.
> There is IIRC also some issues with external modules.
> 
> Anohter option could be to add the code to the module.mod.c file
> that modpost generates.
> But if we go that route we have to do it in some generic way so
> all archs can benefit from it.
I'm thinking of this kind of approach too. We need link a .S file
instead of .c file, looks ppc adds a .S file too. I managed to figure
out an implementation, but kbuild is out of my knowledge. Could
kbuild team help on this, clearly there are two archs require this?

Thanks,
Shaohua
