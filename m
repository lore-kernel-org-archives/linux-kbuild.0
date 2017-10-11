Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f181.google.com ([209.85.217.181]:44477 "EHLO
        mail-ua0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751710AbdJKQVV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2017 12:21:21 -0400
Received: by mail-ua0-f181.google.com with SMTP id f46so1426447uae.1
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2017 09:21:21 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507693949-23059-1-git-send-email-yamada.masahiro@socionext.com>
References: <1507693949-23059-1-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Oct 2017 09:21:19 -0700
Message-ID: <CAD=FV=X2r456Vpso+q=F1=NbV1fSyLpOnY_=Z_5fSqt4paUOXg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add forward declaration of default target to Makefile.asm-generic
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Tue, Oct 10, 2017 at 8:52 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> $(kbuild-file) and Kbuild.include are included before the default
> target "all".
>
> We will add a target into Kbuild.include.  In advance, add a forward
> declaration of the default target.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/Makefile.asm-generic | 3 +++
>  1 file changed, 3 insertions(+)

Thanks for sending this out!

Reviewed-by: Douglas Anderson <dianders@chromium.org>
