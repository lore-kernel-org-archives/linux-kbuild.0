Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:17109 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751454AbeDEPvx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Apr 2018 11:51:53 -0400
MIME-Version: 1.0
In-Reply-To: <20180405151645.19130-4-jolsa@kernel.org>
References: <20180405151645.19130-1-jolsa@kernel.org> <20180405151645.19130-4-jolsa@kernel.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 6 Apr 2018 00:50:00 +0900
Message-ID: <CAK7LNAQHEWAk_J8uZ4_ETR=JzBU9szDCVNxmUvY447uMj1XLVA@mail.gmail.com>
Subject: Re: [PATCH 3/9] kbuild: Do not pass arguments to link-vmlinux.sh
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Olsa <jolsa@kernel.org>
Cc: Alexei Starovoitov <ast@kernel.org>, Daniel Borkmann <daniel@iogearbox.net>, lkml <linux-kernel@vger.kernel.org>, netdev@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Quentin Monnet <quentin.monnet@netronome.com>, Eugene Syromiatnikov <esyr@redhat.com>, Jiri Benc <jbenc@redhat.com>, Stanislav Kozina <skozina@redhat.com>, Jerome Marchand <jmarchan@redhat.com>, Arnaldo Carvalho de Melo <acme@redhat.com>, Michal Marek <michal.lkml@markovi.net>, Jiri Kosina <jkosina@suse.cz>

2018-04-06 0:16 GMT+09:00 Jiri Olsa <jolsa@kernel.org>:
> There's no need to pass LD* arguments to link-vmlinux.sh,
> because they are passed as variables. The only argument
> the link-vmlinux.sh supports is the 'clean' argument.
>
> Signed-off-by: Jiri Olsa <jolsa@kernel.org>
> ---

Wrong.

$(LD) $(LDFLAGS) $(LDFLAGS_vmlinux)
exist here so that any change in them
invokes scripts/linkk-vmlinux.sh




>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index d3300e46f925..a65a3919c6ad 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -1027,7 +1027,7 @@ ARCH_POSTLINK := $(wildcard $(srctree)/arch/$(SRCARCH)/Makefile.postlink)
>
>  # Final link of vmlinux with optional arch pass after final link
>  cmd_link-vmlinux =                                                 \
> -       $(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux) ;    \
> +       $(CONFIG_SHELL) $< ;                                       \
>         $(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>
>  vmlinux: scripts/link-vmlinux.sh vmlinux_prereq $(vmlinux-deps) FORCE






-- 
Best Regards
Masahiro Yamada
