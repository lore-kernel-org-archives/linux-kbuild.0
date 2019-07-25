Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:57000 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388736AbfGYPTT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 25 Jul 2019 11:19:19 -0400
MIME-Version: 1.0
References: <20190717061800.10018-1-yamada.masahiro@socionext.com>
 <20190717061800.10018-8-yamada.masahiro@socionext.com> <230d2ca1-19cd-b60e-1b1b-6d7413eea9e2@siemens.com>
In-Reply-To: <230d2ca1-19cd-b60e-1b1b-6d7413eea9e2@siemens.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 26 Jul 2019 00:18:12 +0900
Message-ID: <CAK7LNARu--p-tiJA2RGM5_KSQPSeo6-pkp-4GRd2AwM_1dtD7Q@mail.gmail.com>
Subject: Re: [PATCH v3 07/12] kbuild: modpost: read modules.order instead of $(MODVERDIR)/*.mod
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Kiszka <jan.kiszka@siemens.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Joe Lawrence <joe.lawrence@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Jan,

On Thu, Jul 25, 2019 at 5:39 PM Jan Kiszka <jan.kiszka@siemens.com> wrote:
> >
>
> This affects also external modules builds: I have patterns here that do
>
> [Makefile]
> subdir-y := some-module
>
> [some-module/Makefile]
> obj-m := some-module.o
>
> and since this patch, the final some-module.ko is no longer built. Am I missing
> something in the kbuild makefiles, or is this a regression?

Thanks for the report.
Interesting. I have never imagined that Makefiles were written like that.

I just wrote a fix-up, but I have not determined to apply it.
https://patchwork.kernel.org/patch/11059033/

It is easy to fixup your Makefile, though.

--
Best Regards
Masahiro Yamada
