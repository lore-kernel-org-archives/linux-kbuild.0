Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:59928 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726853AbgCNBdJ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Mar 2020 21:33:09 -0400
MIME-Version: 1.0
References: <20200308073400.23398-1-natechancellor@gmail.com> <20200311194121.38047-1-natechancellor@gmail.com>
In-Reply-To: <20200311194121.38047-1-natechancellor@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sat, 14 Mar 2020 10:32:17 +0900
Message-ID: <CAK7LNASdzfR6iewpZY8z4Ln8tN8GxNxgnzk2tPsOBn2v4ZJvwg@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: Disable -Wpointer-to-enum-cast
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nathan Chancellor <natechancellor@gmail.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, clang-built-linux <clang-built-linux@googlegroups.com>, stable <stable@vger.kernel.org>

On Thu, Mar 12, 2020 at 4:41 AM Nathan Chancellor
<natechancellor@gmail.com> wrote:
>
> Clang's -Wpointer-to-int-cast deviates from GCC in that it warns when
> casting to enums. The kernel does this in certain places, such as device
> tree matches to set the version of the device being used, which allows
> the kernel to avoid using a gigantic union.
>
> https://elixir.bootlin.com/linux/v5.5.8/source/drivers/ata/ahci_brcm.c#L428
> https://elixir.bootlin.com/linux/v5.5.8/source/drivers/ata/ahci_brcm.c#L402
> https://elixir.bootlin.com/linux/v5.5.8/source/include/linux/mod_devicetable.h#L264
>
> To avoid a ton of false positive warnings, disable this particular part
> of the warning, which has been split off into a separate diagnostic so
> that the entire warning does not need to be turned off for clang. It
> will be visible under W=1 in case people want to go about fixing these
> easily and enabling the warning treewide.
>
> Cc: stable@vger.kernel.org
> Link: https://github.com/ClangBuiltLinux/linux/issues/887
> Link: https://github.com/llvm/llvm-project/commit/2a41b31fcdfcb67ab7038fc2ffb606fd50b83a84
> Signed-off-by: Nathan Chancellor <natechancellor@gmail.com>
> ---


Applied to linux-kbuild.
Thanks.


>
> v1 -> v2:
>
> * Move under scripts/Makefile.extrawarn, as requested by Masahiro
>
>  scripts/Makefile.extrawarn | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.extrawarn b/scripts/Makefile.extrawarn
> index ecddf83ac142..ca08f2fe7c34 100644
> --- a/scripts/Makefile.extrawarn
> +++ b/scripts/Makefile.extrawarn
> @@ -48,6 +48,7 @@ KBUILD_CFLAGS += -Wno-initializer-overrides
>  KBUILD_CFLAGS += -Wno-format
>  KBUILD_CFLAGS += -Wno-sign-compare
>  KBUILD_CFLAGS += -Wno-format-zero-length
> +KBUILD_CFLAGS += $(call cc-disable-warning, pointer-to-enum-cast)
>  endif
>
>  endif
> --
> 2.26.0.rc1
>
> --
> You received this message because you are subscribed to the Google Groups "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an email to clang-built-linux+unsubscribe@googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgid/clang-built-linux/20200311194121.38047-1-natechancellor%40gmail.com.



-- 
Best Regards
Masahiro Yamada
