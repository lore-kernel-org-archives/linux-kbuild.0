Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.10.76.45]:46958 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751834AbYAZECn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Jan 2008 23:02:43 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
Date: Sat, 26 Jan 2008 15:01:55 +1100
References: <20080124215813.GA4204@uranus.ravnborg.org> <200801251419.09999.rusty@rustcorp.com.au> <47995788.3000402@gmail.com>
In-Reply-To: <47995788.3000402@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain;
  charset="utf-8"
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
Message-Id: <200801261501.56198.rusty@rustcorp.com.au>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tejun Heo <htejun@gmail.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>, Jon Masters <jonathan@jonmasters.org>

On Friday 25 January 2008 14:29:12 Tejun Heo wrote:
> Rusty Russell wrote:
> > On Friday 25 January 2008 09:02:53 Sam Ravnborg wrote:
> >> From: Tejun Heo <htejun@gmail.com>
> >>
> >> When driver modules are loaded by udev, what comes first in
> >> modules.alias file is selected.
> >
> > Actually, I had occasion to look at this the other day, and in the
> > modprobe version here every match is selected.
>
> What do you mean by "every match is selected"?

(I really can't tell if you're being facecious here, or you really don't know 
this, so I'll assume the latter...)

modules.alias contains wildcards for what devices this module might match, eg.

alias pci:v00008086d00002829sv*sd*bc*sc*i* ahci

modprobe gets called to insert 
eg 'pci:v00008086d00002829sv000017AAsd000020A7bc01sc06i01'.

After finding nothing in the normal config files, it looks for all matches in 
modules.alias, and inserts all those modules in the kernel.

> > And they'll be loaded in reverse order of the module.alias file.
>
> What do you mean by 'loaded'?

I mean modprobe loads the moduled into the kernel.  Each module is loaded into 
memory, then sys_init_module() called to load the module, with args chosen 
from the modprobe.conf/modprobe.d files.

> > Looks like Jon's latest git tree does the same.
> >
> > So, what does this patch actually fix?
>
> This patch makes kbuild generate modules.order and another patch makes
> depmod generate modules.alias or whatever else according to the order
> specified in modules.order, so that modprobe prefer modules which is
> earlier in the linking order.

That's what the patch does, and you've explained that clearly multiple times.

But I can only ask again, "what does this patch actually fix?".  ie. what 
system got messed up because of the current behaviour?  Where's the problem 
we're fixing?  This might fix it as a side effect, but let's try harder than 
that, OK?

> So, are you saying that modprobe chooses modules in the reverse order of
> modules.alias file?

That is precisely what I'm saying, and more.

Rusty.
