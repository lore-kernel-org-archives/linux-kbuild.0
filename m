Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail2.shareable.org ([80.68.89.115]:45244 "EHLO
	mail2.shareable.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758555AbYFOQpK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Jun 2008 12:45:10 -0400
Date: Sun, 15 Jun 2008 17:00:49 +0100
From: Jamie Lokier <jamie@shareable.org>
Subject: Re: about size optimizations (Re: Not as much ccache win as I expected)
Message-ID: <20080615160049.GA2991@shareable.org>
References: <8499950a0806131452j5dc9574dk336e9e06ee9e1785@mail.gmail.com> <1213429403.26255.298.camel@pmac.infradead.org> <8499950a0806140256o45d3696o505c02b2f34d90db@mail.gmail.com> <1213437917.26255.335.camel@pmac.infradead.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1213437917.26255.335.camel@pmac.infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Woodhouse <dwmw2@infradead.org>
Cc: Oleg Verych <olecom@gmail.com>, linux-embedded <linux-embedded@vger.kernel.org>, linux-kbuild@vger.kernel.org, segher@kernel.crashing.org

David Woodhouse wrote:
> On Sat, 2008-06-14 at 10:56 +0100, Oleg Verych wrote:
> > I saw that. My point is pure text processing. But as it seems doing
> > `make` is a lot more fun than to do `sh` && `sed`.
> 
> The problem is that it _isn't_ pure text processing. There's more to
> building with --combine than that, and we really do want the compiler to
> do it.
> 
> _Sometimes_ you can just append C files together and they happen to
> work. But not always. A simple case where it fails would be when you
> have a static variable with the same name in two different files.

I suspect the simplest way to adapt an existing makefile is:

    1. Replace each compile command "gcc args... file.c -o file.o"
       with "gcc -E args... file.c -o file.o.i".

    2. Replace each incremental link "ld -r -o foo.o files..." with
       "cat `echo files... | sed 's/$/.i/'` > foo.o.i".

    3. Similar replacement for each "ar" command making .a files.

    4. Replace the main link "ld -o vmlinux files..." with
       "gcc -o vmlinux --combine -fwhole-program `echo files... | sed 's/$/.i/'`".

You can do this without changin the Makefile, if you provide suitable
scripts on $PATH for the make.

-- Jamie
