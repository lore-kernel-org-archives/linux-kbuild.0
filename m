Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f176.google.com ([209.85.219.176]:49158 "EHLO
	mail-ew0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751161AbZEKGC2 convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 May 2009 02:02:28 -0400
MIME-Version: 1.0
In-Reply-To: <20090511015831.GB15777@luminet.net>
References: <20090511015831.GB15777@luminet.net>
Date: Mon, 11 May 2009 08:02:16 +0200
Message-ID: <10f740e80905102302gbed0737y61c31900564ca704@mail.gmail.com>
Subject: Re: eliminate -pipe from kernel compile
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: lancetag@luminet.net, linux-m68k@vger.kernel.org
Cc: linux-kbuild@vger.kernel.org

Added linux-kbuild

On Mon, May 11, 2009 at 03:58, Lance Tagliapietra <lancetag@luminet.net> wrote:
> I was noticing that kernel compiling is set up to have gcc pipe data from one pass to another, instead of using
> temporary files.  On a memory constrained environment, this may not be the best idea (or at least I'd like to
> explore that idea).  Instead of loading the assember, and having immediately being swapped out while the cc1 pass
> runs, it may make more sense to have the temp files being written, instead of the swap in and out, when compiling
> the various objects of the kernel.
>
> So, simply pulling out the -pipe from the compiler flag list didn't see to have the desired effect.  I'm afraid I'm
> still missing something.  I'm still observing the assembler being loaded.
>
> Thoughts?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
