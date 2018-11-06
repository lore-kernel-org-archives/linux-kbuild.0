Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yb1-f193.google.com ([209.85.219.193]:43429 "EHLO
        mail-yb1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388560AbeKFXXO (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 6 Nov 2018 18:23:14 -0500
Received: by mail-yb1-f193.google.com with SMTP id h187-v6so2993186ybg.10
        for <linux-kbuild@vger.kernel.org>; Tue, 06 Nov 2018 05:57:52 -0800 (PST)
MIME-Version: 1.0
References: <20181102114119.23859-1-anders.roxell@linaro.org> <CAK7LNARda14b9_8Yh7vC2PFa_w=yw+qD0YTriAVQ_Aw5PoXkNw@mail.gmail.com>
In-Reply-To: <CAK7LNARda14b9_8Yh7vC2PFa_w=yw+qD0YTriAVQ_Aw5PoXkNw@mail.gmail.com>
From: Anders Roxell <anders.roxell@linaro.org>
Date: Tue, 6 Nov 2018 14:57:40 +0100
Message-ID: <CADYN=9L2kEVJMiVRBUBU7z4B4_YrvkNefCE5FO3qjACgm=FugA@mail.gmail.com>
Subject: Re: [PATCH] scripts/kconfig/merge_config: don't redefine 'y' to 'm'
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, dvhart@infradead.org, Arnd Bergmann <arnd@arndb.de>

On Mon, 5 Nov 2018 at 09:35, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Hi Anders,
>
> On Fri, Nov 2, 2018 at 8:41 PM Anders Roxell <anders.roxell@linaro.org> wrote:
> >
> > In today's merge_config.sh the order of the config fragment files dictates
> > the output of a config option. With this approach we will get different
> > .config files depending on the order of the config fragment files.
> > Adding a switch to add precedence for builtin over modules, this will
> > make the .config file the same
> >
> > Suggested-by: Arnd Bergmann <arnd@arndb.de>
> > Signed-off-by: Anders Roxell <anders.roxell@linaro.org>
> > ---
>
> I think this patch makes sense.
>
> Just in case, could you please provide me the context of the discussion?

For instance we don't want to force X86 from DRM=y to DRM=m, when
enabling selftest, that would surely break somebody's setup and you also
don't want to force ARM64 from DRM=m to DRM=y, that seems
unnecessary for a big subsystem like DRM.

>
> Does the real problem exist in the kernel tree,

Not that I'm aware about.

Cheers,
Anders

> or for local fragment files?
>
>
> Thanks.
>
>
>
> >  scripts/kconfig/merge_config.sh | 15 ++++++++++++++-
> >  1 file changed, 14 insertions(+), 1 deletion(-)
> >
> > diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> > index da66e7742282..902a60b45614 100755
> > --- a/scripts/kconfig/merge_config.sh
> > +++ b/scripts/kconfig/merge_config.sh
> > @@ -32,6 +32,7 @@ usage() {
> >         echo "  -m    only merge the fragments, do not execute the make command"
> >         echo "  -n    use allnoconfig instead of alldefconfig"
> >         echo "  -r    list redundant entries when merging fragments"
> > +       echo "  -y    make builtin have precedence over modules"
> >         echo "  -O    dir to put generated output files.  Consider setting \$KCONFIG_CONFIG instead."
> >         echo
> >         echo "Used prefix: '$CONFIG_PREFIX'. You can redefine it with \$CONFIG_ environment variable."
> > @@ -40,6 +41,7 @@ usage() {
> >  RUNMAKE=true
> >  ALLTARGET=alldefconfig
> >  WARNREDUN=false
> > +BUILTIN=false
> >  OUTPUT=.
> >  CONFIG_PREFIX=${CONFIG_-CONFIG_}
> >
> > @@ -64,6 +66,11 @@ while true; do
> >                 shift
> >                 continue
> >                 ;;
> > +       "-y")
> > +               BUILTIN=true
> > +               shift
> > +               continue
> > +               ;;
> >         "-O")
> >                 if [ -d $2 ];then
> >                         OUTPUT=$(echo $2 | sed 's/\/*$//')
> > @@ -122,7 +129,13 @@ for MERGE_FILE in $MERGE_LIST ; do
> >                 grep -q -w $CFG $TMP_FILE || continue
> >                 PREV_VAL=$(grep -w $CFG $TMP_FILE)
> >                 NEW_VAL=$(grep -w $CFG $MERGE_FILE)
> > -               if [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
> > +               if test "$BUILTIN" = "true" && echo $PREV_VAL |grep -Eq '^\w+=y' && echo $NEW_VAL |grep -Eq '^\w+=m' ; then
> > +                       echo Value of $CFG is \'y\' and we don\'t want to redefine the fragment $MERGE_FILE:
> > +                       echo Previous  value: $PREV_VAL
> > +                       echo New value:       $NEW_VAL
> > +                       echo Will use previous value.
> > +                       echo
> > +               elif [ "x$PREV_VAL" != "x$NEW_VAL" ] ; then
> >                         echo Value of $CFG is redefined by fragment $MERGE_FILE:
> >                         echo Previous  value: $PREV_VAL
> >                         echo New value:       $NEW_VAL
> > --
> > 2.11.0
> >
>
>
> --
> Best Regards
> Masahiro Yamada
