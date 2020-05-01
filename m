Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:62324 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727889AbgEAD2R (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 30 Apr 2020 23:28:17 -0400
MIME-Version: 1.0
References: <20200430131715.32c1a1f6@coco.lan> <CAK7LNASmVoZequqaj6MTimeZ0MG0fk7Wb5-9haFhgG03kDBpxg@mail.gmail.com>
 <20200430184948.27191975@coco.lan> <CAK7LNASx5qfV_6Wow-MVKsHXUX96m8yYvpeK1QVt+2i46FTMNg@mail.gmail.com>
 <20200430211009.3fef03f3@coco.lan> <20200430212511.2115ed98@coco.lan>
In-Reply-To: <20200430212511.2115ed98@coco.lan>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 1 May 2020 12:27:19 +0900
Message-ID: <CAK7LNARA2+S5mjzRucvdJ-zQo6UEAuNi9npJvJB+JcVgh+d_3w@mail.gmail.com>
Subject: Re: [PATCH RFC] Kbuild: Makefile: warn if auto.conf is obsolete
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Media Mailing List <linux-media@vger.kernel.org>

On Fri, May 1, 2020 at 4:25 AM Mauro Carvalho Chehab
<mchehab+huawei@kernel.org> wrote:
>
> A new behavior on more recent kernels require to always call
> "make modules_prepare" after *any* Kconfig changes.


Again, this is the behavior since 2004.

This commit:
https://git.kernel.org/pub/scm/linux/kernel/git/history/history.git/commit/?id=95065ad3fa787c417008a36d3a5d9a3bab17ab98


Shrug if you complain about what has been stable
more than 15 years.


> This is not what a poor mortal would be expecting on a building
> system, as it should, IMHO, be able to detect and auto-run
> whatever is needed to use the newer setup.

No. External module builds should never ever attempt to update
in-tree files.

This is because the build environment for external modules
is usually located in /lib/modules/$(uname -r)/build/,
which is read-only.


A number of upstream developers (ab)use
M= to compile test individual directories,
despite the fact Kbuild supports
the single target 'make drivers/staging/media/stomisp/'



You need to cope with this conflicting comment line:
https://github.com/masahir0y/linux/blob/v5.6/Makefile#L681
since you care if auto.conf is up-to-date.





> Yet, while this is not solved, let's at least stop the build
> and produce a warning, to notify the user about that.
>
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> ---
>
> I would still prefer to call "make modules_prepare" directly,
> on such cases, but just calling "make -C . modules_prepare" doesn't
> work. So, the next best thing would be to at least print a message
> and don't try to do a build with a broken auto.conf file.
>
>  Makefile | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index 70def4907036..492ee2396ab9 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1632,6 +1632,11 @@ $(objtree)/Module.symvers:
>  build-dirs := $(KBUILD_EXTMOD)
>  PHONY += modules
>  modules: descend $(objtree)/Module.symvers
> +       @if [ $(KCONFIG_CONFIG) -nt include/config/auto.conf ]; then \
> +               echo "  WARNING: $(KCONFIG_CONFIG) was modified. Need to run:"; \
> +               echo "           $(MAKE) modules_prepare"; \
> +               exit -1; \
> +       fi
>         $(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost
>
>  PHONY += modules_install








--
Best Regards
Masahiro Yamada
