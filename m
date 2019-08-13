Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:37308 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726649AbfHMVLJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 13 Aug 2019 17:11:09 -0400
Subject: Re: [PATCH v5] modpost: check for static EXPORT_SYMBOL* functions
References: <20190714152817.24693-1-efremov@linux.com>
 <20190801060657.5932-1-efremov@linux.com>
 <CAK7LNASdhyhhqyf1wcga7UDYoo=2t-0ZaqTmQdcsFOfAR580sw@mail.gmail.com>
 <CAK7LNAQG7DM_2+JJ+bJdre12HcbZY7zGfHk3AU66S0ESjxMbnA@mail.gmail.com>
From: Denis Efremov <efremov@linux.com>
Message-ID: <4473cefb-9099-114c-2d7d-7714738b01a1@linux.com>
Date: Wed, 14 Aug 2019 00:11:02 +0300
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQG7DM_2+JJ+bJdre12HcbZY7zGfHk3AU66S0ESjxMbnA@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Stephen Rothwell <sfr@canb.auug.org.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 13.08.2019 19:07, Masahiro Yamada wrote:
> Hi Denis,
>
> I squashed the following fix-up.
> 
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 3e6d36ddfcdf..2773f9f9bae2 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2386,6 +2386,7 @@ static void read_dump(const char *fname,
> unsigned int kernel)
>                 s = sym_add_exported(symname, mod, export_no(export));
>                 s->kernel    = kernel;
>                 s->preloaded = 1;
> +               s->is_static = 0;
>                 sym_update_crc(symname, mod, crc, export_no(export));
>         }
>         release_file(file, size);

Hi!

Thank you very much indeed.

Best regards,
Denis
