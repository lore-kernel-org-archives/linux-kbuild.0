Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io1-f67.google.com ([209.85.166.67]:39267 "EHLO
        mail-io1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725616AbfKFFam (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 00:30:42 -0500
MIME-Version: 1.0
References: <20191106033610.29841-1-unixbhaskar@gmail.com>
In-Reply-To: <20191106033610.29841-1-unixbhaskar@gmail.com>
From: Alexander Kapshuk <alexander.kapshuk@gmail.com>
Date: Wed, 6 Nov 2019 07:30:03 +0200
Message-ID: <CAJ1xhMXXT9HaZFB2QjB0NCQgc9q6BCnN64Ock1n0Row=jh6aww@mail.gmail.com>
Subject: [PATCH]scripts:ver_linux:Added Bison and Flex to the checklist
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Cc: Randy Dunlap <rdunlap@infradead.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org, linux-kernel <linux-kernel@vger.kernel.org>

On Wed, Nov 6, 2019 at 5:36 AM Bhaskar Chowdhury <unixbhaskar@gmail.com> wrote:
>
> As Masahiro pointed out ,only add Bison and Flex to the checklist.
>
> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
> ---
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

Acked-by: Alexander Kapshuk <alexander.kapshuk@gmail.com>
