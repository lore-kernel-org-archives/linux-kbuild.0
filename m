Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wy0-f174.google.com ([74.125.82.174]:53572 "EHLO
	mail-wy0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754064Ab0HQBMT convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Aug 2010 21:12:19 -0400
Received: by wyb32 with SMTP id 32so6368827wyb.19
        for <linux-kbuild@vger.kernel.org>; Mon, 16 Aug 2010 18:12:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20100816123642.GA7233@merkur.ravnborg.org>
References: <1281934457-4225-1-git-send-email-lacombar@gmail.com>
	<20100816123642.GA7233@merkur.ravnborg.org>
Date: Mon, 16 Aug 2010 21:12:18 -0400
Message-ID: <AANLkTimkEBaLs9Mx8V3_PLdj_-ioaRRo3JAjLH4MJBRd@mail.gmail.com>
Subject: Re: [RFC 0/2] Factor Kconfig's prefix and package name
From: Arnaud Lacombe <lacombar@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Roman Zippel <zippel@linux-m68k.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>

Hi,

On Mon, Aug 16, 2010 at 8:36 AM, Sam Ravnborg <sam@ravnborg.org> wrote:
> 2) References to kernel + version in title in frontends
>  - Use the (today unused) mainmenu entry to pick up the
>    title.
>    Consider following example:
>
> mainmenu "Linux kernel configuration v$KERNELVERSION"
>
> config KERNELVERSION
>        string
>        option env=KERNELVERSION
>
actually, this will need to be more tricky as there is not one, but 2 titles:

 - "Linux Kernel Configuration" hardcoded in zconf.c
 - "Linux Kernel v$KERNELVERSION Configuration" in {g,m,n,q}conf.c

The first prompt does not seem to be easily discardable, and I'm not
sure if it can be made dynamical, as we will need to make any
substitution only when everything else will have been parsed. In any
case I need to dig more in the code...

 - Arnaud

ps: Sam, do you mind if I have a look at this ? the rephrasing and
prefix substitution will not take that much time.
