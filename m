Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:26941 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751582AbeFXJEy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 24 Jun 2018 05:04:54 -0400
Received: from mail-vk0-f49.google.com (mail-vk0-f49.google.com [209.85.213.49]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id w5O94Wve018937
        for <linux-kbuild@vger.kernel.org>; Sun, 24 Jun 2018 18:04:33 +0900
Received: by mail-vk0-f49.google.com with SMTP id q135-v6so6229244vkh.1
        for <linux-kbuild@vger.kernel.org>; Sun, 24 Jun 2018 02:04:33 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180623204904.11378-1-alexpl@fedoraproject.org>
References: <20180623204904.11378-1-alexpl@fedoraproject.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sun, 24 Jun 2018 18:03:51 +0900
Message-ID: <CAK7LNATnORTLmE=6L0uN-rLE47kYZYj1+Y7Az2dYBawdp6TsPg@mail.gmail.com>
Subject: Re: [PATCH] kconfig: loop boundary condition fix
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexander Ploumistos <alexpl@fedoraproject.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Laura Abbott <labbott@redhat.com>, Jerry James <loganjerry@gmail.com>

2018-06-24 5:49 GMT+09:00 Alexander Ploumistos <alexpl@fedoraproject.org>:
> From: Jerry James <loganjerry@gmail.com>
>
> If buf[-1] just happens to hold the byte 0x0A, then nread can wrap around
> to (size_t)-1, leading to invalid memory accesses.
>
> This has caused segmentation faults when trying to build the latest
> kernel snapshots for i686 in Fedora:
> https://bugzilla.redhat.com/show_bug.cgi?id=1592374
>
> Signed-off-by: Jerry James <loganjerry@gmail.com>
> [alexpl@fedoraproject.org: reformatted patch for submission]
> Signed-off-by: Alexander Ploumistos <alexpl@fedoraproject.org>
> ---

Applied to linux-kbuild/fixes.  Thanks!


>  scripts/kconfig/preprocess.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/preprocess.c b/scripts/kconfig/preprocess.c
> index 65da87fce907..5ca2df790d3c 100644
> --- a/scripts/kconfig/preprocess.c
> +++ b/scripts/kconfig/preprocess.c
> @@ -156,7 +156,7 @@ static char *do_shell(int argc, char *argv[])
>                 nread--;
>
>         /* remove trailing new lines */
> -       while (buf[nread - 1] == '\n')
> +       while (nread > 0 && buf[nread - 1] == '\n')
>                 nread--;
>
>         buf[nread] = 0;
> --
> 2.17.1
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
