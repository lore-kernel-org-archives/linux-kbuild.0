Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:27436 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726842AbfCOP2l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Mar 2019 11:28:41 -0400
MIME-Version: 1.0
References: <20190314234159.191745-1-dianders@chromium.org>
In-Reply-To: <20190314234159.191745-1-dianders@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 16 Mar 2019 00:27:43 +0900
Message-ID: <CAK7LNATa+TnXb+a6on-sx2mjNoAiORe-WeZ8UusETHdSrXowuw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Make NOSTDINC_FLAGS a simply expanded variable
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Fri, Mar 15, 2019 at 8:42 AM Douglas Anderson <dianders@chromium.org> wrote:
>
> During a simple no-op (nothing changed) build I saw 39 invocations of
> the C compiler with the argument "-print-file-name=include".  We don't
> need to call the C compiler 39 times for this--one time will suffice.
>
> Let's change NOSTDINC_FLAGS to a simply expanded variable to avoid
> this since there doesn't appear to be any reason it should be
> recursively expanded.
>
> On my build this shaved ~400 ms off my "no-op" build.
>
> Note that the recursive expansion seems to date back to the (really
> old) commit e8f5bdb02ce0 ("[PATCH] Makefile include path ordering").
> It's a little unclear to me if the point of that patch was to switch
> the variable to be recursively expanded (which it did) or to avoid
> directly assigning to NOSTDINC_FLAGS (AKA to switch to +=) because
> someone else (out of tree?) was setting it.  I presume later since if
> the only goal was to switch to recursive expansion the patch would
> have just removed the ":".
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>

Applied to linux-kbuild.
Thanks.



> ---
>
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index 9ef547fc7ffe..3034ba66ad51 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -402,7 +402,7 @@ CHECK               = sparse
>
>  CHECKFLAGS     := -D__linux__ -Dlinux -D__STDC__ -Dunix -D__unix__ \
>                   -Wbitwise -Wno-return-void -Wno-unknown-attribute $(CF)
> -NOSTDINC_FLAGS  =
> +NOSTDINC_FLAGS :=
>  CFLAGS_MODULE   =
>  AFLAGS_MODULE   =
>  LDFLAGS_MODULE  =
> --
> 2.21.0.360.g471c308f928-goog
>


-- 
Best Regards
Masahiro Yamada
