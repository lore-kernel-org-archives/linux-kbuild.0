Return-Path: <SRS0=k9F6=DS=vger.kernel.org=linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 029D6C433E7
	for <linux-kbuild@archiver.kernel.org>; Sun, 11 Oct 2020 13:28:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A686020774
	for <linux-kbuild@archiver.kernel.org>; Sun, 11 Oct 2020 13:28:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602422929;
	bh=hGCPJdnojdr8Agh2G07zMWl1XOsfFg/aSIdxnSvgWgo=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:List-ID:From;
	b=cA2JWl0bIi2tjnAYAl0RT7Qwcz/9zgyF3IUDiqwDRl0sVWhQ62oDLlBPEvNw9DqZ8
	 00LCOyHTDmysCdKqeTHLoZaadcYrlZn/cTDBcFZgIixYZyIqCloLvHl2xWJIwlHUlR
	 1wIV/e2lYjawpOdz6nGbFtMxEPdtEy4Iy7f0HyuI=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387878AbgJKN2t (ORCPT
        <rfc822;linux-kbuild@archiver.kernel.org>);
        Sun, 11 Oct 2020 09:28:49 -0400
Received: from conssluserg-04.nifty.com ([210.131.2.83]:57424 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387876AbgJKN2s (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Oct 2020 09:28:48 -0400
Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id 09BDSGXJ021721;
        Sun, 11 Oct 2020 22:28:17 +0900
DKIM-Filter: OpenDKIM Filter v2.10.3 conssluserg-04.nifty.com 09BDSGXJ021721
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nifty.com;
        s=dec2015msa; t=1602422897;
        bh=C8Evsvimi9w8m58rX03wEYXqN1jjHk8C45kkWA6uLIA=;
        h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
        b=C8lw8hEVGz9yz7ySw+wxk7m73HIG23dsx0n1ch1Wo8CmfLeQZDh5KH7yPZfYzs79f
         OwOSi9BwCDIK0Pe+g2/V6WByLUIhxl9SpXZsoLpVKdvonivZ2RfWEB9ISC5bE+Ne/D
         NWgtJNa4Kv7sgA1Y0LHSBEdGmt6ErM3bemFZEjF2gxQETXYUu8I4hwrNYyj7yL1PS3
         9PxBBo7YD4YxPeGU++f25cou6NH8huivkIkc8rTiqDNGoFx+TcHmyWyd9j61QR+PJW
         HjoptKFaOVEnOB08l6OIs1sA8jT7dOn+f8X8CamAzUMnJEDTjRqC1YSiI7+XpVotx7
         iBVIcYLwIMBxA==
X-Nifty-SrcIP: [209.85.210.176]
Received: by mail-pf1-f176.google.com with SMTP id e7so1962947pfn.12;
        Sun, 11 Oct 2020 06:28:16 -0700 (PDT)
X-Gm-Message-State: AOAM533vxIdT6/4iNNdu78W21u7w5mj6aFLh1hgiMVuSJ4HNC0ezJQMK
        lb1UOK5fJz+onGrLaLmDZrIy1zoZooZdYWFWvBQ=
X-Google-Smtp-Source: ABdhPJzXrZDvB8qN0Hx8fPk9y06ZZDQwlVxpsHCrfJSFMYsWWBuWtlW8dotXO8jB4Xx1j6U8Lscx8rKOs/2psCZSrjw=
X-Received: by 2002:a63:d242:: with SMTP id t2mr10334807pgi.47.1602422896121;
 Sun, 11 Oct 2020 06:28:16 -0700 (PDT)
MIME-Version: 1.0
References: <20201005101026.21951-1-olaf@aepfle.de>
In-Reply-To: <20201005101026.21951-1-olaf@aepfle.de>
From:   Masahiro Yamada <masahiroy@kernel.org>
Date:   Sun, 11 Oct 2020 22:27:39 +0900
X-Gmail-Original-Message-ID: <CAK7LNAS7JB5ddbnTBv2ARmcSCCtkYFeYWKW_R+5zjCEdJ_P6Gg@mail.gmail.com>
Message-ID: <CAK7LNAS7JB5ddbnTBv2ARmcSCCtkYFeYWKW_R+5zjCEdJ_P6Gg@mail.gmail.com>
Subject: Re: [PATCH v1] kbuild: enforce -Werror=return-type
To:     Olaf Hering <olaf@aepfle.de>
Cc:     Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Michal Marek <michal.lkml@markovi.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

On Mon, Oct 5, 2020 at 7:13 PM Olaf Hering <olaf@aepfle.de> wrote:
>
> Catch errors which at least gcc tolerates by default:
>  warning: 'return' with no value, in function returning non-void [-Wreturn-type]
>
> Signed-off-by: Olaf Hering <olaf@aepfle.de>
> ---
>  Makefile | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/Makefile b/Makefile
> index f84d7e4ca0be..7b2e63e7be18 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -942,6 +942,9 @@ KBUILD_CFLAGS   += $(call cc-option,-Werror=date-time)
>  # enforce correct pointer usage
>  KBUILD_CFLAGS   += $(call cc-option,-Werror=incompatible-pointer-types)
>
> +# enforce correct return type
> +KBUILD_CFLAGS   += $(call cc-option,-Werror=return-type)
> +



cc-option is unneeded because the minimal supported versions
of GCC/Clang support -Werror=return-type.

You can hard-code and add it around line 500.



>  # Require designated initializers for all marked structures
>  KBUILD_CFLAGS   += $(call cc-option,-Werror=designated-init)
>


-- 
Best Regards
Masahiro Yamada
