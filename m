Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:17387 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751340AbeBTJ2C (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Feb 2018 04:28:02 -0500
MIME-Version: 1.0
In-Reply-To: <20180216214117.1947175-3-arnd@arndb.de>
References: <20180216214117.1947175-1-arnd@arndb.de> <20180216214117.1947175-3-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 20 Feb 2018 18:26:55 +0900
Message-ID: <CAK7LNARvbsMc3JpcxZjvmc3UjvACx3t66cLM_aSDcADiPA0V7g@mail.gmail.com>
Subject: Re: [PATCH 2/3] Kconfig: improve handling for all{rand,yes,no,}.config
 fragments
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-02-17 6:41 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:
> The kernel currently supports two methods of dealing with config
> fragments in the tree:
>
> a) Running "make foo.config" looks for arch/$(ARCH)/configs/foo.config
>    and kernel/configs/foo.config, and applies the defaults from those
>    files on top of the current configuration.
>
> b) Running "KCONFIG_ALLCONFIG=1 make randconfig" (or the equivalent
>    allmodconfig/allnoconfig/allyesconfig/alldefconfig) will look
>    for a "allrandconfig.config" file in the current directory or the
>    top of the $(srctree). These are used as defaults before we generate
>    the remaining options.
>
> This is rather inconsistent, and prevents us from easily shipping
> good defaults for "randconfig". I'm extending the logic here so that
> the second case also looks for the hardcoded file names in the standard
> directories (first arch/$(ARCH)/configs/, then kernel/configs) in the
> source tree.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  scripts/kconfig/conf.c | 27 +++++++++++++++++++--------
>  1 file changed, 19 insertions(+), 8 deletions(-)
>
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 866369f10ff8..848bf4d15e9a 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -493,8 +493,9 @@ int main(int ac, char **av)
>  {
>         const char *progname = av[0];
>         int opt;
> -       const char *name, *defconfig_file = NULL /* gcc uninit */;
> +       const char *arch, *name, *defconfig_file = NULL /* gcc uninit */;
>         struct stat tmpstat;
> +       char fullname[PATH_MAX+1];
>
>         setlocale(LC_ALL, "");
>         bindtextdomain(PACKAGE, LOCALEDIR);
> @@ -621,14 +622,24 @@ int main(int ac, char **av)
>                 case randconfig:        name = "allrandom.config"; break;
>                 default: break;
>                 }
> -               if (conf_read_simple(name, S_DEF_USER) &&
> -                   conf_read_simple("all.config", S_DEF_USER)) {
> -                       fprintf(stderr,
> -                               _("*** KCONFIG_ALLCONFIG set, but no \"%s\" or \"all.config\" file found\n"),
> -                               name);
> -                       exit(1);
> +               /* try ./name, arch/$(ARCH)/configs/name and kernel/config/name */
> +               if (!conf_read_simple(name, S_DEF_USER))
> +                       break;
> +               arch = getenv("ARCH");
> +               if (arch) {
> +                       snprintf(fullname, sizeof(fullname), "arch/%s/configs/%s",
> +                                arch, name);
> +                       if (!conf_read_simple(fullname, S_DEF_USER))
> +                               break;
>                 }


I am not a big fan of hard-coding the kernel directory structure.

We already do this [1], but I am thinking of kicking this out.
[1] https://github.com/torvalds/linux/blob/v4.16-rc1/scripts/kconfig/confdata.c#L33



BTW, I am trying to compiler capability check to Kconfig.
If this work is done, I hope some "depends on !COMPILE_TEST" will go
away (but not all?)
https://patchwork.kernel.org/patch/10225375/



> -               break;
> +               snprintf(fullname, sizeof(fullname), "kernel/configs/%s", name);
> +               if (!conf_read_simple(fullname, S_DEF_USER))
> +                       break;
> +
> +               fprintf(stderr,
> +                       _("*** KCONFIG_ALLCONFIG set, but no \"%s\" or \"all.config\" file found\n"),
> +                               name);
> +               exit(1);
>         default:
>                 break;
>         }
> --
> 2.9.0
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
