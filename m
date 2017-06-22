Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:51820 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751095AbdFVBRh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 21 Jun 2017 21:17:37 -0400
MIME-Version: 1.0
In-Reply-To: <20170615083622.16618-1-richard.genoud@gmail.com>
References: <20170615083622.16618-1-richard.genoud@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 22 Jun 2017 10:17:31 +0900
Message-ID: <CAK7LNATAYn2-4X7Dyn0tRqNfZCNVU6Ws3VaMSsQJ=MhUMLy+_Q@mail.gmail.com>
Subject: Re: [PATCH] kbuild: fix header installation under fakechroot environment
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Richard Genoud <richard.genoud@gmail.com>
Cc: Nicolas Dichtel <nicolas.dichtel@6wind.com>, Daniel Vetter <daniel.vetter@ffwll.ch>, Russell King <rmk+kernel@armlinux.org.uk>, Mark Salter <msalter@redhat.com>, Michael Ellerman <mpe@ellerman.id.au>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

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
>
> Fixes: fcc8487d477a ("uapi: export all headers under uapi directories")
> Signed-off-by: Richard Genoud <richard.genoud@gmail.com>
> ---

Applied to linux-kbuild/fixes.  Thanks!

-- 
Best Regards
Masahiro Yamada
