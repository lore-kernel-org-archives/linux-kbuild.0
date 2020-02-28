Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20008 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726063AbgB1Kpk (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Feb 2020 05:45:40 -0500
MIME-Version: 1.0
References: <20200218094139.78835-1-qperret@google.com> <20200218094139.78835-3-qperret@google.com>
 <CAK7LNAS0D_1k8FUJ+Bre1jrtGvHu28psU_xCa=K24iD7BkcJeA@mail.gmail.com> <20200228100302.GA228304@google.com>
In-Reply-To: <20200228100302.GA228304@google.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 28 Feb 2020 19:44:58 +0900
Message-ID: <CAK7LNATADSQDp9bGzChE1xck_vw_6B6joLXXozDBrWWv4f=v=w@mail.gmail.com>
Subject: Re: [PATCH v5 2/3] kbuild: split adjust_autoksyms.sh in two parts
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Quentin Perret <qperret@google.com>
Cc: Nicolas Pitre <nico@fluxnic.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Matthias Maennich <maennich@google.com>, "Cc: Android Kernel" <kernel-team@android.com>, Jessica Yu <jeyu@kernel.org>, Christoph Hellwig <hch@infradead.org>

On Fri, Feb 28, 2020 at 7:03 PM Quentin Perret <qperret@google.com> wrote:
>
> On Friday 28 Feb 2020 at 01:41:50 (+0900), Masahiro Yamada wrote:
> > Hi.
> >
> > On Tue, Feb 18, 2020 at 6:41 PM Quentin Perret <qperret@google.com> wrote:
> > >
> > > In order to prepare the ground for a build-time optimization, split
> > > adjust_autoksyms.sh into two scripts: one that generates autoksyms.h
> > > based on all currently available information (whitelist, and .mod
> > > files), and the other to inspect the diff between two versions of
> > > autoksyms.h and trigger appropriate rebuilds.
> > >
> > > Acked-by: Nicolas Pitre <nico@fluxnic.net>
> > > Tested-by: Matthias Maennich <maennich@google.com>
> > > Reviewed-by: Matthias Maennich <maennich@google.com>
> > > Signed-off-by: Quentin Perret <qperret@google.com>
> > > ---
> > >  scripts/adjust_autoksyms.sh | 36 +++-----------------------
> > >  scripts/gen_autoksyms.sh    | 51 +++++++++++++++++++++++++++++++++++++
> > >  2 files changed, 55 insertions(+), 32 deletions(-)
> > >  create mode 100755 scripts/gen_autoksyms.sh
> > >
> > > diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> > > index ff46996525d3..2b366d945ccb 100755
> > > --- a/scripts/adjust_autoksyms.sh
> > > +++ b/scripts/adjust_autoksyms.sh
> > > @@ -1,14 +1,13 @@
> > >  #!/bin/sh
> > >  # SPDX-License-Identifier: GPL-2.0-only
> > >
> > > -# Script to create/update include/generated/autoksyms.h and dependency files
> > > +# Script to update include/generated/autoksyms.h and dependency files
> > >  #
> > >  # Copyright:   (C) 2016  Linaro Limited
> > >  # Created by:  Nicolas Pitre, January 2016
> > >  #
> > >
> > > -# Create/update the include/generated/autoksyms.h file from the list
> > > -# of all module's needed symbols as recorded on the second line of *.mod files.
> > > +# Update the include/generated/autoksyms.h file.
> > >  #
> > >  # For each symbol being added or removed, the corresponding dependency
> > >  # file's timestamp is updated to force a rebuild of the affected source
> > > @@ -38,35 +37,8 @@ esac
> > >  # We need access to CONFIG_ symbols
> > >  . include/config/auto.conf
> > >
> > > -ksym_wl=/dev/null
> > > -if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
> > > -       # Use 'eval' to expand the whitelist path and check if it is relative
> > > -       eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
> > > -       [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
> > > -       if [ ! -f "$ksym_wl" ]; then
> >
> >
> > Just a Nit.
> >
> > Maybe, is testing  -r better ?
> >
> > 'cat - "$ksym_wl"' is piped, so its error code is not checked.
> >
> > So, checking the read permission here is robust, I think.
>
> Right, that's a good point. And actually, I think we want both -f and
> -r. -r alone would consider a path to a folder as correct.
>
> This should do the trick:


Sounds good.

Thanks.



>
> diff --git a/scripts/gen_autoksyms.sh b/scripts/gen_autoksyms.sh
> index 679c9f05e4b4..16c0b2ddaa4c 100755
> --- a/scripts/gen_autoksyms.sh
> +++ b/scripts/gen_autoksyms.sh
> @@ -24,7 +24,7 @@ if [ -n "$CONFIG_UNUSED_KSYMS_WHITELIST" ]; then
>         # Use 'eval' to expand the whitelist path and check if it is relative
>         eval ksym_wl="$CONFIG_UNUSED_KSYMS_WHITELIST"
>         [ "${ksym_wl}" != "${ksym_wl#/}" ] || ksym_wl="$abs_srctree/$ksym_wl"
> -       if [ ! -f "$ksym_wl" ]; then
> +       if [ ! -f "$ksym_wl" ] || [ ! -r "$ksym_wl" ]; then
>                 echo "ERROR: '$ksym_wl' whitelist file not found" >&2
>                 exit 1
>         fi
>
> I'll send a v6 shortly.
>
> Thanks!
> Quentin



-- 
Best Regards
Masahiro Yamada
