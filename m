Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lb3-smtp-cloud6.xs4all.net ([194.109.24.31]:43886 "EHLO
	lb3-smtp-cloud6.xs4all.net" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751907AbbDKWZG (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 11 Apr 2015 18:25:06 -0400
Message-ID: <1428791102.17822.175.camel@x220>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
From: Paul Bolle <pebolle@tiscali.nl>
Date: Sun, 12 Apr 2015 00:25:02 +0200
In-Reply-To: <CABv5NL9LU15BN8KNqxYO+Vs1rY5KWKNkVmvQO4u-H3PCDqTUrw@mail.gmail.com>
References: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
	 <1428701143.17822.72.camel@x220>
	 <CABv5NL_uwXv=wNm7h7u_Y1FW5EsqVDdTcB6_dDXemVuVvEbCmg@mail.gmail.com>
	 <1428778617.17822.133.camel@x220>
	 <CABv5NL-WxZyGbf0afrqa3aL0VGL6kLj3NCPqofB0xc_AuxSNPQ@mail.gmail.com>
	 <1428783814.17822.150.camel@x220>
	 <CABv5NL9LU15BN8KNqxYO+Vs1rY5KWKNkVmvQO4u-H3PCDqTUrw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stefan Hengelein <stefan.hengelein@fau.de>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sat, 2015-04-11 at 23:46 +0200, Stefan Hengelein wrote:
> 2015-04-11 22:23 GMT+02:00 Paul Bolle <pebolle@tiscali.nl>:
> > That's a NAK to this patch, isn't it?
> 
> That's not for me to decide. Maybe I missed something!
> But I wouldn't merge it in the current state.

Thanks. That's all I needed to hear.

> > I'd really prefer things to be simpler: how is anyone reading the
> > Kconfig entries I quoted going to realize all that?
> 
> No one has to, most of the things i explained to you come from a few
> years of experience with Kconfig. FRAME_POINTER is a complicated
> example, it is selected although it has dependencies or a prompt AND
> it is redefined in many architectures.
> AFAIUI, the "depends on" or "selected by" output should give hints
> what you have to enable to get a prompt for that option or simply
> enable it.
> 
> Wouldn't mentioning a symbol two times (because there are two
> declarations) also confuse users if they search for FRAME_POINTER? But
> at least it would give hints were both declarations are defined
> without mixing them up.

I think we can forget about this patch.

Let's focus, for example, on m32r and FRAME_POINTER. The m32r entry for
that symbol reads:
        config FRAME_POINTER
                bool "Compile the kernel with frame pointers"
                help
                  If you say Y here [...]

0) If one is building for m32r is that all there's to it? If so, "make
menuconfig"'s search facility is serving the people building for m32r a
load of crap.

1) If it's actually more complicated than that I think that anyone
reading arch/m32r/Kconfig.debug is being duped. Things look simple but
actually they are quite complicated. I think that's just wrong.

What am I missing here?


Paul Bolle

