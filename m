Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from alt13.smtp-out.videotron.ca ([135.19.0.26]:33465 "EHLO
        alt12.smtp-out.videotron.ca" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1754505AbcK3XLc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 30 Nov 2016 18:11:32 -0500
Date: Wed, 30 Nov 2016 17:54:26 -0500 (EST)
From: Nicolas Pitre <nico@fluxnic.net>
Subject: Re: Odd build breakage in 4.9-rc7
In-Reply-To: <583F1F6A.5010307@redhat.com>
Message-ID: <alpine.LFD.2.20.1611301748080.1715@knanqh.ubzr>
References: <20161130172435.GG8563@redhat.com> <CA+55aFz0f6ykvWt+f0ALD62mngJuTrjNY8CQLK3qNAuYUzMeDw@mail.gmail.com> <583F1A5A.7040708@redhat.com> <CA+55aFyPhpYQR-a+PNcDSNBTaRk5CeWAwynSp2QUcStfWazTZA@mail.gmail.com> <583F1F6A.5010307@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Prarit Bhargava <prarit@redhat.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Jarod Wilson <jarod@redhat.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Tony Luck <tony.luck@intel.com>, zarniwhoop73@googlemail.com, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Wed, 30 Nov 2016, Prarit Bhargava wrote:

> 
> 
> On 11/30/2016 01:36 PM, Linus Torvalds wrote:
> > On Wed, Nov 30, 2016 at 10:28 AM, Prarit Bhargava <prarit@redhat.com> wrote:
> > ]>
> >> In my case I tracked this to commit 3637efb00864 ("x86/mce: Add PCI quirks to
> >> identify Xeons with machine check recovery") which adds the include for
> >> generated/autoksyms.h.
> > 
> > Ok, that at least makes some sense. The other blamed commit did not
> > seem to possibly make a difference.
> > 
> >> Searching LKML and I came across a report from Ken Moffat from a month ago:
> >>
> >> http://marc.info/?l=linux-kernel&m=147794681124332&w=2
> > 
> > Does a "make clean" get rid of it forever? Or does it come back?
> 
> It comes back.  The steps to reproduce this are:
> 
> 1.  checkout latest linux.git
> 2.  make -j112
> 
> (IOW, it occurs 100% of the time for me on a clean tree.)
> 
> To work around the bug I have to do
> 
> 1.  checkout latest linux.git
> 2.  comment out the include for generated/autoksyms.h at include/linux/export.h:81
> 3.  compile with -j112
> 
> This fails loudly, but then I do
> 
> 4.  uncomment the include for generated/autoksyms.h at include/linux/export.h:81

A simpler workaround is simply:

	touch include/generated/autoksyms.h

But hopefully the patch I just sent would fix it for good.


Nicolas
