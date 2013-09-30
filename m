Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qe0-f52.google.com ([209.85.128.52]:58501 "EHLO
	mail-qe0-f52.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754789Ab3I3WoT (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 30 Sep 2013 18:44:19 -0400
Received: by mail-qe0-f52.google.com with SMTP id i11so4280856qej.25
        for <linux-kbuild@vger.kernel.org>; Mon, 30 Sep 2013 15:44:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CA+bK7J7=x6=ZsWnSkGByvDLbht9nD6G3wQ5d05P-D96v6udDgg@mail.gmail.com>
References: <504DFBBF.5010202@free-electrons.com>
	<1348733441-11626-1-git-send-email-richard.genoud@gmail.com>
	<20120927082955.GR17667@game.jcrosoft.org>
	<CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com>
	<52416F97.802@keymile.com>
	<20130924120152.GI11119@titan.lakedaemon.net>
	<20130924121939.GD12758@n2100.arm.linux.org.uk>
	<CA+bK7J7=x6=ZsWnSkGByvDLbht9nD6G3wQ5d05P-D96v6udDgg@mail.gmail.com>
Date: Mon, 30 Sep 2013 17:44:18 -0500
Message-ID: <CAL_JsqJ4Fn93ULo1sAA=8VUm33XkKY9iVpdqjQm6jh0s4pNFBw@mail.gmail.com>
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
From: Rob Herring <robherring2@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tim Bird <tbird20d@gmail.com>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Michal Marek <mmarek@suse.cz>, Jason Cooper <jason@lakedaemon.net>, linux-kbuild@vger.kernel.org, Richard Genoud <richard.genoud@gmail.com>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gerlando Falauto <gerlando.falauto@keymile.com>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On Mon, Sep 30, 2013 at 1:14 PM, Tim Bird <tbird20d@gmail.com> wrote:
> On Tue, Sep 24, 2013 at 5:19 AM, Russell King - ARM Linux
> <linux@arm.linux.org.uk> wrote:
>> On Tue, Sep 24, 2013 at 08:01:52AM -0400, Jason Cooper wrote:
>>> On Tue, Sep 24, 2013 at 12:55:19PM +0200, Gerlando Falauto wrote:
>>> > So it shouldn't be such a crazy idea to create a dtbuImage.<dtb>
>>> > within Kbuild (as opposed to from an external wrapper for make).
>>>
>>> Yes :)  The problem is that we are moving to multiplatform zImages.  In
>>> that scenario, the uImage target isn't very helpful because it needs to
>>> be custom to each board.  Additionally, appended-dtb was intended as a
>>> developer tool and isn't intended as a deployable item.  It also
>>> defeats the purpose of multiplatform.
>>
>> And we've already taken the decision that we will not be augmenting
>> kbuild with any more ubooot specific stuff, especially with anything
>> that goes against the long term goal of having a single kernel image
>> which is bootable across multiple platforms.
>>
>> Having kbuild wrap the zImage + DTB up into a uImage goes directly
>> against this goal, because it turns the produced kernel into something
>> which is specific to a single target.  It's much worse than what we
>> had before we went to DT, because with this it can only be used on a
>> _single_ target, whereas prior to DT we could boot a single kernel
>> on a variety of compatible targets.
>>
>> Moreover, the support for appending the DTB to the zImage is a stop-gap
>> solution for the transition to a full DT based environment - don't
>> expect it to be around into the long term future.  Modern platforms
>> should be using a DT compatible boot loader, which means you don't
>> want to use the DTB appended to zImage method.
>>
>
> What is the long-term mechanism/methodology for creating a kernel
> that runs on a single system?  So many drivers now have device-tree
> dependencies that it seems unlikely we'll be able to avoid using
> device tree.  But if we don't care or don't want to support more than
> a single platform, what should we do (if appending DTB to the zImage
> will eventually go away).  Will the requirement be that all future
> Linux bootloaders will be DT-aware?

I don't think appended DTB will go away. In fact, use of it is now
being added to flash-kernel in debian/ubuntu. However, this is only
done at OS install time on running on the h/w. The problem goes beyond
just having a DT aware bootloader. You also need the bootloader to
ship with the DTB. This isn't happening yet, so the distros are having
to install their own DTB. Since there is not a standard way to install
a dtb and tell the bootloader where it is, the appended dtb is the
quick solution.

Rob
