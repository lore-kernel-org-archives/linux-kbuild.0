Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:45856 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728227AbfKDCVJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Nov 2019 21:21:09 -0500
MIME-Version: 1.0
References: <20191029181702.21460-1-labbott@redhat.com>
In-Reply-To: <20191029181702.21460-1-labbott@redhat.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 4 Nov 2019 11:20:25 +0900
Message-ID: <CAK7LNAQV2X94rQP4exP8Kujjm-6FAt_pHoGF6dtHx5qZgAWDxg@mail.gmail.com>
Subject: Re: [RFC PATCH] kconfig: Add option to get the full help text with listnewconfig
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Laura Abbott <labbott@redhat.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jeremy Cline <jcline@redhat.com>, Don Zickus <dzickus@redhat.com>

On Wed, Oct 30, 2019 at 3:17 AM Laura Abbott <labbott@redhat.com> wrote:
>
> make listnewconfig will list the individual options that need to be set.
> This is useful but there's no easy way to get the help text associated
> with the options at the same time. Introduce a new targe
> 'make extendedlistnewconfig' which lists the full help text of all the
> new options as well. This makes it easier to automatically generate
> changes that are easy for humans to review. This command also adds
> markers between each option for easier parsing.
>
> Signed-off-by: Laura Abbott <labbott@redhat.com>
> ---
> Red Hat has been relying on some external libraries that have a tendency
> to break to get the help text for all new config options. I'd really
> like an in tree way to get the help text so we can automatically
> generate patches for people to reveiw new config options. I'm open to
> other approaches that let us script getting the help text as well.

I am not familiar with the workflow in Red Hat.
I cannot propose another approach.


I am not a big fan of the target name.
'extendedlistnewconfig' is so long that it breaks the
alignment of 'make help'.
Maybe 'helpnewconfig' is understandable
although I am open to discussion for a better name.


BTW, did you check how the newly-added 'choice' was displayed?
Its help message is displayed, but the choice has no name.
So, people might be confused what the help message is talking about.




> ---
>  scripts/kconfig/Makefile |  5 ++++-
>  scripts/kconfig/conf.c   | 13 ++++++++++++-
>  2 files changed, 16 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index ef2f2336c469..aaaf1f62300c 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -66,7 +66,9 @@ localyesconfig localmodconfig: $(obj)/conf
>  #  syncconfig has become an internal implementation detail and is now
>  #  deprecated for external use
>  simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
> -       alldefconfig randconfig listnewconfig olddefconfig syncconfig
> +       alldefconfig randconfig listnewconfig olddefconfig syncconfig \
> +       extendedlistnewconfig
> +
>  PHONY += $(simple-targets)
>
>  $(simple-targets): $(obj)/conf
> @@ -134,6 +136,7 @@ help:
>         @echo  '  alldefconfig    - New config with all symbols set to default'
>         @echo  '  randconfig      - New config with random answer to all options'
>         @echo  '  listnewconfig   - List new options'
> +       @echo  '  extendedlistnewconfig   - List new options'
>         @echo  '  olddefconfig    - Same as oldconfig but sets new symbols to their'
>         @echo  '                    default value without prompting'
>         @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c
> index 40e16e871ae2..7aeb77374d9a 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -32,6 +32,7 @@ enum input_mode {
>         defconfig,
>         savedefconfig,
>         listnewconfig,
> +       extendedlistnewconfig,
>         olddefconfig,
>  };
>  static enum input_mode input_mode = oldaskconfig;
> @@ -434,6 +435,11 @@ static void check_conf(struct menu *menu)
>                                                 printf("%s%s=%s\n", CONFIG_, sym->name, str);
>                                         }
>                                 }
> +                       } else if (input_mode == extendedlistnewconfig) {
> +                               printf("-----\n");
> +                               print_help(menu);
> +                               printf("-----\n");
> +
>                         } else {
>                                 if (!conf_cnt++)
>                                         printf("*\n* Restart config...\n*\n");
> @@ -459,6 +465,7 @@ static struct option long_opts[] = {
>         {"alldefconfig",    no_argument,       NULL, alldefconfig},
>         {"randconfig",      no_argument,       NULL, randconfig},
>         {"listnewconfig",   no_argument,       NULL, listnewconfig},
> +       {"extendedlistnewconfig",   no_argument,       NULL, extendedlistnewconfig},
>         {"olddefconfig",    no_argument,       NULL, olddefconfig},
>         {NULL, 0, NULL, 0}
>  };
> @@ -469,6 +476,7 @@ static void conf_usage(const char *progname)
>         printf("Usage: %s [-s] [option] <kconfig-file>\n", progname);
>         printf("[option] is _one_ of the following:\n");
>         printf("  --listnewconfig         List new options\n");
> +       printf("  --extendedlistnewconfig List new options and help text\n");
>         printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
>         printf("  --oldconfig             Update a configuration using a provided .config as base\n");
>         printf("  --syncconfig            Similar to oldconfig but generates configuration in\n"
> @@ -543,6 +551,7 @@ int main(int ac, char **av)
>                 case allmodconfig:
>                 case alldefconfig:
>                 case listnewconfig:
> +               case extendedlistnewconfig:
>                 case olddefconfig:
>                         break;
>                 case '?':
> @@ -576,6 +585,7 @@ int main(int ac, char **av)
>         case oldaskconfig:
>         case oldconfig:
>         case listnewconfig:
> +       case extendedlistnewconfig:
>         case olddefconfig:
>                 conf_read(NULL);
>                 break;
> @@ -657,6 +667,7 @@ int main(int ac, char **av)
>                 /* fall through */
>         case oldconfig:
>         case listnewconfig:
> +       case extendedlistnewconfig:
>         case syncconfig:
>                 /* Update until a loop caused no more changes */
>                 do {
> @@ -675,7 +686,7 @@ int main(int ac, char **av)
>                                 defconfig_file);
>                         return 1;
>                 }
> -       } else if (input_mode != listnewconfig) {
> +       } else if (input_mode != listnewconfig && input_mode != extendedlistnewconfig) {
>                 if (!no_conf_write && conf_write(NULL)) {
>                         fprintf(stderr, "\n*** Error during writing of the configuration.\n\n");
>                         exit(1);
> --
> 2.21.0
>


-- 
Best Regards
Masahiro Yamada
