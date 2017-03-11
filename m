Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:21585 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750896AbdCKFhL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sat, 11 Mar 2017 00:37:11 -0500
MIME-Version: 1.0
In-Reply-To: <20170123150727.4883-1-mcgrof@kernel.org>
References: <20170118173156.16060-1-mcgrof@kernel.org> <20170123150727.4883-1-mcgrof@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Sat, 11 Mar 2017 14:37:02 +0900
Message-ID: <CAK7LNASzfaBQVTk94=eZ347ZhkZVhqwjrqfhWOro8Cg7pCykKg@mail.gmail.com>
Subject: Re: [PATCH v2] firmware/Makefile: force recompilation if makefile changes
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Luis R. Rodriguez" <mcgrof@kernel.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, ming.lei@canonical.com, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, teg@jklm.no, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, David Woodhouse <dwmw2@infradead.org>

Hi Luis,


2017-01-24 0:07 GMT+09:00 Luis R. Rodriguez <mcgrof@kernel.org>:
> If you modify the target asm we currently do not force the
> recompilation of the firmware files. The target asm is in
> the firmware/Makefile, peg this file as a dependency to
> require re-compilation of firmware targets when the asm
> changes.
>
> Signed-off-by: Luis R. Rodriguez <mcgrof@kernel.org>
> ---
>
> Michal,
>
> I had this patch as part of my linker table series [0] but have split it
> off as its a small atomic separate change and can go in separately. Greg
> prefers this be reviewed by the kbuild tree so sending it your way.
> This v2 has no modifications, just resending it to the kbuild tree.
>
> [0] https://lkml.kernel.org/r/20170115211057.17167-1-mcgrof@kernel.org
>
>  firmware/Makefile | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>
> diff --git a/firmware/Makefile b/firmware/Makefile
> index e297e1b52636..fa3e81c2a97b 100644
> --- a/firmware/Makefile
> +++ b/firmware/Makefile
> @@ -176,7 +176,8 @@ quiet_cmd_fwbin = MK_FW   $@
>  wordsize_deps := $(wildcard include/config/64bit.h include/config/32bit.h \
>                 include/config/ppc32.h include/config/ppc64.h \
>                 include/config/superh32.h include/config/superh64.h \
> -               include/config/x86_32.h include/config/x86_64.h)
> +               include/config/x86_32.h include/config/x86_64.h \
> +               firmware/Makefile)
>
>  $(patsubst %,$(obj)/%.gen.S, $(fw-shipped-y)): %: $(wordsize_deps)
>         $(call cmd,fwbin,$(patsubst %.gen.S,%,$@))


Why don't you use  $(call filechk,...) or $(call if_changed,...)
instead of wordsize_deps ?




-- 
Best Regards
Masahiro Yamada
