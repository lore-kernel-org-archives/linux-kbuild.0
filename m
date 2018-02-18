Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:33054 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751259AbeBRQxl (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 18 Feb 2018 11:53:41 -0500
Received: by mail-pf0-f195.google.com with SMTP id b8so1196587pfh.0
        for <linux-kbuild@vger.kernel.org>; Sun, 18 Feb 2018 08:53:41 -0800 (PST)
Date: Mon, 19 Feb 2018 02:53:18 +1000
From: Nicholas Piggin <npiggin@gmail.com>
Subject: Re: [PATCH 1/2] kbuild: remove incremental linking option
Message-ID: <20180219025318.15e9fa17@roar.ozlabs.ibm.com>
In-Reply-To: <20180218142617.GA27096@ravnborg.org>
References: <20180210142504.29890-1-npiggin@gmail.com>
        <20180210142504.29890-2-npiggin@gmail.com>
        <CAK7LNASne2L_VNWoirTWc497ALujGk-MjfzjtkJ4=1PS_SLLXA@mail.gmail.com>
        <20180218142617.GA27096@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On Sun, 18 Feb 2018 15:26:17 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> Hi Masahiro/Nicholas.
> 
> On Sun, Feb 11, 2018 at 03:04:08PM +0900, Masahiro Yamada wrote:
> > (+CC Sam)
> > 
> > 2018-02-10 23:25 GMT+09:00 Nicholas Piggin <npiggin@gmail.com>:  
> > > This removes the old `ld -r` incremental link option, which has not
> > > been selected by any architecture since June 2017.
> > >
> > > Signed-off-by: Nicholas Piggin <npiggin@gmail.com>  
> > 
> > 
> > Thanks for the last piece work!
> > 
> > BTW, as a loosely related topic,
> > I guess the following partial section analysis is not working any more.
> > 
> > # Do section mismatch analysis for each module/built-in.a
> > ifdef CONFIG_DEBUG_SECTION_MISMATCH
> >   cmd_secanalysis = ; scripts/mod/modpost $@
> > endif
> > 
> > 
> > 
> > If we use thin archive for built-in.o,
> > this is not ELF, so it is always skipped
> > by the following code.
> > 
> > 
> > if ((hdr->e_ident[EI_MAG0] != ELFMAG0) ||
> >     (hdr->e_ident[EI_MAG1] != ELFMAG1) ||
> >     (hdr->e_ident[EI_MAG2] != ELFMAG2) ||
> >     (hdr->e_ident[EI_MAG3] != ELFMAG3)) {
> >         /* Not an ELF file - silently ignore it */
> >         return 0;
> > 
> > 
> > The final analysis is done against vmlinux.o, which is ELF.
> > 
> > 
> > 
> > Is it better to remove CONFIG_DEBUG_SECTION_MISMATCH?
> > Or, do you have an idea to fix it?
> > 
> > 
> > I CCed Sam, the author of commit 91341d4.  
> 
> The section mismatch analysis for the individual built-in.o files
> was added to get warnings on a level close to where the source
> of the error was.
> So the warnings was more precise (the .o file gave a good hint
> where to look for the error).
> 
> 
> And since this has not been missed we should not try to add
> extra logic to re-introduce the check on this level.
> It would require an extra link for each directory only for
> the purpose of the section mismatch detection with
> better warnings.
> So we can safely get rid of this part.

This would be good. Perhaps now that the section mismatch analysis
has stamped out most such bugs, it is less trouble to work from
the final link analysis when they do appear.

> We still do an extra link of vmlinux to support section
> mismatch analysis.
> I wonder if we could do something to avoid this extra
> link step now where we use thin archieves unconditional.
> I assume this extra link step is more RAM and CPU consuming
> now than before thin archieves since it has to process
> many more .o files.
> So there should be some wins in build time if we
> can drop any extra step.

For the final link it's not too bad. The final built-in archive
that is created in the root directory contains symbol table and a
symbol index which the linker seems to process very quickly. I
found the difference is very small between thin and incremental.

It would be really nice in general to reduce the number of final
link passes though. We currently link it 4 times!

Thanks,
Nick
