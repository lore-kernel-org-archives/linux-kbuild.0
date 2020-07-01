Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47920 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726287AbgGAUOa (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 1 Jul 2020 16:14:30 -0400
MIME-Version: 1.0
References: <20200701192936.1397152-1-masahiroy@kernel.org>
In-Reply-To: <20200701192936.1397152-1-masahiroy@kernel.org>
From: Max Filippov <jcmvbkbc@gmail.com>
Date: Wed, 1 Jul 2020 13:14:18 -0700
Message-ID: <CAMo8Bf+w2ikVxEJecE_DpAbBQFNhY=K1jWpg9y4uDw9jEb5=MQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: do not export LDFLAGS_vmlinux
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>, Chris Zankel <chris@zankel.net>, "open list:TENSILICA XTENSA PORT (xtensa)" <linux-xtensa@linux-xtensa.org>, Guan Xuetao <gxt@pku.edu.cn>, Nick Desaulniers <ndesaulniers@google.com>, Michal Marek <michal.lkml@markovi.net>

On Wed, Jul 1, 2020 at 12:30 PM Masahiro Yamada <masahiroy@kernel.org> wrote:

[...]

> diff --git a/arch/xtensa/boot/boot-elf/Makefile b/arch/xtensa/boot/boot-elf/Makefile
> index 12ae1e91cb75..c6538d3321b9 100644
> --- a/arch/xtensa/boot/boot-elf/Makefile
> +++ b/arch/xtensa/boot/boot-elf/Makefile
> @@ -25,7 +25,7 @@ $(obj)/Image.o: vmlinux.bin $(OBJS)
>                 $(OBJS) $@
>
>  $(obj)/../Image.elf: $(obj)/Image.o $(obj)/boot.lds
> -       $(Q)$(LD) $(KBUILD_LDFLAGS) $(LDFLAGS_vmlinux) \
> +       $(LD) $(KBUILD_LDFLAGS) \

Can that $(Q) be retained, please?
The rest LGTM.

>                 -T $(obj)/boot.lds \
>                 --build-id=none \
>                 -o $@ $(obj)/Image.o

-- 
Thanks.
-- Max
