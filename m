Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi1-f195.google.com ([209.85.167.195]:37776 "EHLO
        mail-oi1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727788AbfKDGnn (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Nov 2019 01:43:43 -0500
Received: by mail-oi1-f195.google.com with SMTP id y194so13179349oie.4
        for <linux-kbuild@vger.kernel.org>; Sun, 03 Nov 2019 22:43:42 -0800 (PST)
MIME-Version: 1.0
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
 <20191003102915.28301-4-yamada.masahiro@socionext.com> <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
 <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com>
 <x494kznctuc.fsf@segfault.boston.devel.redhat.com> <CAK7LNAQnaBCkRCsRPjK9m6wLaDvTsgkiFgMEiObnfuncxOHZOg@mail.gmail.com>
In-Reply-To: <CAK7LNAQnaBCkRCsRPjK9m6wLaDvTsgkiFgMEiObnfuncxOHZOg@mail.gmail.com>
From: Dan Williams <dan.j.williams@intel.com>
Date: Sun, 3 Nov 2019 22:43:31 -0800
Message-ID: <CAPcyv4gFO=4EmObucuYyPNCS91y1H7d-M=0LebBK72YuD=ekNQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Jeff Moyer <jmoyer@redhat.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-nvdimm <linux-nvdimm@lists.01.org>

On Sun, Nov 3, 2019 at 7:12 PM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> On Sat, Nov 2, 2019 at 3:52 AM Jeff Moyer <jmoyer@redhat.com> wrote:
> >
> > Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> >
> > > On Fri, Nov 1, 2019 at 1:51 AM Jeff Moyer <jmoyer@redhat.com> wrote:
> > >>
> > >> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
> > >>
> > >> > Now that there is no overwrap between symbols from ELF files and
> > >> > ones from Module.symvers.
> > >> >
> > >> > So, the 'exported twice' warning should be reported irrespective
> > >> > of where the symbol in question came from. Only the exceptional case
> > >> > is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
> > >> > typically occurs for EXPORT_SYMBOL in .S files.
> > >>
> > >> Hi, Masahiro,
> > >>
> > >> After apply this patch, I get the following modpost warnings when doing:
> > >>
> > >> $ make M=tools/tesing/nvdimm
> > >> ...
> > >>   Building modules, stage 2.
> > >>   MODPOST 12 modules
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported
> > >> twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock'
> > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked'
> > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap'
> > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev'
> > >> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
> > >> ...
> > >>
> > >> There are a lot of these warnings.  :)
> > >
> > > These warnings are correct since
> > > drivers/nvdimm/Makefile and
> > > tools/testing/nvdimm/Kbuild
> > > compile the same files.
> >
> > Yeah, but that's by design.  Is there a way to silence these warnings?
> >
> > -Jeff
> >
>
> "rm -f Module.symvers; make M=tools/testing/nvdimm" ?
>
> I'd like the _design_ fixed though.

This design is deliberate. The goal is to re-build the typical nvdimm
modules, but link them against mocked version of core kernel symbols.
This enables the nvdimm unit tests which have been there for years and
pre-date Kunit. That said, deleting Module.symvers seems a simple
enough workaround.
