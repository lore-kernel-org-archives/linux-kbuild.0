Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f51.google.com ([74.125.82.51]:50095 "EHLO
        mail-wm0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754231AbdJIWD0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 18:03:26 -0400
Received: by mail-wm0-f51.google.com with SMTP id b189so156469wmd.4
        for <linux-kbuild@vger.kernel.org>; Mon, 09 Oct 2017 15:03:25 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1507089367-10402-3-git-send-email-yamada.masahiro@socionext.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com> <1507089367-10402-3-git-send-email-yamada.masahiro@socionext.com>
From: Doug Anderson <dianders@chromium.org>
Date: Mon, 9 Oct 2017 15:03:24 -0700
Message-ID: <CAD=FV=VKoJs=TEh=ddHLOE4b-p3BC5e30PCcgxtqqyEuy6fMkw@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: re-order the code to not parse unnecessary variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hi,

On Tue, Oct 3, 2017 at 8:56 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> The top Makefile is divided into some sections such as mixed targets,
> config targets, build targets, etc.
>
> When we build mixed targets, Kbuild just invokes submake to process
> them one by one.  In this case, compiler-related variables like CC,
> KBUILD_CFLAGS, etc. are unneeded.
>
> Check what kind of targets we are building first, then parse necessary
> variables for building them.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  Makefile | 233 ++++++++++++++++++++++++++++++++-------------------------------
>  1 file changed, 118 insertions(+), 115 deletions(-)

I'm even further outside my comfort zone with this big of a change,
but I will say that as far as I can tell this seems like a good
change.  If it were me I'd have probably broken it up into several
tinier changes that were each massively easy to check/verify, but
presumably for those who know the Makefile better then rolling them
together is fine.  ;)

I're spent some time reviewing this (not tons--maybe an hour or so),
but IMHO I don't know this well enough to add a Reviewed-by tag.


> diff --git a/Makefile b/Makefile
> index 39a7c03..a4fd682 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -186,15 +186,6 @@ ifeq ("$(origin M)", "command line")
>    KBUILD_EXTMOD := $(M)
>  endif
>
> -# If building an external module we do not care about the all: rule
> -# but instead _all depend on modules
> -PHONY += all
> -ifeq ($(KBUILD_EXTMOD),)
> -_all: all
> -else
> -_all: modules
> -endif
> -
>  ifeq ($(KBUILD_SRC),)
>          # building in the source tree
>          srctree := .
> @@ -206,6 +197,9 @@ else
>                  srctree := $(KBUILD_SRC)
>          endif
>  endif
> +
> +export KBUILD_CHECKSRC KBUILD_EXTMOD KBUILD_SRC

The old Makefile also used to export KBUILD_SRC, but I'm not sure why.
Shouldn't this be implicit because KBUILD_SRC always comes from a
command line parameter or environment variable?


-Doug
