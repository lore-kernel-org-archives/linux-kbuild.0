Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ed1-f67.google.com ([209.85.208.67]:46956 "EHLO
        mail-ed1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2392542AbfIFWjQ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 6 Sep 2019 18:39:16 -0400
Subject: Re: [PATCH] mostpost: don't warn about symbols from another file
References: <20190906151059.1077708-1-arnd@arndb.de>
From: Denis Efremov <efremov@linux.com>
Message-ID: <7fc19dd4-93fb-fa15-3d36-3079cd42cf7c@linux.com>
Date: Sat, 7 Sep 2019 01:39:11 +0300
MIME-Version: 1.0
In-Reply-To: <20190906151059.1077708-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>
Cc: Emil Velikov <emil.l.velikov@gmail.com>, Paul Walmsley <paul.walmsley@sifive.com>, Sam Ravnborg <sam@ravnborg.org>, WANG Chao <chao.wang@ucloud.cn>, Sami Tolvanen <samitolvanen@google.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

Hi,

On 06.09.2019 18:10, Arnd Bergmann wrote:
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

It looks very similar to this discussion https://lkml.org/lkml/2019/7/30/112

Could you please write the steps to reproduce the warnings?
Now, I'm trying to build linux-next (host Ubuntu 19.04 x86_64) with:
$ make ARCH=arm CROSS_COMPILE=/usr/bin/arm-linux-gnueabi-
But I can't get these warnings.

I would like to check the type of this asm symbols. It seems like they
are STT_NOTYPE. In this case the fix could also involve ELF_ST_TYPE check.

Thanks,
Denis

> Fixes: 15bfc2348d54 ("modpost: check for static EXPORT_SYMBOL* functions")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  scripts/mod/modpost.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 76c221dd9b2b..4265dd924933 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -2543,7 +2543,7 @@ int main(int argc, char **argv)
>  		struct symbol *s = symbolhash[n];
>  
>  		while (s) {
> -			if (s->is_static)
> +			if (s->is_static && s->export != export_unknown)
>  				warn("\"%s\" [%s] is a static %s\n",
>  				     s->name, s->module->name,
>  				     export_str(s->export));
> 
