Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from rv-out-0910.google.com ([209.85.198.190]:26545 "EHLO
	rv-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754546AbYAZEW2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 25 Jan 2008 23:22:28 -0500
Received: by rv-out-0910.google.com with SMTP id k20so978462rvb.1
        for <linux-kbuild@vger.kernel.org>; Fri, 25 Jan 2008 20:22:28 -0800 (PST)
Message-ID: <479AB57D.3080805@gmail.com>
Date: Sat, 26 Jan 2008 13:22:21 +0900
From: Tejun Heo <htejun@gmail.com>
MIME-Version: 1.0
Subject: Re: [PATCH 12/77] kbuild: implement modules.order
References: <20080124215813.GA4204@uranus.ravnborg.org> <200801251419.09999.rusty@rustcorp.com.au> <47995788.3000402@gmail.com> <200801261501.56198.rusty@rustcorp.com.au>
In-Reply-To: <200801261501.56198.rusty@rustcorp.com.au>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rusty Russell <rusty@rustcorp.com.au>
Cc: Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org, Bill Nottingham <notting@redhat.com>, Greg Kroah-Hartman <gregkh@suse.de>, Kay Sievers <kay.sievers@vrfy.org>, Jon Masters <jonathan@jonmasters.org>

Hello, Rusty.

Rusty Russell wrote:
> On Friday 25 January 2008 14:29:12 Tejun Heo wrote:
>> Rusty Russell wrote:
>>> On Friday 25 January 2008 09:02:53 Sam Ravnborg wrote:
>>>> From: Tejun Heo <htejun@gmail.com>
>>>>
>>>> When driver modules are loaded by udev, what comes first in
>>>> modules.alias file is selected.
>>> Actually, I had occasion to look at this the other day, and in the
>>> modprobe version here every match is selected.
>> What do you mean by "every match is selected"?
> 
> (I really can't tell if you're being facecious here, or you really don't know 
> this, so I'll assume the latter...)

The third, actually.  Somehow it wasn't clear to me what you meant by
'match', 'selected' and 'loaded'.

> modules.alias contains wildcards for what devices this module might match, eg.
> 
> alias pci:v00008086d00002829sv*sd*bc*sc*i* ahci
> 
> modprobe gets called to insert 
> eg 'pci:v00008086d00002829sv000017AAsd000020A7bc01sc06i01'.
> 
> After finding nothing in the normal config files, it looks for all matches in 
> modules.alias, and inserts all those modules in the kernel.

Thanks for the clarification.

>>> And they'll be loaded in reverse order of the module.alias file.
>> What do you mean by 'loaded'?
> 
> I mean modprobe loads the moduled into the kernel.  Each module is loaded into 
> memory, then sys_init_module() called to load the module, with args chosen 
> from the modprobe.conf/modprobe.d files.
>
>>> Looks like Jon's latest git tree does the same.
>>>
>>> So, what does this patch actually fix?
>> This patch makes kbuild generate modules.order and another patch makes
>> depmod generate modules.alias or whatever else according to the order
>> specified in modules.order, so that modprobe prefer modules which is
>> earlier in the linking order.
> 
> That's what the patch does, and you've explained that clearly multiple times.
> 
> But I can only ask again, "what does this patch actually fix?".  ie. what 
> system got messed up because of the current behaviour?  Where's the problem 
> we're fixing?  This might fix it as a side effect, but let's try harder than 
> that, OK?

There was a non-deterministic behavior involving ata_piix and ahci
drivers on ich6.  Both drivers support the chipset but ata_piix is less
capable while ahci might misbehave (chip bug).  Generally, ahci should
be preferred as it seems the problem cases seem to be rare.  When
drivers are linked in, this is forced by link order.  When module is
loaded via udev, depending on how modules.alias is generated, sometimes
ata_piix is loaded and at other times ahci, causing 'oops,
hotplugging/NCQ doesn't work after kernel update' - 'what? it was
security update one liner'.

More generally, occasionally some feature or hardware is supported in
more than one ways.  Maybe new driver is under development or the
feature has inherent dualism.  Link order isn't a complete solution but
can cover most usual cases and at least gives configurable (by
developers) deterministic priority.  So, these changes try to extend
link order to module loading too.

>> So, are you saying that modprobe chooses modules in the reverse order of
>> modules.alias file?
> 
> That is precisely what I'm saying, and more.

Oops, then modprobe needs to be updated too.  Jon, can you please put
this onto your to-do list too?

Thanks.

-- 
tejun
