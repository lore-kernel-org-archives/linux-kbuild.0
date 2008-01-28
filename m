Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wa-out-1112.google.com ([209.85.146.183]:46328 "EHLO
	wa-out-1112.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752449AbYA1Bpa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 27 Jan 2008 20:45:30 -0500
Received: by wa-out-1112.google.com with SMTP id v27so2669930wah.23
        for <linux-kbuild@vger.kernel.org>; Sun, 27 Jan 2008 17:45:30 -0800 (PST)
Message-ID: <479D33B3.6010707@gmail.com>
Date: Mon, 28 Jan 2008 10:45:23 +0900
From: Tejun Heo <htejun@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
References: <20080124215813.GA4204@uranus.ravnborg.org> <200801261501.56198.rusty@rustcorp.com.au> <479AB57D.3080805@gmail.com> <200801262025.59593.rusty@rustcorp.com.au>
In-Reply-To: <200801262025.59593.rusty@rustcorp.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>, Jon Masters <jonathan@jonmasters.org>

Hello,

Rusty Russell wrote:
>> There was a non-deterministic behavior involving ata_piix and ahci
>> drivers on ich6.  Both drivers support the chipset but ata_piix is less
>> capable while ahci might misbehave (chip bug).  Generally, ahci should
>> be preferred as it seems the problem cases seem to be rare.  When
>> drivers are linked in, this is forced by link order.
> 
> Right.  Nasty.  This is currently dealt with by blacklisting the lesser 
> driver; if that's wrong, blacklist the other one (blacklisting means that 
> aliases can't pull it in, it needs to be modprobed by name).  That kind of 
> sucks because it's not under kernel control and the distros have to do it, 
> but that's how it's always been.

In SUSE, it's dealt with by having a rudimentary module priority in
initrd.  User can select which driver to use for which controller with
the configuration tool, which mostly works but the configuration can't
be enforced if there are multiple controllers which can be driven by
more than one drivers (the first one grabs them all).

I think the base system (kernel + udev) needs to provide deterministic,
sensible default behavior.

> After all, they chose to build two drivers for one device, perhaps they are 
> the best people to decide?

The thing is that kernel drivers forced them to do that.  They can't
choose between ata_piix and ahci.  One is not proper subset of the other.

>>>> So, are you saying that modprobe chooses modules in the reverse order of
>>>> modules.alias file?
>>> That is precisely what I'm saying, and more.
>> Oops, then modprobe needs to be updated too.  Jon, can you please put
>> this onto your to-do list too?
> 
> The modprobe beheavour of loading them all is IMHO correct.  The order was 
> never defined however, and reverse was how it was implemented.

Yeah, modprobe should load all modules matching the alias as it can't
tell whether the previously loaded module actually attached to everything.

> There is, of course, no reason to change modprobe; just define the current 
> behaviour that the *last* alias is preferred, and generate modules.alias 
> accordingly.

Yeah, the alias file can be generated in reverse but I think it's better
to do things straight.  It may cause some surprises (after upgrading
modprobe, the other driver is being loaded!) but IMHO we'll be better
off with forward-ordered aliases in the long run.  After all, module
loading order was undefined anyway.

Thanks.

-- 
tejun
