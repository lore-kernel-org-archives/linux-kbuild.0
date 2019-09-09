Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20659 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732685AbfIIK7B (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Sep 2019 06:59:01 -0400
MIME-Version: 1.0
References: <20190906151059.1077708-1-arnd@arndb.de>
In-Reply-To: <20190906151059.1077708-1-arnd@arndb.de>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Mon, 9 Sep 2019 19:58:12 +0900
Message-ID: <CAK7LNAR_6cQs33nOsJyVCmztw62dx=0W59KWo4WH+SoUnzOJoQ@mail.gmail.com>
Subject: Re: [PATCH] mostpost: don't warn about symbols from another file
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <michal.lkml@markovi.net>, Emil Velikov <emil.l.velikov@gmail.com>, Denis Efremov <efremov@linux.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sam Ravnborg <sam@ravnborg.org>, WANG Chao <chao.wang@ucloud.cn>, Sami Tolvanen <samitolvanen@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Sat, Sep 7, 2019 at 12:11 AM Arnd Bergmann <arnd@arndb.de> wrote:
>
> On architectures such as ARM that have a list of symbols exported from
> assembler in a separate C file, we get a lot of new warnings:
>
> WARNING: "__ashrdi3" [vmlinux] is a static (unknown)
> WARNING: "__lshrdi3" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_llsr" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_lasr" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_uidivmod" [vmlinux] is a static (unknown)
> WARNING: "__udivsi3" [vmlinux] is a static (unknown)
> WARNING: "_change_bit" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_idiv" [vmlinux] is a static (unknown)
> WARNING: "__umodsi3" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_uidiv" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_idivmod" [vmlinux] is a static (unknown)
> WARNING: "__muldi3" [vmlinux] is a static (unknown)
> WARNING: "__aeabi_ulcmp" [vmlinux] is a static (unknown)
> WARNING: "__raw_writesb" [vmlinux] is a static (unknown)
> WARNING: "__raw_readsb" [vmlinux] is a static (unknown)
> ...
>
> This is not helpful, as these are clearly not static symbols
> at all. Suppress the warning in a case like this.
>
> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>


This patch is not root-causing the problem,
rather it is hiding it.

I posted a real fix:
https://patchwork.kernel.org/patch/11137689/



> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 76c221dd9b2b..4265dd924933 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2543,7 +2543,7 @@ int main(int argc, char **argv)
>                 struct symbol *s = symbolhash[n];
>
>                 while (s) {
> -                       if (s->is_static)
> +                       if (s->is_static && s->export != export_unknown)
>                                 warn("\"%s\" [%s] is a static %s\n",
>                                      s->name, s->module->name,
>                                      export_str(s->export));
> --
> 2.20.0
>


-- 
Best Regards
Masahiro Yamada
