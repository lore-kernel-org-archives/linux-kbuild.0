Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:55514 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751644AbdFPCUo (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Jun 2017 22:20:44 -0400
MIME-Version: 1.0
In-Reply-To: <20170615083622.16618-1-richard.genoud@gmail.com>
References: <20170615083622.16618-1-richard.genoud@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Jun 2017 11:20:34 +0900
Message-ID: <CAK7LNAQ+3PNmHiTzKEbOBkCsZt2Eq3CAY6sZ-CbF=X6sejVp7Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix header installation under fakechroot environment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Nicolas Dichtel <nicolas.dichtel@6wind.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Russell King <rmk+kernel@armlinux.org.uk>, Mark Salter <msalter@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Richard,


2017-06-15 17:36 GMT+09:00 Richard Genoud <richard.genoud@gmail.com>:
> Since commit fcc8487d477a ("uapi: export all headers under uapi
> directories") fakechroot make bindeb-pkg fails, mismatching files for
> directories:
> touch: cannot touch 'usr/include/video/uvesafb.h/.install': Not a
> directory
>
> This due to a bug in fakechroot:
> when using the function $(wildcard $(srcdir)/*/.) in a makefile, under a
> fakechroot environment, not only directories but also files are
> returned.
>
> To circumvent that, we are using the functions:
> $(sort $(dir $(wildcard $(srcdir)/*/))))
>
> And thanks to Yamada Masahiro who figured out the right
> filter-out/patsubst order !

Sorry if I confused you.

The order of filter-out/patsubst was not a real problem,
but just a matter of taste.

Your original code used $(filter-out ./, ...),
but this could not filter out anything.  This is the root cause.

I will remove this paragraph because it is even confusing.

Thanks for the credit, but it is regular review process,
so it is not mandatory in git-log.  :-)


I will pick up this patch shortly anyway.




-- 
Best Regards
Masahiro Yamada
