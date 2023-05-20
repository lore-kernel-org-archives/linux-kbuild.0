Return-Path: <linux-kbuild-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6E01C77B7A
	for <linux-kbuild@archiver.kernel.org>; Sat, 20 May 2023 22:41:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230039AbjETWlw (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Sat, 20 May 2023 18:41:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58124 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229621AbjETWlv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 20 May 2023 18:41:51 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B02ACDE;
        Sat, 20 May 2023 15:41:50 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 4B73560C3C;
        Sat, 20 May 2023 22:41:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5CE2C433EF;
        Sat, 20 May 2023 22:41:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1684622509;
        bh=uoMxow7xFBBRRvshKvrIaPvVPMHtBi6h9O2RJF+yIQA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=UNLYWE6OrxkNb/F3fYYUELjZEWqr71e65cwbS36XIMBrM/El6pHDcXTRCYttbaeTN
         Wz/+b3JevKDHS424vwjctXtpOgxNdLj/a3cPVdySMrBr9cgl7LJoTkWIFQdCZ/Yf/f
         Vu9sYuemDxosbs7c45T70Kfrl0IWdIFqN3RnQP+BwhneTpPu+wX6ckowcPzdWGwCa3
         lliab0u+W1dU0quQAmAKlu880cqaJwptvEopyqgiP51Dk6ojwyQH6a4pPyyaSoVzoq
         /5r/8sWCQB8jfUcmRgEmYQiNwOk6HITbw0vse1zLWrjI2+va1vY3HYq7UL3IqJ7fHs
         vqfkoWUC7z/dg==
Received: by mail-oa1-f50.google.com with SMTP id 586e51a60fabf-19a08412723so3785445fac.0;
        Sat, 20 May 2023 15:41:49 -0700 (PDT)
X-Gm-Message-State: AC+VfDzztbbH/9vMQIHoWe+7wo8MlNo2bXHPwDAZU0I6jjJZeRtZLr/R
        pk2ER89dNuO7IRKDa7Is3sXi5vUBU/QlPiG2fl8=
X-Google-Smtp-Source: ACHHUZ7UPfw2OIS0jUpr+b1VZVpyh0jql89BYNScfEw2Su3I8HM3zYJ3+zXIiIUkPBuEdQ+6zIUAlJSuxDuOSL6ZyZc=
X-Received: by 2002:a05:6870:90c2:b0:18e:b6d5:7451 with SMTP id
 s2-20020a05687090c200b0018eb6d57451mr3979310oab.13.1684622508953; Sat, 20 May
 2023 15:41:48 -0700 (PDT)
MIME-Version: 1.0
References: <20230509012616.81579-1-darwi@linutronix.de> <20230515173217.64864-1-darwi@linutronix.de>
In-Reply-To: <20230515173217.64864-1-darwi@linutronix.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 21 May 2023 07:41:12 +0900
X-Gmail-Original-Message-ID: <CAK7LNASPnxnoUmzg43YDcCGP4uor=VO96bmZu3gh3av2BO9wOg@mail.gmail.com>
Message-ID: <CAK7LNASPnxnoUmzg43YDcCGP4uor=VO96bmZu3gh3av2BO9wOg@mail.gmail.com>
Subject: Re: [PATCH v3 0/2] scripts: Resolve gtags empty index generation
To:     "Ahmed S. Darwish" <darwi@linutronix.de>
Cc:     Nathan Chancellor <nathan@kernel.org>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Nicolas Schier <nicolas@fjasle.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-kbuild@vger.kernel.org, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, May 16, 2023 at 2:33=E2=80=AFAM Ahmed S. Darwish <darwi@linutronix.=
de> wrote:
>
> Hi,
>
> v3-changelog
> ------------
>
> Handle review remarks from Masahiro Yamada:
>
>   - Apply shellcheck on new "scripts/tags.sh" code.
>
>   - Shorten code through shell's "default value" parameter expansion.
>
> NEW:
>
>   - Cc docs maintainer (Documentation/process/changes.rst change).
>
> Thanks!
>
> v2-changelog
> ------------
>
> https://lkml.kernel.org/r/20230509012616.81579-1-darwi@linutronix.de
>
> Handle review remarks from Masahiro Yamada:
>
>   - scripts/tags.sh: remove the O=3D language, and focus on the general
>     case of the build directory being different from the kernel source
>     tree, as specified in kernel Makefile L159.
>
>   - Fix failure when build directory is a subdirectory of the kernel
>     source tree.
>
> NEW:
>
>   - Update Documentation/process/changes.rst with new gtags (GNU GLOBAL)
>     requirements.
>
> Thanks!
>
> Cover letter / v1
> -----------------
>
> https://lkml.kernel.org/r/20230504201833.202494-1-darwi@linutronix.de
>
> make gtags for O=3D kernel builds is currently broken. For example, when =
doing:
>
>    make O=3D../build/ x86_64_defconfig
>    make O=3D../build/ gtags
>
> gtags generates a warning for each kernel source file to be indexed:
>
>    make[1]: Entering directory '/home/darwi/build'
>      GEN     gtags
>    Warning: '/home/darwi/linux/arch/x86/include/asm/qspinlock.h' is out o=
f source tree. ignored.
>    Warning: '/home/darwi/linux/arch/x86/include/asm/hpet.h' is out of sou=
rce tree. ignored.
>    ...
>    Warning: '/home/darwi/linux/virt/lib/irqbypass.c' is out of source tre=
e. ignored.
>    make[1]: Leaving directory '/home/darwi/build/'
>
> and then generates an empty index:
>
>    $ du -hs ~/build/G*
>    16K  /home/darwi/build/GPATH
>    16K  /home/darwi/build/GRTAGS
>    16K  /home/darwi/build/GTAGS
>
> This series includes a proposed fix. After applying it:
>
>    $ make O=3D../build/ gtags
>    make[1]: Entering directory '/home/darwi/build'
>      GEN     gtags
>    make[1]: Leaving directory '/home/darwi/build'
>
>    $ du -hs ~/build/G*
>    9.1M /home/darwi/build/GPATH
>    506M /home/darwi/build/GRTAGS
>    696M /home/darwi/build/GTAGS
>
> The generated files can then be integrated with editors or IDEs as
> usual.
>
> =3D>
>
> Ahmed S. Darwish (2):
>   scripts/tags.sh: Resolve gtags empty index generation
>   docs: Set minimal gtags / GNU GLOBAL version to 6.6.5


Both applied. Thanks.




>
>  Documentation/process/changes.rst | 7 +++++++
>  scripts/tags.sh                   | 9 ++++++++-
>  2 files changed, 15 insertions(+), 1 deletion(-)
>
> base-commit: f1fcbaa18b28dec10281551dfe6ed3a3ed80e3d6
> --
> 2.30.2



--=20
Best Regards
Masahiro Yamada
