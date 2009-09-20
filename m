Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:47111 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752372AbZITOku (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 20 Sep 2009 10:40:50 -0400
Subject: Re: Feedback on "kbuild: generate modules.builtin"
From: Steven Rostedt <rostedt@goodmis.org>
Reply-To: rostedt@goodmis.org
In-Reply-To: <20090920132856.GA26845@merkur.ravnborg.org>
References: <200909181949.n8IJnT4R019097@imap1.linux-foundation.org>
	 <20090920132856.GA26845@merkur.ravnborg.org>
Content-Type: text/plain
Date: Sun, 20 Sep 2009 10:40:52 -0400
Message-Id: <1253457652.20020.630.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: akpm@linux-foundation.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org, JBeulich@novell.com, lkml <linux-kernel@vger.kernel.org>

On Sun, 2009-09-20 at 15:28 +0200, Sam Ravnborg wrote:
> On Fri, Sep 18, 2009 at 12:49:29PM -0700, akpm@linux-foundation.org wrote:
> > From: Michal Marek <mmarek@suse.cz>
> > 
> > To make it easier for tools like mkinitrd to detect whether a needed
> > module is missing or whether it is compiled into the kernel, install a
> > modules.builtin file listing all modules built into the kernel.  This is
> > done by generating an alternate config file with all tristate =y options
> > set to =Y and reading the makefiles with this config included.  The built
> > in modules then appear in obj-Y.
> 
> Hi Michael.
> 
> [Added Steven on cc: as he had done some kconfig
>  hacking lately].

Thanks!

> 
> Got some time (finally) to look at this.

Unfortunately, I'm about to leave for two weeks. I got LinuxCon and
LinuxPlumbers to present at in Portland, then I fly off to Dresden
Germany to present at OSADL conference there. So I wont have anytime to
look at this until I'm done with these.

But please, keep me posted on any changes like this.

Thanks,

-- Steve


> I understand the functionality and I have myself had the need
> to see builtin modules.
> 
> As for the implmentation I have a few comments.


