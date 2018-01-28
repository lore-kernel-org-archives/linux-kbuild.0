Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:20525 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751607AbeA1BlY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 27 Jan 2018 20:41:24 -0500
MIME-Version: 1.0
In-Reply-To: <20180126225900.32206-1-marc.herbert@intel.com>
References: <20171219012656.23728-1-marc.herbert@intel.com> <20180126225900.32206-1-marc.herbert@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 28 Jan 2018 10:40:32 +0900
Message-ID: <CAK7LNATqMao=mP_X0cCj03CoEa=-rnMcokhzaV9jywwXJLMAew@mail.gmail.com>
Subject: Re: [PATCH v3] Remove silentoldconfig from help and docs; fix
 kconfig/conf's help
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marc Herbert <marc.herbert@intel.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Wayne Boyer <wayne.boyer@intel.com>

2018-01-27 7:59 GMT+09:00 Marc Herbert <marc.herbert@intel.com>:
> As explained by Michal Marek at https://lkml.org/lkml/2011/8/31/189
> silentoldconfig has become a misnomer. It has become an internal interface
> so remove it from "make help" and Documentation/ to stop confusing people
> using it as seen for instance at
> https://chromium-review.googlesource.com/835632 Don't remove it from
> kconfig/Makefile yet not to break any (other) tool using it.
>
> On the other hand, correct and expand its description in the help of
> the (internal) scripts/kconfig/conf.c
>
> Signed-off-by: Marc Herbert <marc.herbert@intel.com>
> ---
> v2: rewordings (Masahiro)
> v3: remove from Documentation/ too. Add warning comments in source.
>
>  Documentation/admin-guide/README.rst | 5 -----
>  scripts/kconfig/Makefile             | 7 ++++---
>  scripts/kconfig/conf.c               | 6 ++++--
>  3 files changed, 8 insertions(+), 10 deletions(-)
>
> diff --git a/Documentation/admin-guide/README.rst b/Documentation/admin-guide/README.rst
> index 63066db39910..af5a437198d0 100644
> --- a/Documentation/admin-guide/README.rst
> +++ b/Documentation/admin-guide/README.rst
> @@ -170,11 +170,6 @@ Configuring the kernel
>                          your existing ./.config file and asking about
>                          new config symbols.
>
> -     "make silentoldconfig"
> -                        Like above, but avoids cluttering the screen
> -                        with questions already answered.
> -                        Additionally updates the dependencies.
> -
>       "make olddefconfig"
>                          Like above, but sets new symbols to their default
>                          values without prompting.
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index df6469fd3dcc..a460f9f7b733 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -34,6 +34,8 @@ config: $(obj)/conf
>  nconfig: $(obj)/nconf
>         $< $(silent) $(Kconfig)
>
> +# This has become an internal implementation detail and is now deprecated
> +# for external use.
>  silentoldconfig: $(obj)/conf
>         $(Q)mkdir -p include/config include/generated
>         $(Q)test -e include/generated/autoksyms.h || \
> @@ -142,7 +144,6 @@ help:
>         @echo  '  oldconfig       - Update current config utilising a provided .config as base'
>         @echo  '  localmodconfig  - Update current config disabling modules not loaded'
>         @echo  '  localyesconfig  - Update current config converting local mods to core'
> -       @echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
>         @echo  '  defconfig       - New config with default from ARCH supplied defconfig'
>         @echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
>         @echo  '  allnoconfig     - New config where all options are answered with no'
> @@ -151,8 +152,8 @@ help:
>         @echo  '  alldefconfig    - New config with all symbols set to default'
>         @echo  '  randconfig      - New config with random answer to all options'
>         @echo  '  listnewconfig   - List new options'
> -       @echo  '  olddefconfig    - Same as silentoldconfig but sets new symbols to their'
> -       @echo  '                    default value'
> +       @echo  '  olddefconfig    - Same as oldconfig but sets new symbols to their'
> +       @echo  '                    default value without prompting'
>         @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
>         @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
>         @echo  '  tinyconfig      - Configure the tiniest possible kernel'
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index a8a97efd3dfc..a309ccec1000 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -457,6 +457,7 @@ static void check_conf(struct menu *menu)
>  static struct option long_opts[] = {
>         {"oldaskconfig",    no_argument,       NULL, oldaskconfig},
>         {"oldconfig",       no_argument,       NULL, oldconfig},
> +       /* Has become a misnomer, "syncconfig" would be more accurate */

I removed this line (since nobody is sure about the future),
then applied to linux-kbuild/kconfig.  Thanks!



>         {"silentoldconfig", no_argument,       NULL, silentoldconfig},
>         {"defconfig",       optional_argument, NULL, defconfig},
>         {"savedefconfig",   required_argument, NULL, savedefconfig},
> @@ -484,8 +485,9 @@ static void conf_usage(const char *progname)
>         printf("  --listnewconfig         List new options\n");
>         printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
>         printf("  --oldconfig             Update a configuration using a provided .config as base\n");
> -       printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
> -       printf("  --olddefconfig          Same as silentoldconfig but sets new symbols to their default value\n");
> +       printf("  --silentoldconfig       Similar to oldconfig but generates configuration in\n"
> +              "                          include/{generated/,config/} (oldconfig used to be more verbose)\n");
> +       printf("  --olddefconfig          Same as oldconfig but sets new symbols to their default value\n");
>         printf("  --oldnoconfig           An alias of olddefconfig\n");
>         printf("  --defconfig <file>      New config with default defined in <file>\n");
>         printf("  --savedefconfig <file>  Save the minimal current configuration to <file>\n");
> --
> 2.13.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
