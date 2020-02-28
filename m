Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45930 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726413AbgB1KqM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 05:46:12 -0500
Received: by mail-wr1-f67.google.com with SMTP id v2so2342738wrp.12
        for <linux-kbuild@vger.kernel.org>; Fri, 28 Feb 2020 02:46:11 -0800 (PST)
Date: Fri, 28 Feb 2020 10:46:06 +0000
From: Quentin Perret <qperret@google.com>
Subject: Re: [PATCH v5 3/3] kbuild: generate autoksyms.h early
Message-ID: <20200228104606.GA139632@google.com>
References: <20200218094139.78835-1-qperret@google.com>
 <20200218094139.78835-4-qperret@google.com>
 <CAK7LNASCrTj4_RgtxvZm0ei_HExYaPPMJodngKXBOL+=GODv5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK7LNASCrTj4_RgtxvZm0ei_HExYaPPMJodngKXBOL+=GODv5w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Nicolas Pitre <nico@fluxnic.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthias Maennich <maennich@google.com>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@infradead.org>

On Friday 28 Feb 2020 at 19:42:41 (+0900), Masahiro Yamada wrote:
> On Tue, Feb 18, 2020 at 6:41 PM Quentin Perret <qperret@google.com> wrote:
> >
> > When doing a cold build, autoksyms.h starts empty, and is updated late
> > in the build process to have visibility over the symbols used by in-tree
> > drivers. But since the symbol whitelist is known upfront, it can be used
> > to pre-populate autoksyms.h and maximize the amount of code that can be
> > compiled to its final state in a single pass, hence reducing build time.
> >
> > Do this by using gen_autoksyms.sh to initialize autoksyms.h instead of
> > creating an empty file.
> >
> > Acked-by: Nicolas Pitre <nico@fluxnic.net>
> > Tested-by: Matthias Maennich <maennich@google.com>
> > Reviewed-by: Matthias Maennich <maennich@google.com>
> > Signed-off-by: Quentin Perret <qperret@google.com>
> > ---
> >  Makefile                 | 7 +++++--
> >  scripts/gen_autoksyms.sh | 3 ++-
> >  2 files changed, 7 insertions(+), 3 deletions(-)
> >
> > diff --git a/Makefile b/Makefile
> > index 84b71845c43f..17b7e7f441bd 100644
> > --- a/Makefile
> > +++ b/Makefile
> > @@ -1062,9 +1062,12 @@ endif
> >
> >  autoksyms_h := $(if $(CONFIG_TRIM_UNUSED_KSYMS), include/generated/autoksyms.h)
> >
> > +quiet_cmd_autoksyms_h = GEN     $@
> > +      cmd_autoksyms_h = mkdir -p $(dir $@); $(CONFIG_SHELL) \
> > +                       $(srctree)/scripts/gen_autoksyms.sh $@
> 
> 
> When you send v6,
> could you wrap the line as follows (CONFIG_SHELL in the next line)  ?
> 
>          cmd_autoksyms_h = mkdir -p $(dir $@); \
>                           $(CONFIG_SHELL) $(srctree)/scripts/gen_autoksyms.sh $@
> 
> 
> This still fits in 80-cols.

Will do.

Thanks,
Quentin
