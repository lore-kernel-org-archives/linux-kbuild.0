Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qv1-f68.google.com ([209.85.219.68]:44948 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725440AbgCCGzQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Mar 2020 01:55:16 -0500
MIME-Version: 1.0
References: <202002242114.CBED7F1@keescook>
In-Reply-To: <202002242114.CBED7F1@keescook>
From: Andrii Nakryiko <andrii.nakryiko@gmail.com>
Date: Mon, 2 Mar 2020 22:55:04 -0800
Message-ID: <CAEf4BzYrBoQJ1tPMRMQ_-G6e76=zj4zyC=HrY-mxH_9QK65oqg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: Remove debug info from kallsyms linking
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, open list <linux-kernel@vger.kernel.org>

On Mon, Feb 24, 2020 at 9:17 PM Kees Cook <keescook@chromium.org> wrote:
>
> When CONFIG_DEBUG_INFO is enabled, the two kallsyms linking steps spend
> time collecting and writing the dwarf sections to the temporary output
> files. kallsyms does not need this information, and leaving it off
> halves their linking time. This is especially noticeable without
> CONFIG_DEBUG_INFO_REDUCED. The BTF linking stage, however, does still
> need those details.
>
> Refactor the BTF and kallsyms generation stages slightly for more
> regularized temporary names. Skip debug during kallsyms links.
>
> For a full debug info build with BTF, my link time goes from 1m06s to
> 0m54s, saving about 12 seconds, or 18%.
>
> Signed-off-by: Kees Cook <keescook@chromium.org>
> ---

I've tested locally, seems to be generating BTF properly (I haven't
timed anything, though). See nit below, but otherwise:

Acked-by: Andrii Nakryiko <andriin@fb.com>

>  scripts/link-vmlinux.sh | 28 +++++++++++++++++++---------
>  1 file changed, 19 insertions(+), 9 deletions(-)
>

[...]

> @@ -106,6 +114,8 @@ gen_btf()
>  {
>         local pahole_ver
>         local bin_arch
> +       local bin_format
> +       local bin_file
>
>         if ! [ -x "$(command -v ${PAHOLE})" ]; then
>                 echo >&2 "BTF: ${1}: pahole (${PAHOLE}) is not available"
> @@ -118,8 +128,9 @@ gen_btf()
>                 return 1
>         fi
>
> -       info "BTF" ${2}
>         vmlinux_link ${1}
> +
> +       info "BTF" ${2}

Any reason to exclude linking from "BTF" step? It's still a part of
BTF generation, so seems fair to have BTF encompass both vmlinux
linking and BTF generation/deduplication?

>         LLVM_OBJCOPY=${OBJCOPY} ${PAHOLE} -J ${1}
>
>         # dump .BTF section into raw binary file to link with final vmlinux

[...]
