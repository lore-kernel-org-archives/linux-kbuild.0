Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qt1-f196.google.com ([209.85.160.196]:42523 "EHLO
        mail-qt1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725900AbfEMEID (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 13 May 2019 00:08:03 -0400
MIME-Version: 1.0
References: <20190509073555.15545-1-yamada.masahiro@socionext.com>
 <CAK7LNARotATDnShT-80Ect9XvSM98wYEbQRKHdUTuQBtvxG8aw@mail.gmail.com>
 <CACPK8XdVZHtCtHzv9vmt8C877SBbZNqRPxT9iUe0+8-o7X9W7g@mail.gmail.com> <CAK7LNAS71K4my-eyYryViy_uQ0LR5hbzyMjAwZUta99pU=0X9g@mail.gmail.com>
In-Reply-To: <CAK7LNAS71K4my-eyYryViy_uQ0LR5hbzyMjAwZUta99pU=0X9g@mail.gmail.com>
From: Joel Stanley <joel@jms.id.au>
Date: Mon, 13 May 2019 04:07:50 +0000
Message-ID: <CACPK8XediQp2mdbDNuJAJ8_tNoo91aFCaVsC1e_MQ46eonvihQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: terminate Kconfig when $(CC) or $(LD) is missing
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, 13 May 2019 at 02:50, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> > $ CROSS_COMPILE=foo  make
> > make: foogcc: Command not found
> > scripts/kconfig/conf  --syncconfig Kconfig
> > scripts/Kconfig.include:34: compiler 'foogcc' not found
> > make[2]: *** [scripts/kconfig/Makefile:69: syncconfig] Error 1
> > make[1]: *** [Makefile:557: syncconfig] Error 2
> > make: Failed to remake makefile 'include/config/auto.conf'.
> > You are building kernel with non-retpoline compiler.
> > Please update your compiler.
>
>
> I think you are seeing a different bug.
>
> Please test after applying this as well:
> https://patchwork.kernel.org/patch/10939845/

That did the trick. Thank you.

Cheers,

Joel
