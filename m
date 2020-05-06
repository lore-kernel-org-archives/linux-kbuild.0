Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:54822 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729757AbgEFSg6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 May 2020 14:36:58 -0400
MIME-Version: 1.0
References: <20200505115420.18765-1-anders.roxell@linaro.org>
In-Reply-To: <20200505115420.18765-1-anders.roxell@linaro.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Thu, 7 May 2020 03:36:08 +0900
Message-ID: <CAK7LNAR6MeBRhP1A3oc-UVATNN4r2Ru1LUp2=DqiLSKDL9gwOQ@mail.gmail.com>
Subject: Re: [PATCH] scripts: fix deprecated always and hostprogs-y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Tue, May 5, 2020 at 8:54 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> When I did an allmodconfig build the following warning showed up:
>
> scripts/Makefile.lib:8: 'always' is deprecated. Please use 'always-y' instead
> scripts/Makefile.lib:12: 'hostprogs-y' and 'hostprogs-m' are deprecated. Please use 'hostprogs' instead
>
> Rework to use the new 'always-y' and 'hostprogs'.
>
> Fixes: ee066c3ddf7b ("kbuild: warn if always, hostprogs-y, or hostprogs-m is used")
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>


As Stephen Rothwell reported
(https://lkml.org/lkml/2020/5/3/392),
this warning appears by merging the
two different trees.


You sent this patch to the kbuild maintainers,
but samples/watch_queue/Makefile does not exist
in the kbuild tree.


Also, please drop the fixes tag.
The commit hash might change.


> ---
>  samples/watch_queue/Makefile | 4 ++--
>  scripts/Makefile.build       | 1 -
>  2 files changed, 2 insertions(+), 3 deletions(-)
>
> diff --git a/samples/watch_queue/Makefile b/samples/watch_queue/Makefile
> index eec00dd0a8df..8511fb6c53d2 100644
> --- a/samples/watch_queue/Makefile
> +++ b/samples/watch_queue/Makefile
> @@ -1,7 +1,7 @@
>  # List of programs to build
> -hostprogs-y := watch_test
> +hostprogs := watch_test
>
>  # Tell kbuild to always build the programs
> -always := $(hostprogs-y)
> +always-y := $(hostprogs)
>
>  HOSTCFLAGS_watch_test.o += -I$(objtree)/usr/include
> diff --git a/scripts/Makefile.build b/scripts/Makefile.build
> index 3665b1a0bc8e..abdba70f33a1 100644
> --- a/scripts/Makefile.build
> +++ b/scripts/Makefile.build
> @@ -15,7 +15,6 @@ obj-y :=
>  obj-m :=
>  lib-y :=
>  lib-m :=
> -always :=
>  always-y :=
>  always-m :=
>  targets :=


Why are you deleting 'always'?
It would immediately break
the downstream Makefiles immediately.



--
Best Regards
Masahiro Yamada
