Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:56693 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727845AbeKJCCz (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 9 Nov 2018 21:02:55 -0500
MIME-Version: 1.0
References: <1541405976-13747-1-git-send-email-yamada.masahiro@socionext.com> <68478c42-2703-0d24-bf6b-8d75d024722a@mind.be>
In-Reply-To: <68478c42-2703-0d24-bf6b-8d75d024722a@mind.be>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 10 Nov 2018 01:20:44 +0900
Message-ID: <CAK7LNARK1B=yjjWyK9QfOPSQMnWSzhpDxewV6wBCByGn46G-Dg@mail.gmail.com>
Subject: Re: [PATCH v2] kconfig: merge_config: avoid false positive matches
 from comment lines
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnout Vandecappelle <arnout@mind.be>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Petr Vorel <petr.vorel@gmail.com>, nasser afshin <afshin.nasser@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Mon, Nov 5, 2018 at 6:35 PM Arnout Vandecappelle <arnout@mind.be> wrote:
>
>
>
> On 05/11/18 09:19, Masahiro Yamada wrote:
> > The current SED_CONFIG_EXP could match to comment lines in config
> > fragment files, especially when CONFIG_PREFIX_ is empty. For example,
> > Buildroot uses empty prefixing; starting symbols with BR2_ is just
> > convention.
> >
> > Make the sed expression more robust against false positives from
> > comment lines. The new sed expression matches to only valid patterns.
> >
> > Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> > Reviewed-by: Petr Vorel <petr.vorel@gmail.com>
>
> Reviewed-by: Arnout Vandecappelle (Essensium/Mind) <arnout@mind.be>
>
>  Regards,
>  Arnout


Applied to linux-kbuild.



> > ---
> >
> > Changes in v2:
> >   - Another (more precise) implementation approach
> >     based on the option from Arnout Vandecappelle.
> >     This is still easier to read, but adds a bit duplication.
> >
> >  scripts/kconfig/merge_config.sh | 7 ++++---
> >  1 file changed, 4 insertions(+), 3 deletions(-)
> >
> > diff --git a/scripts/kconfig/merge_config.sh b/scripts/kconfig/merge_config.sh
> > index da66e77..0ef9064 100755
> > --- a/scripts/kconfig/merge_config.sh
> > +++ b/scripts/kconfig/merge_config.sh
> > @@ -102,7 +102,8 @@ if [ ! -r "$INITFILE" ]; then
> >  fi
> >
> >  MERGE_LIST=$*
> > -SED_CONFIG_EXP="s/^\(# \)\{0,1\}\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)[= ].*/\2/p"
> > +SED_CONFIG_EXP1="s/^\(${CONFIG_PREFIX}[a-zA-Z0-9_]*\)=.*/\1/p"
> > +SED_CONFIG_EXP2="s/^# \(${CONFIG_PREFIX}[a-zA-Z0-9_]*\) is not set$/\1/p"
> >
> >  TMP_FILE=$(mktemp ./.tmp.config.XXXXXXXXXX)
> >
> > @@ -116,7 +117,7 @@ for MERGE_FILE in $MERGE_LIST ; do
> >               echo "The merge file '$MERGE_FILE' does not exist.  Exit." >&2
> >               exit 1
> >       fi
> > -     CFG_LIST=$(sed -n "$SED_CONFIG_EXP" $MERGE_FILE)
> > +     CFG_LIST=$(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $MERGE_FILE)
> >
> >       for CFG in $CFG_LIST ; do
> >               grep -q -w $CFG $TMP_FILE || continue
> > @@ -159,7 +160,7 @@ make KCONFIG_ALLCONFIG=$TMP_FILE $OUTPUT_ARG $ALLTARGET
> >
> >
> >  # Check all specified config values took (might have missed-dependency issues)
> > -for CFG in $(sed -n "$SED_CONFIG_EXP" $TMP_FILE); do
> > +for CFG in $(sed -n -e "$SED_CONFIG_EXP1" -e "$SED_CONFIG_EXP2" $TMP_FILE); do
> >
> >       REQUESTED_VAL=$(grep -w -e "$CFG" $TMP_FILE)
> >       ACTUAL_VAL=$(grep -w -e "$CFG" "$KCONFIG_CONFIG")
> >



-- 
Best Regards
Masahiro Yamada
