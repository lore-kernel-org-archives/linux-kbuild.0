Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt0-f173.google.com ([209.85.216.173]:35367 "EHLO
	mail-qt0-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932415AbcHKVFN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Aug 2016 17:05:13 -0400
Received: by mail-qt0-f173.google.com with SMTP id x25so4094593qtx.2
        for <linux-kbuild@vger.kernel.org>; Thu, 11 Aug 2016 14:05:12 -0700 (PDT)
Date: Thu, 11 Aug 2016 17:05:09 -0400 (EDT)
From: Nicolas Pitre <nicolas.pitre@linaro.org>
Subject: Re: [EXPERIMENTAL] enable thin archives and --gc-sections on ARM
In-Reply-To: <7664972.4URQm6Y4Ik@wuerfel>
Message-ID: <alpine.LFD.2.20.1608111648520.17623@knanqh.ubzr>
References: <1470910580-18458-1-git-send-email-npiggin@gmail.com> <3116731.ej669o70yG@wuerfel> <alpine.LFD.2.20.1608111536290.17623@knanqh.ubzr> <7664972.4URQm6Y4Ik@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Nicholas Piggin <npiggin@gmail.com>, linux-kbuild@vger.kernel.org, linux-arch@vger.kernel.org, Michal Marek <mmarek@suse.com>, Sam Ravnborg <sam@ravnborg.org>, Stephen Rothwell <sfr@canb.auug.org.au>, Segher Boessenkool <segher@kernel.crashing.org>, Alan Modra <amodra@gmail.com>

On Thu, 11 Aug 2016, Arnd Bergmann wrote:

> On Thursday, August 11, 2016 4:01:33 PM CEST Nicolas Pitre wrote:
> > >  #ifdef CONFIG_SMP_ON_UP
> > >       .init.smpalt : {
> > >               __smpalt_begin = .;
> > > -             *(.alt.smp.init)
> > > +             KEEP(*(.alt.smp.init))
> > 
> > Yes unfortunately this needs a KEEP() right now as there is no explicit 
> > references to those entries. But by doing so you force a reference from 
> > those entries to all functions they annotate, preventing those functions 
> > from being discarded if there isn't any reference to that code 
> > otherwise. That's a case that falls into the "missing forward reference" 
> > category in my slides.
> 
> I see. This actually relates to an existing problem with SMP alternatives
> in exit sections, which cause a linker error. I've done a patch for
> this at some point, but didn't feel confident enough to send it out

The only sane way I found to solve this implied a patch to gas, and it 
was accepted upstream. Please see:

http://sourceware.org/git/gitweb.cgi?p=binutils-gdb.git;a=commit;h=451133cefa

The example given is for .init sections, but that would solve the 
link-time discarding of .exit sections just as well.


Nicolas
