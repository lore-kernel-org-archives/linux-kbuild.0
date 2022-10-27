Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17250FA3741
	for <linux-kbuild@archiver.kernel.org>; Thu, 27 Oct 2022 15:27:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235650AbiJ0P1O (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Thu, 27 Oct 2022 11:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57682 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235704AbiJ0P1N (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Oct 2022 11:27:13 -0400
Received: from conssluserg-03.nifty.com (conssluserg-03.nifty.com [210.131.2.82])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA7F0173594;
        Thu, 27 Oct 2022 08:27:12 -0700 (PDT)
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id 29RFQmfc020202;
        Fri, 28 Oct 2022 00:26:48 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-03.nifty.com 29RFQmfc020202
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1666884408;
        bh=UR3AXVR+mq01ER8xhmAHFwujS7RJWaCKBlLVtN9TQng=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=G68d+5xuWKRfN6u6K7ZDZq7TnjPFtXPL/7A4HRz9B6vIH7h9WsXg1vVos+YEJbXAP
         osO1Lz0HWYCevfM0MpkjWfUf/1kExBB04vjwcrIVP7E2s/oYCQ17mZ9kfx23se3MJ0
         zIvIfNluaQJS+GJkMFVriHvgScvGDkN8QWrI2Pp3yko3q2wZ3TNu2L81dctsC34/pV
         FEGcAuCsJOPSpga92UdEDl2AT6kuzncUT9bIcGbhnkgJO8npzcEgCJcz6t9V2XpyVF
         +r2xcjVW5R/+TbmcP9nZoT/w0rpEemj/3HWJVxvTC1iuHgFq2esdKU4J+Y2i9RMhzt
         3FrxI5oV2sc/Q==
X-Nifty-SrcIP: [209.85.160.49]
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-13bef14ea06so2511243fac.3;
        Thu, 27 Oct 2022 08:26:48 -0700 (PDT)
X-Gm-Message-State: ACrzQf3fmmtc8R1F4kis9QaF+AUMf9qCAnhCqn6o1iL5nxqBFnTqqmvf
        k4Tb0v+ekgCAIV9gU11cuHCU+sE9EyJsjcxJ41Y=
X-Google-Smtp-Source: AMsMyM6crZeeTQciqytI4ouMJ8XmqYjjtAtMQOylfOh67lXTtolXqPVs5FVq8CtEq+oX2hWAQa90AbZ0KDECXBxgMH4=
X-Received: by 2002:a05:6870:7027:b0:13b:a5b7:165a with SMTP id
 u39-20020a056870702700b0013ba5b7165amr5781124oae.194.1666884407421; Thu, 27
 Oct 2022 08:26:47 -0700 (PDT)
MIME-Version: 1.0
References: <20221025201744.1155260-1-willmcvicker@google.com>
In-Reply-To: <20221025201744.1155260-1-willmcvicker@google.com>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Fri, 28 Oct 2022 00:26:06 +0900
X-Gmail-Original-Message-ID: <CAK7LNARS3dc71fMtmGmt1DqG42ZGsJ_21aUuq7AyWBGNXZFkfA@mail.gmail.com>
Message-ID: <CAK7LNARS3dc71fMtmGmt1DqG42ZGsJ_21aUuq7AyWBGNXZFkfA@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: Use '-f' instead of '--file=' for grep
To:     Will McVicker <willmcvicker@google.com>
Cc:     Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        kernel-team@android.com, linux-kbuild@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Wed, Oct 26, 2022 at 5:18 AM Will McVicker <willmcvicker@google.com> wrote:
>
> The posix grep utility doesn't support the longer '--file=pattern_file'
> command line option which was introduced in commit ce697ccee1a8
> ("kbuild: remove head-y syntax"). Let's update Makefile to use '-f
> pattern_file' to fix the compiling error:
>
>   grep: Unknown option 'file=.../scripts/head-object-list.txt'
>   (see "grep --help")
>
> Signed-off-by: Will McVicker <willmcvicker@google.com>


Thanks, but I had already picked up a similar patch.


https://lore.kernel.org/linux-kbuild/20221017150113.334571-1-newbie13xd@gmail.com/



> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> base-commit: 1a2dcbdde82e3a5f1db9b2f4c48aa1aeba534fb2
>
> diff --git a/Makefile b/Makefile
> index d148a55bfd0f..e90bb2b38607 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1218,7 +1218,7 @@ quiet_cmd_ar_vmlinux.a = AR      $@
>        cmd_ar_vmlinux.a = \
>         rm -f $@; \
>         $(AR) cDPrST $@ $(KBUILD_VMLINUX_OBJS); \
> -       $(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F --file=$(srctree)/scripts/head-object-list.txt)
> +       $(AR) mPiT $$($(AR) t $@ | head -n1) $@ $$($(AR) t $@ | grep -F -f $(srctree)/scripts/head-object-list.txt)
>
>  targets += vmlinux.a
>  vmlinux.a: $(KBUILD_VMLINUX_OBJS) scripts/head-object-list.txt autoksyms_recursive FORCE
> --
> 2.38.0.135.g90850a2211-goog
>


-- 
Best Regards
Masahiro Yamada
