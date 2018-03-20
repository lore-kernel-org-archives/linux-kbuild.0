Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:58053 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750888AbeCTPR0 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 20 Mar 2018 11:17:26 -0400
Received: from mail-vk0-f54.google.com (mail-vk0-f54.google.com [209.85.213.54]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w2KFHILN022161
        for <linux-kbuild@vger.kernel.org>; Wed, 21 Mar 2018 00:17:19 +0900
Received: by mail-vk0-f54.google.com with SMTP id l123so1147083vke.8
        for <linux-kbuild@vger.kernel.org>; Tue, 20 Mar 2018 08:17:19 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1803151504080.28583@knanqh.ubzr>
References: <ccedea72-0e61-500c-86e5-976ecb5cefb5@gmail.com>
 <CAK7LNAS9rOhyEdSUBbhPVW572437w5g7zLqMGSHn4gg3nbCU_g@mail.gmail.com>
 <nycvar.YSQ.7.76.1803121331280.28583@knanqh.ubzr> <4bbfeb74-c912-74e5-4f4d-287ec7ad065d@gmail.com>
 <nycvar.YSQ.7.76.1803131922060.28583@knanqh.ubzr> <4aee7e23-ac36-9495-14a9-471379a7896b@gmail.com>
 <nycvar.YSQ.7.76.1803151504080.28583@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 21 Mar 2018 00:16:37 +0900
Message-ID: <CAK7LNARdit6ddTBVuf425VSeTQF3v3mR5tSBJ7La2VZFSNC-yw@mail.gmail.com>
Subject: Re: Intermittent build failure with TRIM_UNUSED_KSYMS and related problems
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Lindroth <thomas.lindroth@gmail.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Nicolas Pitre <nicolas.pitre@linaro.org>

Hi Thomas,


2018-03-16 5:56 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> Subject: [PATCH] kbuild: make scripts/adjust_autoksyms.sh robust against timestamp races
>
> Some filesystems have timestamps with coarse precision that may allow
> for a recently built object file to have the same timestamp as the
> updated time on one of its dependency files. When that happens, the
> object file doesn't get rebuilt as it should.
>
> This is especially the case on filesystems that don't have sub-second
> time precision, such as ext3 or Ext4 with 128B inodes.
>
> Let's prevent that by making sure updated dependency files have a newer
> timestamp than the first file we created (i.e. autoksyms.h.tmpnew).
>
> Reported-by: Thomas Lindroth <thomas.lindroth@gmail.com>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>
>
> diff --git a/scripts/adjust_autoksyms.sh b/scripts/adjust_autoksyms.sh
> index 513da1a4a2..d67830e6e3 100755
> --- a/scripts/adjust_autoksyms.sh
> +++ b/scripts/adjust_autoksyms.sh
> @@ -84,6 +84,13 @@ while read sympath; do
>         depfile="include/config/ksym/${sympath}.h"
>         mkdir -p "$(dirname "$depfile")"
>         touch "$depfile"
> +       # Filesystems with coarse time precision may create timestamps
> +       # equal to the one from a file that was very recently built and that
> +       # needs to be rebuild. Let's guard against that by making sure our
> +       # dep files are always newer than the first file we created here.
> +       while [ ! "$depfile" -nt "$new_ksyms_file" ]; do
> +               touch "$depfile"
> +       done
>         echo $((count += 1))
>  done | tail -1 )
>  changed=${changed:-0}


Does this patch solve your problem?
I guess so, but I want you to test it just in case.


-- 
Best Regards
Masahiro Yamada
