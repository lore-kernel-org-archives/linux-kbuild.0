Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from us-smtp-delivery-1.mimecast.com ([205.139.110.120]:22039 "EHLO
        us-smtp-1.mimecast.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
        with ESMTP id S1731935AbfKFOeL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 09:34:11 -0500
From: Jeff Moyer <jmoyer@redhat.com>
Subject: Re: [PATCH] modpost: add an option to suppress 'exported twice' warnings
References: <20191106112357.29053-1-yamada.masahiro@socionext.com>
Date: Wed, 06 Nov 2019 09:34:02 -0500
In-Reply-To: <20191106112357.29053-1-yamada.masahiro@socionext.com> (Masahiro
        Yamada's message of "Wed, 6 Nov 2019 20:23:57 +0900")
Message-ID: <x49d0e5nkf9.fsf@segfault.boston.devel.redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=WINDOWS-1252
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Lucas De Marchi <lucas.de.marchi@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Dan Williams <dan.j.williams@intel.com>, Dave Jiang <dave.jiang@intel.com>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, Vishal Verma <vishal.l.verma@intel.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> Since commit "modpost: do not set ->preloaded for symbols from
> Module.symvers", the modpost always warns about symbols exported
> multiple times.
>
> Generally, I believe it is a good thing to show a warning when the
> same symbol name is exported twice. This avoids the accidental symbol
> conflict.
>
> However, in some cases, we build an external module to provide a
> different version/variant of the in-kernel module, overriding the
> same set of exported symbols.
>
> At least, there is one use-case in the upstream code;
> tools/testing/nvdimm/libnvdimm.ko replaces drivers/nvdimm/libnvdimm.ko
> in order to link it against mocked version of core kernel symbols.
>
> Now, this emits a lots of 'exported twice' warnings:
>
>   https://lkml.org/lkml/2019/10/31/627
>
> To suppress those, add a new option KBUILD_DUPLICATED_EXPORTS_NO_WARN.
>
> If you intentionally override the existing symbols, you can pass it
> from the command line:
>
>   make M=3Dtools/testing/nvdimm KBUILD_DUPLICATED_EXPORTS_NO_WARN=3D1
>
> Or, more conveniently, you can add it to the module Makefile, so
> you can still do:
>
>   make M=3Dtools/testing/nvdimm
>
> without sprinkling the warnings.
>
> Reported-by: Jeff Moyer <jmoyer@redhat.com>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
> Jeff Moyer,
> Dan Williams,
>
> Please check if this patch solves the nvdimm build issue.

Yep, that fixes it for me.

You can add:

Tested-by: Jeff Moyer <jmoyer@redhat.com>

Thanks!
