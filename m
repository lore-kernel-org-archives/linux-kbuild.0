Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:28580 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727252AbfKFCeI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 21:34:08 -0500
MIME-Version: 1.0
References: <20191105113100.521-1-unixbhaskar@gmail.com>
In-Reply-To: <20191105113100.521-1-unixbhaskar@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 6 Nov 2019 11:33:14 +0900
Message-ID: <CAK7LNARqHQwiQEQS_6ZX4GiBuVjo92fECLiVJYN2ixCcJUjU5w@mail.gmail.com>
Subject: Re: [PATCH] scripts: ver_linux:add flex, bison and yacc to the checklist
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Alexander Kapshuk <alexander.kapshuk@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Nov 5, 2019 at 8:31 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> This patch add three ulities explicitly to the checklist,namely
> flex,bison and yacc.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
>  scripts/ver_linux | 3 +++
>  1 file changed, 3 insertions(+)
>
> diff --git a/scripts/ver_linux b/scripts/ver_linux
> index 810e608baa24..397497cf9430 100755
> --- a/scripts/ver_linux
> +++ b/scripts/ver_linux
> @@ -32,6 +32,9 @@ BEGIN {
>         printversion("PPP", version("pppd --version"))
>         printversion("Isdn4k-utils", version("isdnctrl"))
>         printversion("Nfs-utils", version("showmount --version"))
> +       printversion("Bison", version("bison --version"))
> +       printversion("Flex", version("flex --version"))
> +       printversion("Yacc", version("yacc --version"))

I think adding only "Bison" an "Flex" is enough.



>         while (getline <"/proc/self/maps" > 0) {
>                 if (/libc.*\.so$/) {
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
