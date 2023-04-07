Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2AC7EC77B6C
	for <linux-kbuild@archiver.kernel.org>; Fri,  7 Apr 2023 19:02:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231664AbjDGTCn (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 7 Apr 2023 15:02:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53798 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229604AbjDGTCa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Apr 2023 15:02:30 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5FFB9658B
        for <linux-kbuild@vger.kernel.org>; Fri,  7 Apr 2023 12:01:42 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id l7so40432347pjg.5
        for <linux-kbuild@vger.kernel.org>; Fri, 07 Apr 2023 12:01:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680894102; x=1683486102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=tum+O6CyYNU9vxjDy5o4+muJLyeV+iHYQTeNzCfrbAg=;
        b=IutiCCfJNbXQRW4jPMJUgc6kYMEcyD4cLm5OXtRQ4ufmsbInVPO/XOMbc4NAriredr
         Uj8Udl8DMss1tsFPUvbBNVIJDEWiA8z8WhuNXioG0BTTyqPQyfz7JOXhJmdDyrI5+9WC
         kjz6ykYBjksO0H+W5ngqC4v7+I5PNI3J1bFDGGY79ElET5kkqNHAfY2qNfuYLqoe4BXt
         p5jYZ+1nw2xhlR7D43N//+XS3W5/OQl4sKMxnjUziswnaU21Iyrxx/R6ncKsSZW7R/VZ
         MXv4mAmqVCkGfRsKd0eaWCUlxig/bS7eAPRb4pKfXGuha/UI3gAkYJ3k+LCp5pi6BC8v
         5yUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680894102; x=1683486102;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=tum+O6CyYNU9vxjDy5o4+muJLyeV+iHYQTeNzCfrbAg=;
        b=1eUAJ99NWkfix4HHhRnSH4h0DkYlElYM6nNydgpSasjji7qDAYzcUIU3Cf6sH6TWpP
         BBCZNIETxf0Y3qbZfQfMhO4Um+pbTNobYjD0eWAwxeO4uY7WEbnS925+YXfubtTz19ZM
         psK7sbO5dABKO099Erx9J66AOaq0lG/UW+6FYdUd2rtwMnswiIAG/KrV3XjIr9QWKK8J
         dZgVvTyvJQv13ofAQkg2tHnBH7M0MUyyRGsKc7A8I2w+sYzVrk7YUEkdELqHDrIOs4RL
         yxSQIW64vTGmKpKXUElFHxbyX0ZEIR3F7QKdsVZFiJZNaZc/P/4gT2Dyvvnm0+s2Fy/o
         DjYw==
X-Gm-Message-State: AAQBX9c4edeyt1HIYqW4z7r35PMbR7ble3wWk+b1CNO66Pyx3NbGdLNK
        U1oRhDGZ19foEiFYlqpFC5KKacDBpoAGWkLxndrMpA==
X-Google-Smtp-Source: AKy350YrYdB6eGsFu0WQiDgBGiIvg945AOZkNqG0bN0hlvobD3ezuDMHmgAX5qc9bmvTurgUilGaMEN0UERJBC8atFg=
X-Received: by 2002:a17:902:da85:b0:19f:2aa4:b1e5 with SMTP id
 j5-20020a170902da8500b0019f2aa4b1e5mr1242606plx.2.1680894101624; Fri, 07 Apr
 2023 12:01:41 -0700 (PDT)
MIME-Version: 1.0
References: <20230308115243.82592-1-masahiroy@kernel.org> <20230308115243.82592-3-masahiroy@kernel.org>
 <CAKwvOdnmiL_wDgzepYb+ZGgWt2xnsp48-awn0Cd0c4RDR43t_Q@mail.gmail.com>
In-Reply-To: <CAKwvOdnmiL_wDgzepYb+ZGgWt2xnsp48-awn0Cd0c4RDR43t_Q@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 7 Apr 2023 12:01:30 -0700
Message-ID: <CAKwvOdn1Sjj=t1XJ3K-etFnemMs7UkbyGmbHC4c2H4O=77sjHg@mail.gmail.com>
Subject: Re: [PATCH 3/8] scripts/mksysmap: use sed with in-line comments
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Zhen Lei <thunder.leizhen@huawei.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Apr 7, 2023 at 11:59=E2=80=AFAM Nick Desaulniers
<ndesaulniers@google.com> wrote:
>
> On Wed, Mar 8, 2023 at 3:53=E2=80=AFAM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
> >
> > Move comments close to the code.
>
> Consider adding to the commit message why you switch from grep to sed;
> that's currently unclear.
> Reviewed-by: Nick Desaulniers <ndesaulniers@google.com>

Also, perhaps scripts/mksysmap could just be replaced with a sed
input-file? Then
scripts/link-vmlinux.sh would invoke nm and pipe it into that sed script?

>
> Orthogonal to this patch, don't .L prefixed local symbols not have
> entries in the symbol table? If they're not printed with nm, why
> filter them out (since they're impossible).
>
> >
> > Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> > ---
> >
> >  scripts/mksysmap | 61 +++++++++++++++++++++++++++++-------------------
> >  1 file changed, 37 insertions(+), 24 deletions(-)
> >
> > diff --git a/scripts/mksysmap b/scripts/mksysmap
> > index 697fc6653953..8ea1955e03c6 100755
> > --- a/scripts/mksysmap
> > +++ b/scripts/mksysmap
> > @@ -10,32 +10,45 @@
> >  #####
> >  # Generate System.map (actual filename passed as second argument)
> >
> > -# For System.map filter away:
> > -#   a - local absolute symbols
> > -#   U - undefined global symbols
> > -#   N - debugging symbols
> > -#   w - local weak symbols
> > -
> >  # readprofile starts reading symbols when _stext is found, and
> >  # continue until it finds a symbol which is not either of 'T', 't',
> >  # 'W' or 'w'.
> >  #
> > -# Ignored prefixes:
> > -#  $                    - local symbols for ARM, MIPS, etc.
> > -#  .L                   - local labels, .LBB,.Ltmpxxx,.L__unnamed_xx,.=
LASANPC, etc.
> > -#  __crc_               - modversions
> > -#  __kstrtab_           - EXPORT_SYMBOL (symbol name)
> > -#  __kstrtabns_         - EXPORT_SYMBOL (namespace)
> > +
> > +${NM} -n ${1} | sed >${2} -e "
> > +# --------------------------------------------------------------------=
-------
> > +# Ignored symbol types
> >  #
> > -# Ignored symbols:
> > -#  L0                   - for LoongArch?
> > -
> > -$NM -n $1 | grep -v            \
> > -       -e ' [aNUw] '           \
> > -       -e ' \$'                \
> > -       -e ' \.L'               \
> > -       -e ' __crc_'            \
> > -       -e ' __kstrtab_'        \
> > -       -e ' __kstrtabns_'      \
> > -       -e ' L0$'               \
> > -> $2
> > +
> > +# a: local absolute symbols
> > +# N: debugging symbols
> > +# U: undefined global symbols
> > +# w: local weak symbols
> > +/ [aNUw] /d
> > +
> > +# --------------------------------------------------------------------=
-------
> > +# Ignored prefixes
> > +#  (do not forget a space before each pattern)
> > +
> > +# local symbols for ARM, MIPS, etc.
> > +/ \$/d
> > +
> > +# local labels, .LBB, .Ltmpxxx, .L__unnamed_xx, .LASANPC, etc.
> > +/ \.L/d
> > +
> > +# CRC from modversions
> > +/ __crc_/d
> > +
> > +# EXPORT_SYMBOL (symbol name)
> > +/ __kstrtab_/d
> > +
> > +# EXPORT_SYMBOL (namespace)
> > +/ __kstrtabns_/d
> > +
> > +# --------------------------------------------------------------------=
-------
> > +# Ignored symbols (exact match)
> > +#  (do not forget a space before and '$' after each pattern)
> > +
> > +# for LoongArch?
> > +/ L0$/d
> > +"
> > --
> > 2.34.1
> >
>
>
> --
> Thanks,
> ~Nick Desaulniers



--=20
Thanks,
~Nick Desaulniers
