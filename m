Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:45716 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758941AbZEMAgS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 12 May 2009 20:36:18 -0400
Date: Wed, 13 May 2009 02:38:29 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: eliminate -pipe from kernel compile
Message-ID: <20090513003829.GA13155@uranus.ravnborg.org>
References: <20090511015831.GB15777@luminet.net> <10f740e80905102302gbed0737y61c31900564ca704@mail.gmail.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <10f740e80905102302gbed0737y61c31900564ca704@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Geert Uytterhoeven <geert@linux-m68k.org>, Lance Tagliapietra <lancetag@luminet.net>
Cc: linux-m68k@vger.kernel.org, linux-kbuild@vger.kernel.org

On Mon, May 11, 2009 at 08:02:16AM +0200, Geert Uytterhoeven wrote:
> Added linux-kbuild
> 
> On Mon, May 11, 2009 at 03:58, Lance Tagliapietra <lancetag@luminet.net> wrote:
> > I was noticing that kernel compiling is set up to have gcc pipe data from one pass to another, instead of using
> > temporary files.  On a memory constrained environment, this may not be the best idea (or at least I'd like to
> > explore that idea).  Instead of loading the assember, and having immediately being swapped out while the cc1 pass
> > runs, it may make more sense to have the temp files being written, instead of the swap in and out, when compiling
> > the various objects of the kernel.
> >
> > So, simply pulling out the -pipe from the compiler flag list didn't see to have the desired effect.  I'm afraid I'm
> > still missing something.  I'm still observing the assembler being loaded.

1) How did you "pulling out the -pipe from the compiler flag list"?
Please show this as a patch.

2) Did you verify that -pipe was used before and no more after your
   changes?
   Hint - use "make V=1" to see all command line options to gcc

	Sam
