Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:38495 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfKABNz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 21:13:55 -0400
MIME-Version: 1.0
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
 <20191003102915.28301-4-yamada.masahiro@socionext.com> <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
In-Reply-To: <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 1 Nov 2019 10:13:10 +0900
Message-ID: <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com>
Subject: Re: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeff Moyer <jmoyer@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>

On Fri, Nov 1, 2019 at 1:51 AM Jeff Moyer <jmoyer@redhat.com> wrote:
>
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
> > Now that there is no overwrap between symbols from ELF files and
> > ones from Module.symvers.
> >
> > So, the 'exported twice' warning should be reported irrespective
> > of where the symbol in question came from. Only the exceptional case
> > is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
> > typically occurs for EXPORT_SYMBOL in .S files.
>
> Hi, Masahiro,
>
> After apply this patch, I get the following modpost warnings when doing:
>
> $ make M=tools/tesing/nvdimm
> ...
>   Building modules, stage 2.
>   MODPOST 12 modules
> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> ...
>
> There are a lot of these warnings.  :)

These warnings are correct since
drivers/nvdimm/Makefile and
tools/testing/nvdimm/Kbuild
compile the same files.




>  If I revert this patch, no
> complaints.
>
> Cheers,
> Jeff
>
>
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > ---
> >
> >  scripts/mod/modpost.c | 1 -
> >  1 file changed, 1 deletion(-)
> >
> > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > index 5234555cf550..6ca38d10efc5 100644
> > --- a/scripts/mod/modpost.c
> > +++ b/scripts/mod/modpost.c
> > @@ -2457,7 +2457,6 @@ static void read_dump(const char *fname, unsigned int kernel)
> >               s = sym_add_exported(symname, namespace, mod,
> >                                    export_no(export));
> >               s->kernel    = kernel;
> > -             s->preloaded = 1;
> >               s->is_static = 0;
> >               sym_update_crc(symname, mod, crc, export_no(export));
> >       }
>


-- 
Best Regards
Masahiro Yamada
