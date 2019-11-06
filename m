Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44242 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727231AbfKFPMT (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 10:12:19 -0500
MIME-Version: 1.0
References: <20191106033610.29841-1-unixbhaskar@gmail.com>
In-Reply-To: <20191106033610.29841-1-unixbhaskar@gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 7 Nov 2019 00:11:18 +0900
Message-ID: <CAK7LNATDfcv8RfNq=+05Dqtb1v6f-LaPMjXTWt7bpOAy9qywFA@mail.gmail.com>
Subject: Re: [PATCH]scripts:ver_linux:Added Bison and Flex to the checklist
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Alexander Kapshuk <alexander.kapshuk@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Nov 6, 2019 at 12:36 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> As Masahiro pointed out ,only add Bison and Flex to the checklist.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---

Applied to linux-kbuild.
Thanks.


>  scripts/ver_linux | 2 ++
>  1 file changed, 2 insertions(+)
>
> diff --git a/scripts/ver_linux b/scripts/ver_linux
> index 810e608baa24..85005d6b7f10 100755
> --- a/scripts/ver_linux
> +++ b/scripts/ver_linux
> @@ -32,6 +32,8 @@ BEGIN {
>         printversion("PPP", version("pppd --version"))
>         printversion("Isdn4k-utils", version("isdnctrl"))
>         printversion("Nfs-utils", version("showmount --version"))
> +       printversion("Bison", version("bison --version"))
> +       printversion("Flex", version("flex --version"))
>
>         while (getline <"/proc/self/maps" > 0) {
>                 if (/libc.*\.so$/) {
> --
> 2.23.0
>


-- 
Best Regards
Masahiro Yamada
