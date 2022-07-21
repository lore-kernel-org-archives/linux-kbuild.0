Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EECECC433EF
	for <linux-kbuild@archiver.kernel.org>; Thu, 21 Jul 2022 14:27:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231552AbiGUO1t (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 21 Jul 2022 10:27:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43594 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231472AbiGUO1s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 21 Jul 2022 10:27:48 -0400
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF0E382388
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jul 2022 07:27:47 -0700 (PDT)
Received: by mail-lf1-x12b.google.com with SMTP id a9so3031880lfk.11
        for <linux-kbuild@vger.kernel.org>; Thu, 21 Jul 2022 07:27:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vVPqdnUfLoXatTXc15bcg0nhUyjA2e3G5yJNqLlYJCQ=;
        b=MqOKGHlFubPD3KsBefcVz9F6wXbCvDSAEF4Ezkx7YkU9R3TQO9bDXREtmH/oGHtvod
         1giSYYH2lrsBuxeDOpfOc/PuuswDwFjosAOjvqaVqV46inoMMJ6HhqErhxWOjX7KS9+A
         r3bKAxeW9OA98aKOYKGKqim9/qyxfpMD2AqFMv01kFdT/5NqXpdcpj54E8z1e//nEWBu
         F6fEUywVgpya+D0TvVmnOyrdQHUx/Gd+0BIrhgu/YS1dkFY3ozbr7NxIXE6/GZqbahlX
         iyouIzFROTE+w99RDbQqdA2PGYvvjDZXwFuLYZW/GUVMXVzXunnU042ha9wxUnRaxQUl
         01ow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vVPqdnUfLoXatTXc15bcg0nhUyjA2e3G5yJNqLlYJCQ=;
        b=vwNmF93MGVnuqscAQ+HEWxv5eNNaMoguccA5iUOjPQZYAeA6C3i2QePiz1TatniWCS
         SAIiWgDR9+B5LnWgb5we380xiLuPzirj1vndH4b92ao54wMONeLOFtYw+QOfzvpc6O7b
         50IpjXUXq/9pHizu5ei4mHjndEGnAiLxIjjjqza73CHqpPHfNEFFu41l/UlIED6/Eayj
         RESQ+FUhmVMmruC26PFwq/tSeWqbTHzpEHNXEgMbvm5uyQ1ToKbDP2jHrowDza9z6EvP
         5fuly7w47jzJKa2Q9XlGrb9RvRFHzPmCuu4ku1TIVghOf2iEQg5f5+WawmYzPfibI6rw
         bT7A==
X-Gm-Message-State: AJIora/okDESW/YzuiZM3fZahONIOiku5kYqCRTgWbXJWfF92ddRriMQ
        wOWRJiA7iVZemRVa5G/3cIqX7arWaXn5KuXVE8rmCg==
X-Google-Smtp-Source: AGRyM1udVa2irl52OVMBnbqGFxA+aMG+iMRiI2R2lJXR6gMSb6uY94C6ywicucAlyyZxSxAiMOnEbLUPonXlaBWfboM=
X-Received: by 2002:a19:7902:0:b0:48a:6872:68ab with SMTP id
 u2-20020a197902000000b0048a687268abmr1918109lfc.626.1658413665896; Thu, 21
 Jul 2022 07:27:45 -0700 (PDT)
MIME-Version: 1.0
References: <20220720232332.2720091-1-justinstitt@google.com>
In-Reply-To: <20220720232332.2720091-1-justinstitt@google.com>
From:   Nick Desaulniers <ndesaulniers@google.com>
Date:   Thu, 21 Jul 2022 07:27:34 -0700
Message-ID: <CAKwvOdnSjyOdCZZ9AegCyfns3bvH3fbtbVgdThO2+rJAE=1bag@mail.gmail.com>
Subject: Re: [PATCH] Makefile.extrawarn: re-enable -Wformat for clang
To:     Masahiro Yamada <masahiroy@kernel.org>,
        Nathan Chancellor <nathan@kernel.org>,
        Tom Rix <trix@redhat.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org,
        llvm@lists.linux.dev, Justin Stitt <justinstitt@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Jul 20, 2022 at 4:23 PM Justin Stitt <justinstitt@google.com> wrote:
>
> There's been an ongoing mission to re-enable the -Wformat warning for
> Clang. A previous attempt at enabling the warning showed that there were
> many instances of this warning throughout the codebase. The sheer amount
> of these warnings really polluted builds and thus -Wno-format was added
> to _temporarily_ toggle them off.
>
> After many patches the warning has largely been eradicated for x86,
> x86_64, arm, and arm64 on a variety of configs. The time to enable the
> warning has never been better as it seems for the first time we are
> ahead of them and can now solve them as they appear rather than tackling
> from a backlog.
>
> As to the root cause of this large backlog of warnings, Clang seems to
> pickup on some more nuanced cases of format warnings caused by implicit
> integer conversion as well as default argument promotions from
> printf-like functions.
>
>
> Link: https://github.com/ClangBuiltLinux/linux/issues/378
> Suggested-by: Nick Desaulniers <ndesaulniers@google.com>
> Signed-off-by: Justin Stitt <justinstitt@google.com>
> ---
> Previous attempt: (https://patchwork.kernel.org/project/linux-kbuild/patch/20190201210853.244043-1-jflat@chromium.org/)
>
> Note:
> For this patch to land on its feet, the plethora of supporting patches that
> fixed various -Wformat warnings need to be picked up. Thanfully, a lot
> of them have!
>
> Here are the patches still waiting to be picked up:
> * https://lore.kernel.org/all/20220718230626.1029318-1-justinstitt@google.com/
> * https://lore.kernel.org/all/20220711222919.2043613-1-justinstitt@google.com/

Hi Masahiro, Nathan, and Tom,
What are your thoughts for _when_ in the release cycle this should be
picked up?  I worry that if we don't remove this soon, we will
backslide, and more -Wformat issues will crop up making removing this
in the future like digging in sand.  Justin has chased down many
instances of this warning, and I'm happy to help clean up fallout from
landing this.

>
>  scripts/Makefile.extrawarn | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index f5f0d6f09053..9bbaf7112a9b 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -47,7 +47,6 @@ else
>
>  ifdef CONFIG_CC_IS_CLANG
>  KBUILD_CFLAGS += -Wno-initializer-overrides
> -KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
>  KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
> --
> 2.37.0.170.g444d1eabd0-goog
>


-- 
Thanks,
~Nick Desaulniers
