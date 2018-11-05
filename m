Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:29632 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726086AbeKERxf (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 5 Nov 2018 12:53:35 -0500
MIME-Version: 1.0
References: <20181102114119.23859-1-anders.roxell@linaro.org>
In-Reply-To: <20181102114119.23859-1-anders.roxell@linaro.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 5 Nov 2018 17:34:21 +0900
Message-ID: <CAK7LNARda14b9_8Yh7vC2PFa_w=yw+qD0YTriAVQ_Aw5PoXkNw@mail.gmail.com>
Subject: Re: [PATCH] scripts/kconfig/merge_config: don't redefine 'y' to 'm'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anders Roxell <anders.roxell@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dvhart@infradead.org, Arnd Bergmann <arnd@arndb.de>

Hi Anders,

On Fri, Nov 2, 2018 at 8:41 PM Anders Roxell <anders.roxell@linaro.org> wrote:
>
> In today's merge_config.sh the order of the config fragment files dictates
> the output of a config option. With this approach we will get different
> .config files depending on the order of the config fragment files.
> Adding a switch to add precedence for builtin over modules, this will
> make the .config file the same
>
> Suggested-by: Arnd Bergmann <arnd@arndb.de>
> Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> ---

I think this patch makes sense.

Just in case, could you please provide me the context of the discussion?

Does the real problem exist in the kernel tree,
or for local fragment files?


Thanks.



>  scripts/kconfig/merge_config.sh | 15 ++++++++++++++-
>  1 file changed, 14 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> index da66e7742282..902a60b45614 100755
> --- a/scripts/kconfig/merge_config.sh
> +++ b/scripts/kconfig/merge_config.sh
> @@ -32,6 +32,7 @@ usage() {
>         echo "  -m    only merge the fragments, do not execute the make command"
>         echo "  -n    use allnoconfig instead of alldefconfig"
>         echo "  -r    list redundant entries when merging fragments"
> +       echo "  -y    make builtin have precedence over modules"
>         echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
>         echo
>         echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
> @@ -40,6 +41,7 @@ usage() {
>  RUNMAKE=true
>  ALLTARGET=alldefconfig
>  WARNREDUN=false
> +BUILTIN=false
>  OUTPUT=.
>  CONFIG_PREFIX=${CONFIG_-CONFIG_}
>
> @@ -64,6 +66,11 @@ while true; do
>                 shift
>                 continue
>                 ;;
> +       "-y")
> +               BUILTIN=true
> +               shift
> +               continue
> +               ;;
>         "-O")
>                 if [ -d $2 ];then
>                         OUTPUT=$(echo $2 | sed 's/\/*$//')
> @@ -122,7 +129,13 @@ for MERGE_FILE in $MERGE_LIST ; do
>                 grep -q -w $CFG $TMP_FILE || continue
>                 PREV_VAL=$(grep -w $CFG $TMP_FILE)
>                 NEW_VAL=$(grep -w $CFG $MERGE_FILE)
> -               if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
> +               if test "$BUILTIN" = "true" && echo $PREV_VAL |grep -Eq '^\w+=y' && echo $NEW_VAL |grep -Eq '^\w+=m' ; then
> +                       echo Value of $CFG is \'y\' and we don\'t want to redefine the fragment $MERGE_FILE:
> +                       echo Previous  value: $PREV_VAL
> +                       echo New value:       $NEW_VAL
> +                       echo Will use previous value.
> +                       echo
> +               elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
>                         echo Value of $CFG is redefined by fragment $MERGE_FILE:
>                         echo Previous  value: $PREV_VAL
>                         echo New value:       $NEW_VAL
> --
> 2.11.0
>


-- 
Best Regards
Masahiro Yamada
