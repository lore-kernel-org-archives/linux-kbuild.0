Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44996 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726065AbeIBV3l (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 2 Sep 2018 17:29:41 -0400
Received: from mail-ua1-f47.google.com (mail-ua1-f47.google.com [209.85.222.47]) (authenticated)
        by conssluserg-01.nifty.com with ESMTP id w82HD6ci002057
        for <linux-kbuild@vger.kernel.org>; Mon, 3 Sep 2018 02:13:07 +0900
Received: by mail-ua1-f47.google.com with SMTP id r15-v6so11615231uao.1
        for <linux-kbuild@vger.kernel.org>; Sun, 02 Sep 2018 10:13:06 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <5B8563A702000078001E2A82@prv1-mh.provo.novell.com>
References: <5B8563A702000078001E2A82@prv1-mh.provo.novell.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 3 Sep 2018 02:12:25 +0900
Message-ID: <CAK7LNAQZw88d08wEn=S7mVgEz86djuig6MYMgT_hWwBU5jzrCA@mail.gmail.com>
Subject: Re: [PATCH] kallsyms: reduce size a little on 64-bit
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

Hi.

2018-08-29 0:00 GMT+09:00 Jan Beulich <JBeulich@suse.com>:
> Both kallsyms_num_syms and kallsyms_markers[] don't really need to use
> unsigned long as their (base) types; unsigned int fully suffices.
>
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> ---



> --- 4.19-rc1/scripts/kallsyms.c
> +++ 4.19-rc1-kallsyms-reduce-size/scripts/kallsyms.c
> @@ -182,6 +182,8 @@ static int symbol_in_range(struct sym_en
>         for (i = 0; i < entries; ++i) {
>                 ar = &ranges[i];
>
> +               if (!ar->end)
> +                       continue;
>                 if (s->addr >= ar->start && s->addr <= ar->end)
>                         return 1;
>         }


What is this hunk doing?

At least, I cannot understand it from the patch description.



-- 
Best Regards
Masahiro Yamada
