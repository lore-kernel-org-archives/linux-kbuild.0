Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:49679 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726661AbgC1CcD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Mar 2020 22:32:03 -0400
MIME-Version: 1.0
References: <20200326192933.14091-1-david.engraf@sysgo.com>
In-Reply-To: <20200326192933.14091-1-david.engraf@sysgo.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 28 Mar 2020 11:31:14 +0900
Message-ID: <CAK7LNAQ2Mojdcu7hg+_q5VopnDPEtx=LK9m-3df6m2TCncrNfA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add outputmakefile to no-dot-config-targets
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Engraf <david.engraf@sysgo.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Fri, Mar 27, 2020 at 4:37 AM David Engraf <david.engraf@sysgo.com> wrote:
>
> The target outputmakefile is used to generate a Makefile
> for out-of-tree builds and does not depend on the kernel
> configuration.
>
> Signed-off-by: David Engraf <david.engraf@sysgo.com>

Applied to linux-kbuild.

Thanks.


> ---
>  Makefile | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Makefile b/Makefile
> index e56bf7ef182d..45be0e5b0cef 100644
> --- a/Makefile
> +++ b/Makefile
> @@ -255,7 +255,7 @@ clean-targets := %clean mrproper cleandocs
>  no-dot-config-targets := $(clean-targets) \
>                          cscope gtags TAGS tags help% %docs check% coccicheck \
>                          $(version_h) headers headers_% archheaders archscripts \
> -                        %asm-generic kernelversion %src-pkg
> +                        %asm-generic kernelversion %src-pkg outputmakefile
>  no-sync-config-targets := $(no-dot-config-targets) install %install \
>                            kernelrelease
>  single-targets := %.a %.i %.ko %.lds %.ll %.lst %.mod %.o %.s %.symtypes %/
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
