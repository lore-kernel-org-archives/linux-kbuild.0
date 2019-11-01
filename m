Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([207.211.31.120]:47041 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1727372AbfKASwf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 14:52:35 -0400
From: Jeff Moyer <jmoyer@redhat.com>
Subject: Re: [PATCH 4/4] modpost: do not set ->preloaded for symbols from Module.symvers
References: <20191003102915.28301-1-yamada.masahiro@socionext.com>
        <20191003102915.28301-4-yamada.masahiro@socionext.com>
        <x497e4kluxq.fsf@segfault.boston.devel.redhat.com>
        <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com>
Date: Fri, 01 Nov 2019 14:52:27 -0400
In-Reply-To: <CAK7LNASmpO6Dn2M1DtoCDs=RM+jwW7_tRhq7nqDU1YZWdRafuw@mail.gmail.com>
        (Masahiro Yamada's message of "Fri, 1 Nov 2019 10:13:10 +0900")
Message-ID: <x494kznctuc.fsf@segfault.boston.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Dan Williams <dan.j.williams@intel.com>, linux-nvdimm <linux-nvdimm@lists.01.org>

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> On Fri, Nov 1, 2019 at 1:51 AM Jeff Moyer <jmoyer@redhat.com> wrote:
>>
>> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>>
>> > Now that there is no overwrap between symbols from ELF files and
>> > ones from Module.symvers.
>> >
>> > So, the 'exported twice' warning should be reported irrespective
>> > of where the symbol in question came from. Only the exceptional case
>> > is when __crc_<sym> symbol appears before __ksymtab_<sym>. This
>> > typically occurs for EXPORT_SYMBOL in .S files.
>>
>> Hi, Masahiro,
>>
>> After apply this patch, I get the following modpost warnings when doing:
>>
>> $ make M=3Dtools/tesing/nvdimm
>> ...
>>   Building modules, stage 2.
>>   MODPOST 12 modules
>> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_lock' exported
>> twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'nvdimm_bus_unlock'
>> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'is_nvdimm_bus_locked'
>> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'devm_nvdimm_memremap'
>> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'nd_fletcher64' exported twice.=
 Previous export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nd_desc' exported twice. Pr=
evious export was in drivers/nvdimm/libnvdimm.ko
>> WARNING: tools/testing/nvdimm/libnvdimm: 'to_nvdimm_bus_dev'
>> exported twice. Previous export was in drivers/nvdimm/libnvdimm.ko
>> ...
>>
>> There are a lot of these warnings.  :)
>
> These warnings are correct since
> drivers/nvdimm/Makefile and
> tools/testing/nvdimm/Kbuild
> compile the same files.

Yeah, but that's by design.  Is there a way to silence these warnings?

-Jeff
