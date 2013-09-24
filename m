Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-de.keymile.com ([195.8.104.250]:38341 "EHLO
	mail-de.keymile.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753689Ab3IXPOi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 24 Sep 2013 11:14:38 -0400
Message-ID: <5241AC52.7000808@keymile.com>
Date: Tue, 24 Sep 2013 17:14:26 +0200
From: Gerlando Falauto <gerlando.falauto@keymile.com>
MIME-Version: 1.0
Subject: Re: [PATCH RESEND] ARM: add dtbImage.<dt> and dtbuImage.<dt> rules
References: <504DFBBF.5010202@free-electrons.com> <1348733441-11626-1-git-send-email-richard.genoud@gmail.com> <20120927082955.GR17667@game.jcrosoft.org> <CACQ1gAgwv4pBFZBrVZiWM2_=OneUO-s16LufSENx27gMC3DUig@mail.gmail.com> <52416F97.802@keymile.com> <20130924120152.GI11119@titan.lakedaemon.net>
In-Reply-To: <20130924120152.GI11119@titan.lakedaemon.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jason Cooper <jason@lakedaemon.net>
Cc: Richard Genoud <richard.genoud@gmail.com>, Michal Marek <mmarek@suse.cz>, Russell King <linux@arm.linux.org.uk>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "devicetree-discuss@lists.ozlabs.org" <devicetree-discuss@lists.ozlabs.org>, Rob Herring <rob.herring@calxeda.com>, Grant Likely <grant.likely@secretlab.ca>, Gregory CLEMENT <gregory.clement@free-electrons.com>, Jean-Christophe PLAGNIOL-VILLARD <plagnioj@jcrosoft.com>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Jason,

On 09/24/2013 02:01 PM, Jason Cooper wrote:
> Gerlando,
[...]

> We are strongly encouraging all vendors to upgrade their bootloaders to
> support field upgradeable dtbs.  eg having the dtb on a separate
> partition of the flash (or whereever the bootloader environment is)

This will most definitely be the case for future boards, but we sort of 
follow the unspoken guideline of not upgrading u-boot on field-deployed 
units. Arguable at least, but that's the way it is.

> iirc, keymile is using an odd flavor of Kirkwood.

Correct, it's a kirkwood + a switch on the same die.

> Have you tried kwboot over serial?  It can be found in barebox and u-boot source repositories.

Uhm, yes, I've used it a few times... but what are you suggesting?
That u-boot can be upgraded? Yes, I believe that... ;-)

> The above is the long-term goal, in the short term, please take a look
> at:
>
> https://github.com/zonque/pxa-impedance-matcher
>
> You can use this to boot a modern fdt kernel on a legacy bootloader,
> with one or more dtb's linked in.  I tested it on the dreamplug, so it's
> mostly there for you.
>
> The big outstanding TODO I have on it is to parse the atags and modify
> the selected dtb before passing off to the kernel.  Patches welcome! :)

Thank you, I had a quick look at the README and it sounds great!
But CONFIG_APPENDED_DTB already does the job of filling this gap for me...

>
> hth,

It sure did. I really appreciate it. Thanks!!!

Gerlando
