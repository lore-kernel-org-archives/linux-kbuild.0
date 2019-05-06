Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725852AbfEFMnu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 6 May 2019 08:43:50 -0400
MIME-Version: 1.0
References: <1557146400-12269-1-git-send-email-krzk@kernel.org>
In-Reply-To: <1557146400-12269-1-git-send-email-krzk@kernel.org>
From: Krzysztof Kozlowski <krzk@kernel.org>
Date: Mon, 6 May 2019 14:43:36 +0200
Message-ID: <CAJKOXPfAbn=OV8v=6VOH6avgGSfpW+_Wksu5qNLtXcGbATFs3g@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Fix cross compile link with ccache
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Daniel Borkmann <daniel@iogearbox.net>, Andrii Nakryiko <andriin@fb.com>, Alexei Starovoitov <ast@kernel.org>, Gleb Fotengauer-Malinovskiy <glebfm@altlinux.org>, Alexey Gladkov <gladkov.alexey@gmail.com>, Krzysztof Kozlowski <krzk@kernel.org>, linux-kernel@vger.kernel.org
Cc: Jessica Yu <jeyu@kernel.org>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild@vger.kernel.org

+cc linux-kbuild@vger.kernel.org, Michal Marek (somehow
get_maintainers did not mention them)

On Mon, 6 May 2019 at 14:40, Krzysztof Kozlowski <krzk@kernel.org> wrote:
>
> Fix calling objcopy in case of cross compile environments:
>
>         ARCH="arm" CROSS_COMPILE="ccache arm-linux-gnueabi-" make
>         scripts/link-vmlinux.sh: line 211: ccache arm-linux-gnueabi-objcopy: command not found
>
> Fixes: 6a26793a7891 ("moduleparam: Save information about built-in modules in separate file")
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  scripts/link-vmlinux.sh | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/link-vmlinux.sh b/scripts/link-vmlinux.sh
> index 62b9fc561af7..42ea6f9264ef 100755
> --- a/scripts/link-vmlinux.sh
> +++ b/scripts/link-vmlinux.sh
> @@ -208,7 +208,7 @@ modpost_link vmlinux.o
>  ${MAKE} -f "${srctree}/scripts/Makefile.modpost" vmlinux.o
>
>  info MODINFO modules.builtin.modinfo
> -"${OBJCOPY}" -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
> +${OBJCOPY} -j .modinfo -O binary vmlinux.o modules.builtin.modinfo
>
>  kallsymso=""
>  kallsyms_vmlinux=""
> --
> 2.7.4
>
