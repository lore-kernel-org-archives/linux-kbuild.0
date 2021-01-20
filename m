Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-22.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	HK_RANDOM_FROM,INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F81CC433DB
	for <linux-kbuild@archiver.kernel.org>; Wed, 20 Jan 2021 19:47:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0666123442
	for <linux-kbuild@archiver.kernel.org>; Wed, 20 Jan 2021 19:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2392751AbhATTrU (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Wed, 20 Jan 2021 14:47:20 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36758 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392747AbhATTrJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 20 Jan 2021 14:47:09 -0500
Received: from mail-lj1-x22f.google.com (mail-lj1-x22f.google.com [IPv6:2a00:1450:4864:20::22f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 412F4C0613C1
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jan 2021 11:46:29 -0800 (PST)
Received: by mail-lj1-x22f.google.com with SMTP id m13so27437859ljo.11
        for <linux-kbuild@vger.kernel.org>; Wed, 20 Jan 2021 11:46:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=cFHJdUapSoVhdUghbxlYeo9pMjEfQfGRi/V18TA9Reg=;
        b=QGZ0bsmlkdvw0IfJQSDlOczYy/CHvc/ks4M10iJcX4NkXMF/u+hfnZi+3XhRtNoUSv
         2NWB4iamwKg4X/Tmq0yaIddKk/veC5bZ2sS8XsK05G43sVt2rIoXISaexRYJumyKbQ4Q
         IMs4Ro2BlOyIYuo2B9WF73+XnoOcyL6IhkYW25siuUiQ02ZfS+QWbQ8RxfDfSdPmc+0q
         aHIAJ07UJcdcyeRbHCbcTuVp2VqbQRHyOj4NKU5BtNvNgn65j4P9bic+0HvepH/uP4Kb
         EXxS3Om1Xt2bkqJdd1K//tGTCFAHsSaEN3LSzdErnpgi3RMzCE/5gl1Alh2P+ZClWzoK
         CZUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=cFHJdUapSoVhdUghbxlYeo9pMjEfQfGRi/V18TA9Reg=;
        b=aTVsq3wuhyeH+x7pz2yQAtM+iGu8jO8x1S1/fk+w1RUoJbqbu44kkxiG318lz3iKAZ
         5exejJaEkNJEo94v+c86FyI/Mgrf8T1Gan3dAQVmz8erdhl8bBxRNg2ofusBdBsL/pAw
         KRRwnQVHD+lHgwp/RgQjlYTPuC5R3D9j5tBAWh+cSp3OZB0o3juPHgSxDM75psWjYKmT
         8a00j9fFFxVGAAZglBnA8xPekj2imcQz6y0xTd9h4UxM+uYXqDSesm55fEFOf5u5CL+h
         /18GEFTu321/O04GwHbIF849qf32/cb4LUUQvubxAgLrPW2QtPEN92UOG3YFLG25hlxp
         0eVw==
X-Gm-Message-State: AOAM53310FeL2y5A9AjY2arqYA6+y/PhRUorL4bdOuJxmKXwRiD1JnJ0
        V6np0s1vudciVfZzua0uHeI85drmgu0d29ElC0+umg==
X-Google-Smtp-Source: ABdhPJxdoS5/L4qsJrqqavtK+vSQiLTVx5lASjGy6I/jl5fTjcCj/eYO3tOU+Rh0h67FwntQ8oCgXYpCKONrviHu/bw=
X-Received: by 2002:a2e:7d09:: with SMTP id y9mr3621669ljc.6.1611171987607;
 Wed, 20 Jan 2021 11:46:27 -0800 (PST)
MIME-Version: 1.0
References: <20210120193100.3414664-1-masahiroy@kernel.org>
In-Reply-To: <20210120193100.3414664-1-masahiroy@kernel.org>
From:   Will McVicker <willmcvicker@google.com>
Date:   Wed, 20 Jan 2021 11:46:11 -0800
Message-ID: <CABYd82a7ouPhEB95aETy0FDf8KpiNx+DFZB6wdSjWLvvukna8A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: warn a relative path used for M= in out-of-tree builds
To:     Masahiro Yamada <masahiroy@kernel.org>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "Cc: Android Kernel" <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

CC: kernel-team@android.com

Thanks Masahiro!

I'd like to also note that the Android kernel build system is
leveraging this behaviour as sort of an "O=" for external modules [1].
This way the external module's build artifacts are contained separate
from the kernel build artifacts and the module's source code.

--Will

[1] https://android.googlesource.com/kernel/build/+/refs/heads/master/build.sh#748

On Wed, Jan 20, 2021 at 11:31 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> Surprising to me, Kbuild can handle a relative M= path while having
> in-kernel objects in a separate directory. In this case, the M= option
> actually defines:
>
>  - the path to external module sources relative to $(srctree)
>  - the path to external module objects relative to $(objtree)
>
> For example,
>
>   make O=foo/bar M=baz
>
> ... will find the source files in baz, and create objects in foo/bar/baz.
>
> Currently, it works like that because of the presence of VPATH and
> --include-dir=$(abs_srctree), but this behavior is subtle and cannot
> be guaranteed in the future. I do not know if it was even officially
> supported ever.
>
> I do not recommend this usage.
>
> Reported-by: Will McVicker <willmcvicker@google.com>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>
>  Makefile | 7 +++++++
>  1 file changed, 7 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index b0e4767735dc..e42a27447eae 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1699,6 +1699,13 @@ else # KBUILD_EXTMOD
>  #                      Install the modules built in the module directory
>  #                      Assumes install directory is already created
>
> +ifdef building_out_of_srctree
> +ifneq ($(filter-out /%, $(KBUILD_EXTMOD)),)
> +$(warning The combination of out-of-tree build and relative M= path is not well supported.)
> +$(warning Please do not complain about any trouble happening under this circumstance.)
> +endif
> +endif
> +
>  # We are always building only modules.
>  KBUILD_BUILTIN :=
>  KBUILD_MODULES := 1
> --
> 2.27.0
>
