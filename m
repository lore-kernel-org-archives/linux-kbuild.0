Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:53708 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755186Ab1DXIkB convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 24 Apr 2011 04:40:01 -0400
MIME-Version: 1.0
In-Reply-To: <1303617721.3032.88.camel@localhost>
References: <1303580576.4815.3.camel@localhost>
	<20110423180450.GB25379@merkur.ravnborg.org>
	<1303617721.3032.88.camel@localhost>
Date: Sun, 24 Apr 2011 10:39:59 +0200
Message-ID: <BANLkTin8p3B=hE1gdw=7V=d3RdSFifyVPQ@mail.gmail.com>
Subject: Re: [PATCH] kconfig: Avoid buffer underrun in choice input
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Sam Ravnborg <sam@ravnborg.org>, Michal Marek <mmarek@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, Roman Zippel <zippel@linux-m68k.org>

On Sun, Apr 24, 2011 at 06:02, Ben Hutchings <ben@decadent.org.uk> wrote:
> On Sat, 2011-04-23 at 20:04 +0200, Sam Ravnborg wrote:
>> On Sat, Apr 23, 2011 at 06:42:56PM +0100, Ben Hutchings wrote:
>> > Roman has failed to respond to this after 5 weeks and one reminder, so
>> > please take it directly.
>>
>> No-one has heard from Roman Zippel in several years.
>> I have suggested Michal Marek to take over the maintainer
>> role - as he in practice is the kconfig maintainer.
>
> Can someone please update MAINTAINERS then?  What is the point of it if
> people don't update it for years?

I have removed him from AFFS, HFS, and m68k.
I left the kbuild entry for the kbuild people.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
