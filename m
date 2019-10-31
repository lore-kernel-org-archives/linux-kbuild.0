Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-2.mimecast.com ([205.139.110.61]:22556 "EHLO
        us-smtp-delivery-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1728614AbfJaQvy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 31 Oct 2019 12:51:54 -0400
From: Jeff Moyer <jmoyer@redhat.com>
Subject: Re: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
        <20191003102915.28301-4-yamada.masahiro@socionext.com>
Date: Thu, 31 Oct 2019 12:51:45 -0400
In-Reply-To: <20191003102915.28301-4-yamada.masahiro@socionext.com> (Masahiro
        Yamada's message of "Thu, 3 Oct 2019 19:29:15 +0900")
Message-ID: <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, dan.j.williams@intel.com, linux-nvdimm@lists.01.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Now that there is no overwrap between symbols from ELF files and
> ones from Module.symvers.
>
> So, the 'exported twice' warning should be reported irrespective
> of where the symbol in question came from. Only the exceptional case
> is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
> typically occurs for EXPORT_SYMBOL in .S files.

Hi, Masahiro,

After apply this patch, I get the following modpost warnings when doing:

$ make M=3Dtools/tesing/nvdimm
...
  Building modules, stage 2.
  MODPOST 12 modules
WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported twice. =
Previous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock' exported twice=
. Previous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked' exported tw=
ice. Previous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap' exported tw=
ice. Previous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice. Pr=
evious export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Previ=
ous export was in drivers/nvdimm/libnvdimm.ko
WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev' exported twice=
. Previous export was in drivers/nvdimm/libnvdimm.ko
...

There are a lot of these warnings.  :)  If I revert this patch, no
complaints.

Cheers,
Jeff


>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/mod/modpost.c | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 5234555cf550..6ca38d10efc5 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2457,7 +2457,6 @@ static void read_dump(const char *fname, unsigned i=
nt kernel)
>  =09=09s =3D sym_add_exported(symname, namespace, mod,
>  =09=09=09=09     export_no(export));
>  =09=09s->kernel    =3D kernel;
> -=09=09s->preloaded =3D 1;
>  =09=09s->is_static =3D 0;
>  =09=09sym_update_crc(symname, mod, crc, export_no(export));
>  =09}
