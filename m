Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:56261 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726561AbfEIHlP (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 May 2019 03:41:15 -0400
Received: from mail-vk1-f176.google.com (mail-vk1-f176.google.com [209.85.221.176]) (authenticated)
        by conssluserg-02.nifty.com with ESMTP id x497f2Vm021745
        for <linux-kbuild@vger.kernel.org>; Thu, 9 May 2019 16:41:03 +0900
Received: by mail-vk1-f176.google.com with SMTP id h127so346552vkd.12
        for <linux-kbuild@vger.kernel.org>; Thu, 09 May 2019 00:41:02 -0700 (PDT)
MIME-Version: 1.0
References: <CACPK8XemTPvV9KTuMDXew3vxzOw=A2Cj-ToVpe=ZSjrrYC-XRQ@mail.gmail.com>
In-Reply-To: <CACPK8XemTPvV9KTuMDXew3vxzOw=A2Cj-ToVpe=ZSjrrYC-XRQ@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 9 May 2019 16:40:25 +0900
Message-ID: <CAK7LNASWoyCeAJg-b7vL4qMDKq-x6RdT5_sBcmtHKknNjuCJrQ@mail.gmail.com>
Subject: Re: Error message when compiler not present
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joel Stanley <joel@jms.id.au>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Christophe LEROY <christophe.leroy@c-s.fr>, Michael Ellerman <mpe@ellerman.id.au>

Hi Joel,

On Tue, May 7, 2019 at 2:56 PM Joel Stanley <joel@jms.id.au> wrote:
>
> Hello,
>
> The other day I was attempting a kernel build and stumbled across this:
>
> $ CROSS_COMPILE=foo make
> /bin/sh: 1: foogcc: not found
> make: foogcc: Command not found
> /bin/sh: 1: foogcc: not found
> /bin/sh: 1: foogcc: not found
> scripts/kconfig/conf  --syncconfig Kconfig
> ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 17: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 18: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/gcc-version.sh: 19: ./scripts/gcc-version.sh: foogcc: not found
> ./scripts/clang-version.sh: 11: ./scripts/clang-version.sh: foogcc: not found
> ./scripts/gcc-plugin.sh: 11: ./scripts/gcc-plugin.sh: foogcc: not found
> init/Kconfig:16:warning: 'GCC_VERSION': number is invalid
> /bin/sh: 1: foogcc: not found
> make: foogcc: Command not found
> Compiler lacks asm-goto support.
> make: *** [arch/x86/Makefile:302: checkbin] Error 1
>
> I had something more sensible for CROSS_COMPILE, but the point is it
> did not exist in my $PATH.
>
> I tried the patch below but there's still something calling the
> $(CROSS_COMPILE)gcc before gcc-version:
>
> $ CROSS_COMPILE=foo  make
> /bin/sh: 1: foogcc: not found
> make: foogcc: Command not found
> Compiler lacks asm-goto support.
>
> This isn't a big deal but if there's a simple fix it would be nice to clean up.

Yeah, I had noticed this, and it is somewhat ugly.

Instead of fixing every script,
I want to terminate Kconfig in the very beginning of the parse stage.

https://patchwork.kernel.org/patch/10936811/


I still see some "/bin/sh: 1: foogcc: not found" in the build stage,
but not fixing up every $(shell ...) calls
since displaying some warnings is not a big deal.

Thanks.

>
> Cheers,
>
> Joel
>
> --- a/scripts/gcc-version.sh
> +++ b/scripts/gcc-version.sh
> @@ -8,6 +8,11 @@
>
>  compiler="$*"
>
> +if [ -x "command -v ${#compiler}" ]; then
> +       echo "Error: Compiler not found." >&2
> +       exit 1
> +fi
> +
>  if [ ${#compiler} -eq 0 ]; then
>         echo "Error: No compiler specified." >&2
>         printf "Usage:\n\t$0 <gcc-command>\n" >&2



-- 
Best Regards
Masahiro Yamada
