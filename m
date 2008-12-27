Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:45718 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750963AbYL0VmP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Dec 2008 16:42:15 -0500
Date: Sat, 27 Dec 2008 22:43:49 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: add a piece of code to each module
Message-ID: <20081227214349.GA16901@uranus.ravnborg.org>
References: <1230277739.4780.9.camel@sli10-desk.sh.intel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1230277739.4780.9.camel@sli10-desk.sh.intel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Shaohua Li <shaohua.li@intel.com>
Cc: linux-kbuild@vger.kernel.org

On Fri, Dec 26, 2008 at 03:48:59PM +0800, Shaohua Li wrote:
> Hi,
> I'm now porting dyn ftrace to IA64. To make modules work, I must add a
> piece of code (trampoline code) to each module. I can't add the
> trampoline code in module load, because at that time, only PLT
> trampoline code can be added, and that code isn't ok for ftrace. I
> wonder if this can be done in kbuild. If yes, how can I do it?

Powerpc does something remotely similar.
In their arch Makefile they have:

LDFLAGS_MODULE  += arch/powerpc/lib/crtsavres.o


But there is some issues with it.
If you do a plain "make modules" then arch/powerpc/lib/crtsavres.o is not
built and module link fails.
There is IIRC also some issues with external modules.

Anohter option could be to add the code to the module.mod.c file
that modpost generates.
But if we go that route we have to do it in some generic way so
all archs can benefit from it.

I hope this is to some help...

	Sam
