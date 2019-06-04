Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:64297 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726173AbfFDAWZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 3 Jun 2019 20:22:25 -0400
MIME-Version: 1.0
References: <1559572240-18706-1-git-send-email-george_davis@mentor.com>
In-Reply-To: <1559572240-18706-1-git-send-email-george_davis@mentor.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 4 Jun 2019 09:21:25 +0900
Message-ID: <CAK7LNAQ6Rfuohy8dQSnqXbFeERki-aaNTc0G0uFojCTE-4i=mg@mail.gmail.com>
Subject: Re: [PATCH v2] scripts/checkstack.pl: Fix arm64 wrong or unknown architecture
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "George G. Davis" <george_davis@mentor.com>
Cc: Andy Whitcroft <apw@canonical.com>, Joe Perches <joe@perches.com>, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>, linux-arm-kernel <linux-arm-kernel@lists.infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Qian Cai <cai@lca.pw>, Andrew Morton <akpm@linux-foundation.org>, Breno Leitao <leitao@debian.org>, Michael Ellerman <mpe@ellerman.id.au>, open list <linux-kernel@vger.kernel.org>

On Mon, Jun 3, 2019 at 11:31 PM George G. Davis <george_davis@mentor.com> wrote:
>
> The following error occurs for the `make ARCH=arm64 checkstack` case:
>
> aarch64-linux-gnu-objdump -d vmlinux $(find . -name '*.ko') | \
> perl ./scripts/checkstack.pl arm64
> wrong or unknown architecture "arm64"
>
> As suggested by Masahiro Yamada, fix the above error using regular
> expressions in the same way it was fixed for the `ARCH=x86` case via
> commit fda9f9903be6 ("scripts/checkstack.pl: automatically handle
> 32-bit and 64-bit mode for ARCH=x86").
>
> Suggested-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> Signed-off-by: George G. Davis <george_davis@mentor.com>
> ---

Applied to linux-kbuild/fixes. Thanks.

> v1:
> - https://patchwork.kernel.org/patch/10970393/
> v2:
> - Updates as Suggested-by: Masahiro Yamada
> - Update commit subject due to moving the fix from Makefile to
>   checkstack.pl
> ---
>  scripts/checkstack.pl | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/checkstack.pl b/scripts/checkstack.pl
> index 122aef5e4e14..371bd17a4983 100755
> --- a/scripts/checkstack.pl
> +++ b/scripts/checkstack.pl
> @@ -46,7 +46,7 @@ my (@stack, $re, $dre, $x, $xs, $funcre);
>         $x      = "[0-9a-f]";   # hex character
>         $xs     = "[0-9a-f ]";  # hex character or space
>         $funcre = qr/^$x* <(.*)>:$/;
> -       if ($arch eq 'aarch64') {
> +       if ($arch =~ '^(aarch|arm)64$') {
>                 #ffffffc0006325cc:       a9bb7bfd        stp     x29, x30, [sp, #-80]!
>                 #a110:       d11643ff        sub     sp, sp, #0x590
>                 $re = qr/^.*stp.*sp, \#-([0-9]{1,8})\]\!/o;
> --
> 2.7.4
>


-- 
Best Regards
Masahiro Yamada
