Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pa0-f43.google.com ([209.85.220.43]:33195 "EHLO
	mail-pa0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753893AbbFBDKV (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Jun 2015 23:10:21 -0400
Received: by padj3 with SMTP id j3so57336807pad.0
        for <linux-kbuild@vger.kernel.org>; Mon, 01 Jun 2015 20:10:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAEMqcmpHhHdB3Bx-ktfA2F1ni9BPa1jEZ9HLe4eHZu7_L+gyiA@mail.gmail.com>
References: <CAEMqcmpHhHdB3Bx-ktfA2F1ni9BPa1jEZ9HLe4eHZu7_L+gyiA@mail.gmail.com>
Date: Mon, 1 Jun 2015 22:10:21 -0500
Message-ID: <CAOS_Y6Rj_6yyxGN6UxxmM7c1t+=7mQDR8CXw-XmVQaRFsr3Otw@mail.gmail.com>
Subject: Re: Kconfiglib -- a flexible Kconfig parser -- now on GitHub
From: Rob Landley <rob@landley.net>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer.lkml@gmail.com>
Cc: Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org

On Mon, Jun 1, 2015 at 6:58 PM, Ulf Magnusson <ulfalizer.lkml@gmail.com> wrote:
> Hello,
>
> A few years ago I posted patches for a Python Kconfig parser and
> library I was working on (https://lkml.org/lkml/2011/2/6/151). As not
> many people are probably aware of it, an updated version of that
> library has been at https://github.com/ulfalizer/Kconfiglib for a
> while now, and is being used for some tasks in e.g. Buildroot and Das
> U-Boot.
>
> As a concrete example, I just noticed scripts/checkkconfigsymbols.py
> and remembered that I have an example script that does the same thing
> (minus some functionality):
> https://github.com/ulfalizer/Kconfiglib/blob/master/examples/print_undefined.py.
>
> I have no intention to get Kconfiglib into the kernel (unless there
> would be a demand), and it's definitely not meant to replace the C
> implementation or introduce a Python dependency for standard builds.
> It's just an auxiliary helper library which some people might find
> useful -- especially when doing "unusual" things with Kconfig-based
> configuration systems.

Huh, I have a todo item to write the old 2.6.12 snapshot of kconfig I
have in http://landley.net/toybox (it's the only gpl code left in the
build), but I just got finished _removing_ python as a bulid
dependency last year and am reluctant to reintroduce it.

I gave up trying to patch upstream kconfig after a half-dozen rounds
of https://lwn.net/Articles/161086/ and such were all ignored. (I just
documented http://landley.net/aboriginal/FAQ.html#dev_miniconfig and
went on with my life. Yes, still using miniconfig.sh a decade
later...)

(I have rather elaborate kconfig parsing to extract help text, I use
specially formatted menuconfig help entries to create command help,
and merge the sub-options to create a unified usage: line and
alphabetically sorted option description list. That's the stuff that
used to be python, which I rewrote in C last year. Somebody submitted
a kconfig parser written in awk to toybox a couple years ago, but I
can't maintain awk...)

Rob
