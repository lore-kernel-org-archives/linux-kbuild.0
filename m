Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8D47BC001B0
	for <linux-kbuild@archiver.kernel.org>; Fri, 23 Jun 2023 17:01:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231741AbjFWRBP (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 23 Jun 2023 13:01:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34930 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232039AbjFWRBN (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 23 Jun 2023 13:01:13 -0400
Received: from mail-qv1-xf29.google.com (mail-qv1-xf29.google.com [IPv6:2607:f8b0:4864:20::f29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6E9AA2139
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 10:01:02 -0700 (PDT)
Received: by mail-qv1-xf29.google.com with SMTP id 6a1803df08f44-6300afaa43bso7025726d6.3
        for <linux-kbuild@vger.kernel.org>; Fri, 23 Jun 2023 10:01:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20221208; t=1687539661; x=1690131661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/dlM99jTz0gIzWNzHZYae/5UXMHQsT5HyfAPCdNjMdU=;
        b=COPFGCbdWgPfKO7SIIn4+kqMO5nEodbBRgHirG6fr+G2RNp2stfpv2zHZgJnzwR1hX
         p58W6oyDoyesUbJtbVsW2BVRD0aeUx11FBubT1bovZTNCG6DqP8TdamBo/veYHPjWt41
         n52tIQKedLQrGhad+i8tgGSQKftMX6+9b4xZGkX0NbN7S8EMBl0G37bPAF8Y7+odX0Iv
         SZBvH5iaNE7Nq4a04kyr7LJ/tvQjcU02kbHsGfzM6hcK0yPeKtFXshEbHhJ1z5BvukyP
         zsiJQGtMBucsf3qyl/SbsxO5AsmoZkygQdxHcrCadqWocK463a2RlZaofv+D25M/aLLm
         CMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687539661; x=1690131661;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/dlM99jTz0gIzWNzHZYae/5UXMHQsT5HyfAPCdNjMdU=;
        b=Jb/P9SAdYznD1Nu2ogT27GH69KzHRp9La6AhVXnXzyc7PdVm/+GRwSNeyBRnuyeKan
         gwlo8qbweymPy/4Og3kWb0C9UQEaupfj6xdnbI62nNIyUr4ZfnLrexKQyBkdZWpTPdZp
         YVc6bBxFGkF9SLwZsbZlDXSsiKLgZCVQbpCHW7twz4QhFEYj9chkEyb8YpbQRkmXt8vr
         tC0a0JbSM5Xkkk6ad5aSK4kwGJOeao0nFdz6+KNg+vvFrRJqmGZLh9YZucE0UX7QAaJA
         1g597TMIFfTOSBtg8dM4+dMbnapvaLFTwTKi/+L7iMsh1SwWkeetAtFSl/b9T5o/l/+T
         5H3g==
X-Gm-Message-State: AC+VfDz0DbTV//0KVrDtMiFil8hAXnzZYqxSL/NmsbP16MSwY4n99Rn2
        rAI487Gr7k5eIXFUpQU23DYlGrDPCMI09ro2Vo+/z3YJRqwcLFT2vIc=
X-Google-Smtp-Source: ACHHUZ7vO465vtbEtWDFYf4i7GgEFw4nrH/fPS4X6cE8I48oFYD8QxIVDoW7cOxdgpANlDyacgJnMi74MIU4k1Geo8Y=
X-Received: by 2002:a05:6214:1cc5:b0:62d:e8a2:4d36 with SMTP id
 g5-20020a0562141cc500b0062de8a24d36mr24611581qvd.61.1687539661135; Fri, 23
 Jun 2023 10:01:01 -0700 (PDT)
MIME-Version: 1.0
References: <20230620120521.688124-1-masahiroy@kernel.org> <CAKwvOdmSUkyb_fwDJ-_bKxo65MRWUShc25L5itWt4m4MTYi=yQ@mail.gmail.com>
 <CAK7LNATX+_kr+zKskV7NahpasZBV0P+Ke3g_nW=+vRwcsFL1+g@mail.gmail.com>
In-Reply-To: <CAK7LNATX+_kr+zKskV7NahpasZBV0P+Ke3g_nW=+vRwcsFL1+g@mail.gmail.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Fri, 23 Jun 2023 10:00:50 -0700
Message-ID: <CAKwvOdma76CqngFvrstMX0rBkS6XhHwep3V8dj6==LTGhoXxfw@mail.gmail.com>
Subject: Re: [PATCH 1/3] modpost: factor out inst location calculation to section_rel()
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        Nathan Chancellor <nathan@kernel.org>,
        Nicolas Schier <nicolas@fjasle.eu>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Thu, Jun 22, 2023 at 10:38=E2=80=AFPM Masahiro Yamada <masahiroy@kernel.=
org> wrote:
>
> On Fri, Jun 23, 2023 at 3:25=E2=80=AFAM Nick Desaulniers
> <ndesaulniers@google.com> wrote:
> >
> > On Tue, Jun 20, 2023 at 5:05=E2=80=AFAM Masahiro Yamada <masahiroy@kern=
el.org> wrote:
> > >
> > > diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> > > index 6e0b8be32648..2551ac9d5bd3 100644
> > > --- a/scripts/mod/modpost.c
> > > +++ b/scripts/mod/modpost.c
> > > @@ -1519,17 +1512,20 @@ static void section_rel(struct module *mod, s=
truct elf_info *elf,
> > >                 r_sym =3D ELF_R_SYM(r.r_info);
> > >  #endif
> > >                 r.r_addend =3D 0;
> > > +
> > > +               loc =3D sym_get_data_by_offset(elf, fsecndx, r.r_offs=
et);
> >
> > Can we compute `loc` only for the three machine types?
>
>
>
> I believe you can compute the location in the same way for any architectu=
re
> because it is mentioned in ELF spec.

Sure, but perhaps it's wasted work for other machine types?
--=20
Thanks,
~Nick Desaulniers
