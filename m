Return-Path: <linux-kbuild-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44EA1C433F5
	for <linux-kbuild@archiver.kernel.org>; Mon, 23 May 2022 20:26:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232989AbiEWU0I (ORCPT <rfc822;linux-kbuild@archiver.kernel.org>);
        Mon, 23 May 2022 16:26:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50990 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233150AbiEWU0H (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 23 May 2022 16:26:07 -0400
Received: from mail-io1-xd32.google.com (mail-io1-xd32.google.com [IPv6:2607:f8b0:4864:20::d32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82F8325FE;
        Mon, 23 May 2022 13:26:06 -0700 (PDT)
Received: by mail-io1-xd32.google.com with SMTP id i74so9787123ioa.4;
        Mon, 23 May 2022 13:26:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3BLAGqefFcKnKvrDQkzzllfdtEJDFmKt1hLfJEqkgnw=;
        b=DtD1+J6MZV3anfLnN976u1SvMRB4p3Dv+GFIL2oz2VSCrPQcQszE9qmG45a+XMQz3x
         LBbsWr8WJxvhuFUtvkNLPt3PegpxtJr4gAVZimKb96TyytKTD/gz6wfy5VHS3LwtuNTV
         jX2WvinoI665o4G/AOZz7+6xfaKBT6g8miAdJGjLZB3Cazi3wNXwg7hpl3gA0zzbGtn4
         ysRilot8XAIkQlk7RvSFkp1Ya5PJFx+41DG3NctQbJXAUOAHkUVztYwEa6Qert5CnGQ1
         einJtgHT/+Zd9T59hQde59zDNlAgaTIX1lroraSCp0ail3Put4Z2+W3JpKSWVvCWPR+/
         H7GQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3BLAGqefFcKnKvrDQkzzllfdtEJDFmKt1hLfJEqkgnw=;
        b=l/9nll5kdOo4z3hrBl4s5r4XSezyWrpXubdHB4ZUBstK/BsHl6FXk9IJeIzbkV8Amt
         LvWGmrd3mF1E1dGU+veeWm6jkLi+7nmK4i3wz8BrkAYGzqnp7ZnWwdK4lhqoZsXJgP0D
         uDcw0USvL4XNAZfexWZt/EkmDqe4zBzvUmhxJEBn3bOJ32gffvRWaHP5ZZDjSN9/a5ch
         5ZNjFKVJ8bpZFOgFxsqbYGkq4uZAwAIWw1pvB/Uwe/mrpaRKl4OU7QznVN+6SPWIbBzg
         iQ/6RGiSn0WFYHQGF/zG4YogosBgdpp1XBlIuhPk9oN6zld/aGtt4HOX1RNlaS+SRaGL
         1gqw==
X-Gm-Message-State: AOAM5320GH3vSPM+i2OVVSY/axnz4H9E7w3PHO1XttWcarm4VlYnWCnK
        DiRgmDb//HMYEJCKhsQGVpKhMLFmbyy2f9Snlk0=
X-Google-Smtp-Source: ABdhPJyCkvOTLidTHrw62Wg9JHrwDBE4wyrSaTiPgYgmFPwwAAXuPSf9xiIV/Qgb+mPgIIU99uUs8vla9Hn77s+n27I=
X-Received: by 2002:a05:6638:16cf:b0:32b:6ee7:8d7d with SMTP id
 g15-20020a05663816cf00b0032b6ee78d7dmr12242004jat.256.1653337566001; Mon, 23
 May 2022 13:26:06 -0700 (PDT)
MIME-Version: 1.0
References: <23e0ba7863d51ab629498762a97d477645aeafea.1653123744.git.christophe.jaillet@wanadoo.fr>
In-Reply-To: <23e0ba7863d51ab629498762a97d477645aeafea.1653123744.git.christophe.jaillet@wanadoo.fr>
From:   Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date:   Mon, 23 May 2022 22:25:55 +0200
Message-ID: <CANiq72=GZs5CmAMGAMaHrp1yJ8b7nv3HrsWNeQ42kfy0z5uuAg@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Add an option to enable -O1 and speed-up
 compilation time
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     Dan <dan.carpenter@oracle.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Michal Marek <michal.lkml@markovi.net>,
        Nick Desaulniers <ndesaulniers@google.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        kernel-janitors@vger.kernel.org,
        Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-kbuild.vger.kernel.org>
X-Mailing-List: linux-kbuild@vger.kernel.org

Hi Christophe,

On Mon, May 23, 2022 at 9:11 AM Christophe JAILLET
<christophe.jaillet@wanadoo.fr> wrote:
>
> +KBUILD_RUSTFLAGS_OPT_LEVEL_MAP := 1

The patch seems based on linux-next -- is this intended? Thanks!

Cheers,
Miguel
