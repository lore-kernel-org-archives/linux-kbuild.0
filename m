Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wg0-f47.google.com ([74.125.82.47]:33625 "EHLO
	mail-wg0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751098AbbDLPCL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 12 Apr 2015 11:02:11 -0400
MIME-Version: 1.0
In-Reply-To: <1428791102.17822.175.camel@x220>
References: <1428537385-15089-1-git-send-email-gregory.0xf0@gmail.com>
	<1428701143.17822.72.camel@x220>
	<CABv5NL_uwXv=wNm7h7u_Y1FW5EsqVDdTcB6_dDXemVuVvEbCmg@mail.gmail.com>
	<1428778617.17822.133.camel@x220>
	<CABv5NL-WxZyGbf0afrqa3aL0VGL6kLj3NCPqofB0xc_AuxSNPQ@mail.gmail.com>
	<1428783814.17822.150.camel@x220>
	<CABv5NL9LU15BN8KNqxYO+Vs1rY5KWKNkVmvQO4u-H3PCDqTUrw@mail.gmail.com>
	<1428791102.17822.175.camel@x220>
Date: Sun, 12 Apr 2015 17:02:10 +0200
Message-ID: <CABv5NL-Qtn6_etdJziUkDZZc=e8DYZfMgsMRxZjmozdG2sj7yA@mail.gmail.com>
Subject: Re: [PATCH 1/2] kconfig: Print full defined and depends for
 multiply-defined symbols
From: Stefan Hengelein <stefan.hengelein@fau.de>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Gregory Fong <gregory.0xf0@gmail.com>, Michal Marek <mmarek@suse.cz>, Valentin Rothberg <valentinrothberg@gmail.com>, Andreas Ruprecht <rupran@einserver.de>, Martin Walch <walch.martin@web.de>, linux-kbuild@vger.kernel.org, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

> Let's focus, for example, on m32r and FRAME_POINTER. The m32r entry for
> that symbol reads:
>         config FRAME_POINTER
>                 bool "Compile the kernel with frame pointers"
>                 help
>                   If you say Y here [...]
>
> 0) If one is building for m32r is that all there's to it? If so, "make
> menuconfig"'s search facility is serving the people building for m32r a
> load of crap.
>
> 1) If it's actually more complicated than that I think that anyone
> reading arch/m32r/Kconfig.debug is being duped. Things look simple but
> actually they are quite complicated. I think that's just wrong.
>
> What am I missing here?

If you have a look at the definitions, lib/Kconfig.debug is included
before FRAME_POINTER is defined in m32r and the output in the search
facility looks indeed broken
as one "Defined at" is missing but there are somehow Location entries
(-> Kernel hacking    and  -> Kernel hacking -> compile time checks
and [...]) for both definitions in a weird order (i think (1) and (2)
might indicate both definitions)

both declarations are valid in kconfig, you have two ways of enabling
the same symbol, one easy without conditions and one with conditions
and both with the same prompt.

The search facility shows the first one that is found, you see the
complicated depends on but i think the text shown might not be
explicit enough to clarify you don't need to satisfy these complicated
conditions to actually choose a value.

Stefan
