Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:20958 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726062AbfETCOe (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 May 2019 22:14:34 -0400
MIME-Version: 1.0
References: <1558109235-23042-1-git-send-email-yamada.masahiro@socionext.com> <20190520095147.2021c218@canb.auug.org.au>
In-Reply-To: <20190520095147.2021c218@canb.auug.org.au>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 20 May 2019 11:13:48 +0900
Message-ID: <CAK7LNAQc1XjTCo0FdYMxCrGP-iqNj1s464WepCVcxUun3=OvMg@mail.gmail.com>
Subject: Re: [PATCH v3] kbuild: check uniqueness of module names
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd Bergmann <arnd@arndb.de>, Jessica Yu <jeyu@kernel.org>, Lucas De Marchi <lucas.demarchi@intel.com>, Michael Schmitz <schmitzmic@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Rusty Russell <rusty@rustcorp.com.au>, Kees Cook <keescook@chromium.org>, Bernd Petrovitsch <bernd@petrovitsch.priv.at>, Alexander Kapshuk <alexander.kapshuk@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Stephen,

On Mon, May 20, 2019 at 8:52 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Masahiro,
>
> On Sat, 18 May 2019 01:07:15 +0900 Masahiro Yamada <yamada.masahiro@socionext.com> wrote:
> >
> > It checks not only real modules, but also built-in modules (i.e.
> > controlled by tristate CONFIG option, but currently compiled with =y).
> > Non-unique names for built-in modules also cause problems because
> > /sys/modules/ would fall over.
> >
> > I tested allmodconfig on the latest kernel, and it detected the
> > following:
>
> A powerpc ppc64_defconfig produces:
>
> warning: same basename if the following are built as modules:
>   arch/powerpc/platforms/powermac/nvram.ko
>   drivers/char/nvram.ko
>
> Which is a false positive since
> arch/powerpc/platforms/powermac/Makefile has
>
> # CONFIG_NVRAM is an arch. independent tristate symbol, for pmac32 we really
> # need this to be a bool.  Cheat here and pretend CONFIG_NVRAM=m is really
> # CONFIG_NVRAM=y
> obj-$(CONFIG_NVRAM:m=y)         += nvram.o
>
> Which means that this nvram.o will never be built as a module.

Indeed.

I thought it was a good idea to check built-in modules,
but I do not have a good way to avoid false positives.

I think we should not check modules.builtin.
Anyway, allmodconfig has a good test coverage.

The following is the planned fix.
(I folded your sed code.)




diff --git a/scripts/modules-check.sh b/scripts/modules-check.sh
index 2f659530e1ec..39e8cb36ba19 100755
--- a/scripts/modules-check.sh
+++ b/scripts/modules-check.sh
@@ -6,10 +6,10 @@ set -e
 # Check uniqueness of module names
 check_same_name_modules()
 {
-       for m in $(sed 's:.*/::' modules.order modules.builtin | sort | uniq -d)
+       for m in $(sed 's:.*/::' modules.order | sort | uniq -d)
        do
-               echo "warning: same basename if the following are
built as modules:" >&2
-               sed "/\/$m/!d;s:^kernel/:  :" modules.order modules.builtin >&2
+               echo "warning: same module names found:" >&2
+               sed -n "/\/$m/s:^kernel/:  :p" modules.order >&2
        done
 }






> --
> Cheers,
> Stephen Rothwell



--
Best Regards
Masahiro Yamada
