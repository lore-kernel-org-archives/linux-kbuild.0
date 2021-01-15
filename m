Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE6AFC433E0
	for <linux-kbuild@archiver.kernel.org>; Fri, 15 Jan 2021 22:56:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9D7DD23A5A
	for <linux-kbuild@archiver.kernel.org>; Fri, 15 Jan 2021 22:56:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726187AbhAOW4M (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Fri, 15 Jan 2021 17:56:12 -0500
Received: from conssluserg-01.nifty.com ([210.131.2.80]:65424 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726176AbhAOW4L (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 15 Jan 2021 17:56:11 -0500
Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id 10FMt6dg000864;
        Sat, 16 Jan 2021 07:55:06 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-01.nifty.com 10FMt6dg000864
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1610751306;
        bh=tU3QpgIR7dAMQjFdpq4xZQKOTVpUO9pF8byetNqIuts=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=JJNQUmn1r33AS0TDNhY+1vkYpsZhQf1jlaggebtUopI8VWmKpwJL9RUQsh7/MK0gL
         DmIBLcGLRxFSVQ3TSAwvPRc5NCkWmacEJ0K6TZFbHIqzuBkmggktKDsJUXz/fUf1Yy
         7ql+2BFCc0d5l6UaqL9xQxzbdUKjm5ZTCLC3qakCplH+06KyRVRZcznl378OEd9+u3
         9Ti/eEwOfY+7NKmvce3UC11+uRPG2fpoVFK8x0/Gv1be9a7QWgqLbK2Z1+QlDQZqvd
         XFAaiy5LcJaAqHjg7s6AWkhhHohyTWKJqBG2OOlccJMrGkNwwB+afdrvyG+sp7438v
         XyPlcOChjLvaA==
X-Nifty-SrcIP: [209.85.215.174]
Received: by mail-pg1-f174.google.com with SMTP id v19so6920570pgj.12;
        Fri, 15 Jan 2021 14:55:06 -0800 (PST)
X-Gm-Message-State: AOAM531CMau6cbDmPgPrG3EPkHv+basgmyeF1N3tZ4YPWe3NjbGh6Rtn
        1YBrbpDFdBq2pf/Ssj8ah88ublJ84CUG0Pp/8aI=
X-Google-Smtp-Source: ABdhPJxrE6FZsmf6oYLW3dQVpWi2s+K042aYL78TCxGI/M1iTfOwKdJh7VEGVwaliRl/hYOX/vIDvp3VbtG+B4lkUQ4=
X-Received: by 2002:a63:1f1d:: with SMTP id f29mr14851067pgf.47.1610751305777;
 Fri, 15 Jan 2021 14:55:05 -0800 (PST)
MIME-Version: 1.0
References: <20210114042420.229524-1-masahiroy@kernel.org> <CANiq72krA1VrVC2ecUCQFAgJC07od8POjpVUoGFYJOHjZ23ckQ@mail.gmail.com>
In-Reply-To: <CANiq72krA1VrVC2ecUCQFAgJC07od8POjpVUoGFYJOHjZ23ckQ@mail.gmail.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sat, 16 Jan 2021 07:54:28 +0900
X-Gmail-Original-Message-ID: <CAK7LNASc-3ADgKnM=GiHbXwAo1cYFVL3o6SuWcunsLcrTU8t7Q@mail.gmail.com>
Message-ID: <CAK7LNASc-3ADgKnM=GiHbXwAo1cYFVL3o6SuWcunsLcrTU8t7Q@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: check the minimum compiler version in Kconfig
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Paul Gortmaker <paul.gortmaker@windriver.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Nathan Chancellor <natechancellor@gmail.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Will Deacon <will@kernel.org>,
        clang-built-linux <clang-built-linux@googlegroups.com>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Fri, Jan 15, 2021 at 3:15 AM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
>
> On Thu, Jan 14, 2021 at 5:25 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
> >
> > The cc-version.sh also shows the error if the compiler is old:
> >
> >   $ make defconfig CC=clang-9
> >   *** Default configuration is based on 'x86_64_defconfig'
> >   ***
> >   *** Compiler is too old.
> >   ***   Your Clang version:    9.0.1
> >   ***   Minimum Clang version: 10.0.1
> >   ***
> >   scripts/Kconfig.include:46: Sorry, this compiler is unsupported.
>
> That looks nice. Hopefully we can do the same approach for other tools too!


Yes, I plan to merge scripts/ld-version.sh and scripts/lld-version.sh
in a similar way, and move the version check as well
once the following cleanups land in the upstream:

https://patchwork.kernel.org/project/linux-kbuild/patch/20201212165431.150750-1-masahiroy@kernel.org/
https://patchwork.kernel.org/project/linux-kbuild/patch/20201212165431.150750-2-masahiroy@kernel.org/


> > I put the stub for ICC because I see <linux/compiler-intel.h> although
> > I am not sure if building the kernel with ICC is well-supported.
>
> I doubt it, and there seems to be no maintainer listed either. I think
> it could be considered for removal in an RFC.


Yes, but that would require higher level acks,
and consult x86 and intel folks.

Please let this patch land first,
then we will discuss whether ICC is still used or not.




> Cheers,
> Miguel



-- 
Best Regards
Masahiro Yamada
