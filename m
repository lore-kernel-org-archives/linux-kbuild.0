Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:62967 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751656AbeADRWU (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Jan 2018 12:22:20 -0500
MIME-Version: 1.0
In-Reply-To: <20171219012656.23728-1-marc.herbert@intel.com>
References: <20171219012656.23728-1-marc.herbert@intel.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 5 Jan 2018 02:21:30 +0900
Message-ID: <CAK7LNAR8HedCgZAk1fY9rA8HERh5weQCjWXkP2SXuhzRRWVhVQ@mail.gmail.com>
Subject: Re: [PATCH] Remove silentoldconfig from "make help"; fix
 kconfig/conf's help
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marc Herbert <marc.herbert@intel.com>
Cc: Thiago Macieira <thiago.macieira@intel.com>, Josh Triplett <josh@joshtriplett.org>, Guenter Roeck <groeck@google.com>, Wayne Boyer <wayne.boyer@intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

(+CC Michal's new address)

2017-12-19 10:26 GMT+09:00 Marc Herbert <marc.herbert@intel.com>:
> As explained by Michal Marek at https://lkml.org/lkml/2011/8/31/189
> silentoldconfig has become a misnomer. It has become an internal
> interface and "oldconfig" is just as silent now.


Hmm, I'd like to be sure about your intention.

"oldconfig" is not silent.  (nor is silentoldconfig).

When it finds a new symbol, it will show a dialog
to ask users to input a value.

"olddefconfig" is really silent
because it automatically sets new symbols to default.

I agree it is confusing due to the historical misnomer.



> It's not part of the
> user interface so remove it from "make help" to stop confusing people
> trying to use it as seen for instance at
> https://chromium-review.googlesource.com/271688
>
> On the other hand, correct and expand its description in the help of
> scripts/kconfig/conf.c
>
> Signed-off-by: Marc Herbert <marc.herbert@intel.com>
> ---
>  scripts/kconfig/Makefile | 1 -
>  scripts/kconfig/conf.c   | 5 ++++-
>  2 files changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 297c1bf35140..bf13b8fa3ccc 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -142,7 +142,6 @@ help:
>         @echo  '  oldconfig       - Update current config utilising a provided .config as base'
>         @echo  '  localmodconfig  - Update current config disabling modules not loaded'
>         @echo  '  localyesconfig  - Update current config converting local mods to core'
> -       @echo  '  silentoldconfig - Same as oldconfig, but quietly, additionally update deps'
>         @echo  '  defconfig       - New config with default from ARCH supplied defconfig'
>         @echo  '  savedefconfig   - Save current config as ./defconfig (minimal config)'
>         @echo  '  allnoconfig     - New config where all options are answered with no'
> diff --git a/scripts/kconfig/conf.c b/scripts/kconfig/conf.c


A few lines below, I see


        @echo  '  olddefconfig    - Same as silentoldconfig but sets
new symbols to their'
        @echo  '                    default value'


If you drop silentoldconfig help,
the "Same as silentoldconfig" is not sensible.
You need to update this line, too.

I think "Same as oldconfig but ..." will be OK.



> index 866369f10ff8..f8c002a19f62 100644
> --- a/scripts/kconfig/conf.c
> +++ b/scripts/kconfig/conf.c
> @@ -477,7 +477,10 @@ static void conf_usage(const char *progname)
>         printf("  --listnewconfig         List new options\n");
>         printf("  --oldaskconfig          Start a new configuration using a line-oriented program\n");
>         printf("  --oldconfig             Update a configuration using a provided .config as base\n");
> -       printf("  --silentoldconfig       Same as oldconfig, but quietly, additionally update deps\n");
> +       printf("  --silentoldconfig       Similar to oldconfig but:\n"
> +              "                            - no re-formatting of .config when nothing's missing\n"
> +              "                            - generates configuration in include/{generated/,config/}\n"
> +              "                          (oldconfig used to be more verbose)\n");


What do you mean by "oldconfig used to be more verbose" ?

Did oldconfig change its behavior?

Unless I am missing something, the current behavior of "oldconfig" has
been the same
at least since the beginning of the git era.





>         printf("  --olddefconfig          Same as silentoldconfig but sets new symbols to their default value\n");
>         printf("  --oldnoconfig           An alias of olddefconfig\n");
>         printf("  --defconfig <file>      New config with default defined in <file>\n");
> --
> 2.9.5
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
