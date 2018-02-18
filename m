Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:40391 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751489AbeBRO0V (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 09:26:21 -0500
Date: Sun, 18 Feb 2018 15:26:17 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH 1/2] kbuild: remove incremental linking option
Message-ID: <20180218142617.GA27096@ravnborg.org>
References: <20180210142504.29890-1-npiggin@gmail.com>
 <20180210142504.29890-2-npiggin@gmail.com>
 <CAK7LNASne2L_VNWoirTWc497ALujGk-MjfzjtkJ4=1PS_SLLXA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASne2L_VNWoirTWc497ALujGk-MjfzjtkJ4=1PS_SLLXA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Nicholas Piggin <npiggin@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi Masahiro/Nicholas.

On Sun, Feb 11, 2018 at 03:04:08PM +0900, Masahiro Yamada wrote:
> (+CC Sam)
> 
> 2018-02-10 23:25 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:
> > This removes the old `ld -r` incremental link option, which has not
> > been selected by any architecture since June 2017.
> >
> > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>
> 
> 
> Thanks for the last piece work!
> 
> BTW, as a loosely related topic,
> I guess the following partial section analysis is not working any more.
> 
> # Do section mismatch analysis for each module/built-in.a
> ifdef CONFIG_DEBUG_SECTION_MISMATCH
>   cmd_secanalysis = ; scripts/mod/modpost $@
> endif
> 
> 
> 
> If we use thin archive for built-in.o,
> this is not ELF, so it is always skipped
> by the following code.
> 
> 
> if ((hdr->e_ident[EI_MAG0] != ELFMAG0) ||
>     (hdr->e_ident[EI_MAG1] != ELFMAG1) ||
>     (hdr->e_ident[EI_MAG2] != ELFMAG2) ||
>     (hdr->e_ident[EI_MAG3] != ELFMAG3)) {
>         /* Not an ELF file - silently ignore it */
>         return 0;
> 
> 
> The final analysis is done against vmlinux.o, which is ELF.
> 
> 
> 
> Is it better to remove CONFIG_DEBUG_SECTION_MISMATCH?
> Or, do you have an idea to fix it?
> 
> 
> I CCed Sam, the author of commit 91341d4.

The section mismatch analysis for the individual built-in.o files
was added to get warnings on a level close to where the source
of the error was.
So the warnings was more precise (the .o file gave a good hint
where to look for the error).


And since this has not been missed we should not try to add
extra logic to re-introduce the check on this level.
It would require an extra link for each directory only for
the purpose of the section mismatch detection with
better warnings.
So we can safely get rid of this part.


We still do an extra link of vmlinux to support section
mismatch analysis.
I wonder if we could do something to avoid this extra
link step now where we use thin archieves unconditional.
I assume this extra link step is more RAM and CPU consuming
now than before thin archieves since it has to process
many more .o files.
So there should be some wins in build time if we
can drop any extra step.

	Sam
