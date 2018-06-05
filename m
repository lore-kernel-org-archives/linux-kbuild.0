Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:43676 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751764AbeFENQa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Jun 2018 09:16:30 -0400
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com [209.85.213.50]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w55DGHgS016695
        for <linux-kbuild@vger.kernel.org>; Tue, 5 Jun 2018 22:16:18 +0900
Received: by mail-vk0-f50.google.com with SMTP id b134-v6so1339130vke.13
        for <linux-kbuild@vger.kernel.org>; Tue, 05 Jun 2018 06:16:18 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180602090803.6362-1-pvorel@suse.cz>
References: <20180602090803.6362-1-pvorel@suse.cz>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 5 Jun 2018 22:15:36 +0900
Message-ID: <CAK7LNASWmw=MDEwMGO+KarQ-GrY5M0fMWGg+TEMdguB4VGH65w@mail.gmail.com>
Subject: Re: [PATCH 1/2] kbuild: Add testconfig into make help output
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Petr Vorel <pvorel@suse.cz>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-06-02 18:08 GMT+09:00 Petr Vorel <pvorel@suse.cz>:
> Signed-off-by: Petr Vorel <pvorel@suse.cz>
> ---

Both applied to linux-kbuild.  Thanks!



>  scripts/kconfig/Makefile | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/kconfig/Makefile b/scripts/kconfig/Makefile
> index 5def8779d7d8..36b092150c45 100644
> --- a/scripts/kconfig/Makefile
> +++ b/scripts/kconfig/Makefile
> @@ -172,6 +172,7 @@ help:
>         @echo  '  kvmconfig       - Enable additional options for kvm guest kernel support'
>         @echo  '  xenconfig       - Enable additional options for xen dom0 and guest kernel support'
>         @echo  '  tinyconfig      - Configure the tiniest possible kernel'
> +       @echo  '  testconfig      - Run Kconfig unit tests (requires python3 and pytest)'
>
>  # lxdialog stuff
>  check-lxdialog  := $(srctree)/$(src)/lxdialog/check-lxdialog.sh
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
