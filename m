Return-Path: <SRS0=f+jF=D5=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 96AD6C388F2
	for <linux-kbuild@archiver.kernel.org>; Thu, 22 Oct 2020 04:26:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F35C223FB
	for <linux-kbuild@archiver.kernel.org>; Thu, 22 Oct 2020 04:26:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603340776;
	bh=dUUONwRjVQ+9Rmd+g2cHZBV5//UoXj572e4wc4xcsqM=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=pMQL91MPVLH/KSnsZiUtJQXa7S5yNgerQQ0CYmIvoCmDGDQluItq6UVAjs+7JcA4i
	 UN+B4uv+5QtthuQg0lMMZnpVbjcAS3sf7XpY7RJsBV5sB5cmnE9EltXP65zDn7QDuk
	 8P5D8Heo9O0TSoXMWx2lddEzweAn8XdvlQRtp20Q=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726241AbgJVE0P (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 22 Oct 2020 00:26:15 -0400
Received: from conssluserg-05.nifty.com ([210.131.2.90]:27083 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgJVE0P (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 22 Oct 2020 00:26:15 -0400
Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42]) (authenticated)
        by conssluserg-05.nifty.com with ESMTP id 09M4PsEl016572;
        Thu, 22 Oct 2020 13:25:54 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-05.nifty.com 09M4PsEl016572
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1603340754;
        bh=vzE0DYa0Mh/5XavDIbvww++hF0YOvxIWEQOjqM9vGUE=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=mQdTHd4kDDR4mzppnI5r/CsolJzt3ZjhZQ32xMNwUfWfB9RzAcor1bDI5gLwZZpfk
         wlyLedpRfHNV8DobCFvKtGbB5J4ZHZg/67BXMr2RoCpHEssC4VvQJ2/bSSad44AyGQ
         hhWb73klByYYYdg3s0drUbTFRzETYDOzHO0k9aQQQCszcbdcNawcG12nr2eHoovUb+
         byk1nsjIBU1PO+QtY/iURj+dxGNcmbLneLrVhCRQC+NcEDf2YX7zAJoIQHPHLdzJbe
         iFoSd/7dn9tXgLhiMxlh8pQ6Akaapu4DvkCywpkT1Xy0SvuwnVel4gvfgMQv/kmVdR
         hOqIvU3PYRqZA==
X-Nifty-SrcIP: [209.85.216.42]
Received: by mail-pj1-f42.google.com with SMTP id g16so319468pjv.3;
        Wed, 21 Oct 2020 21:25:54 -0700 (PDT)
X-Gm-Message-State: AOAM5329YKWhGmTnBXBFCbIyblSWrtHhv2b+pHJSJmueMmCrIftYn3Tx
        CwIkm8QgJG5WccrMvqKRZQ0Rd/kUnBLgfvtc6zw=
X-Google-Smtp-Source: ABdhPJwmwsnVfVXWHxyKpd8wWr/pKzj7oJc6tMlgWb7SbcdJukke9v7i6LH/bME9DRcGviqrluftnzchEutYDy2Ign0=
X-Received: by 2002:a17:90b:1b12:: with SMTP id nu18mr650440pjb.153.1603340753575;
 Wed, 21 Oct 2020 21:25:53 -0700 (PDT)
MIME-Version: 1.0
References: <20201020093459.GA48796@chrisdown.name>
In-Reply-To: <20201020093459.GA48796@chrisdown.name>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Thu, 22 Oct 2020 13:25:16 +0900
X-Gmail-Original-Message-ID: <CAK7LNAQr8keyEmWgyjy52XfCbCqAyYv_AquBkafFSDVnBHkfAA@mail.gmail.com>
Message-ID: <CAK7LNAQr8keyEmWgyjy52XfCbCqAyYv_AquBkafFSDVnBHkfAA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Use uname for LINUX_COMPILE_HOST detection
To:     Chris Down <chris@chrisdown.name>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Tue, Oct 20, 2020 at 6:35 PM Chris Down <chris@chrisdown.name> wrote:
>
> `hostname` may not be present on some systems as it's not mandated by
> POSIX/SUSv4. This isn't just a theoretical problem: on Arch Linux,
> `hostname` is provided by `inetutils`, which isn't part of the base
> distribution.
>
>     ./scripts/mkcompile_h: line 38: hostname: command not found
>
> Use `uname -n` instead, which is more likely to be available (and
> mandated by standards).
>
> Signed-off-by: Chris Down <chris@chrisdown.name>
> Cc: Masahiro Yamada <masahiroy@kernel.org>
> Cc: Michal Marek <michal.lkml@markovi.net>
> Cc: linux-kbuild@vger.kernel.org
> Cc: linux-kernel@vger.kernel.org
> ---

Applied to linux-kbuild. Thanks.


>  scripts/mkcompile_h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mkcompile_h b/scripts/mkcompile_h
> index baf3ab8d9d49..4ae735039daf 100755
> --- a/scripts/mkcompile_h
> +++ b/scripts/mkcompile_h
> @@ -35,7 +35,7 @@ else
>         LINUX_COMPILE_BY=$KBUILD_BUILD_USER
>  fi
>  if test -z "$KBUILD_BUILD_HOST"; then
> -       LINUX_COMPILE_HOST=`hostname`
> +       LINUX_COMPILE_HOST=`uname -n`
>  else
>         LINUX_COMPILE_HOST=$KBUILD_BUILD_HOST
>  fi
> --
> 2.28.0
>


-- 
Best Regards
Masahiro Yamada
