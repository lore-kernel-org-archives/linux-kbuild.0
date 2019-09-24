Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:38797 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2504877AbfIXMKt (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 24 Sep 2019 08:10:49 -0400
MIME-Version: 1.0
References: <c8cbee753dc0306fd7597f43a45e05d99d404b29.camel@sipsolutions.net>
In-Reply-To: <c8cbee753dc0306fd7597f43a45e05d99d404b29.camel@sipsolutions.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 24 Sep 2019 21:09:56 +0900
Message-ID: <CAK7LNATkejPwwsfJoR4veX+pvCnoK4Seg-ZOcDrZgeTaJTfp0w@mail.gmail.com>
Subject: Re: static EXPORT_SYMBOL checker causes false positives on ARCH=um
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Johannes Berg <johannes@sipsolutions.net>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linux-um@lists.infradead.org, Denis Efremov <efremov@linux.com>, Emil Velikov <emil.l.velikov@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Johannes,

On Tue, Sep 24, 2019 at 5:17 PM Johannes Berg <johannes@sipsolutions.net> wrote:
>
> Hi,
>
> With the new commit 15bfc2348d54 ("modpost: check for static
> EXPORT_SYMBOL* functions") we get a lot of warnings on ARCH=um builds:
>
> WARNING: "rename" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "lseek" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "ftruncate64" [vmlinux] is a static EXPORT_SYMBOL
> [...]
> see https://p.sipsolutions.net/7232995f34907b9d.txt

Thanks for the report.

I think this should work:
https://lore.kernel.org/patchwork/patch/1131017/

It fixes "__guard" and "__stack_smash_handler" too.


Thanks.



>
>
> This hack fixes *most* of them:
>
> diff --git a/scripts/mod/modpost.c b/scripts/mod/modpost.c
> index 820eed87fb43..3e443563ebea 100644
> --- a/scripts/mod/modpost.c
> +++ b/scripts/mod/modpost.c
> @@ -1931,12 +1931,18 @@ static void check_sec_ref(struct module *mod, const char *modname,
>  static char *remove_dot(char *s)
>  {
>         size_t n = strcspn(s, ".");
> +       char *at;
>
>         if (n && s[n]) {
>                 size_t m = strspn(s + n + 1, "0123456789");
>                 if (m && (s[n + m] == '.' || s[n + m] == 0))
>                         s[n] = 0;
>         }
> +
> +       at = strchr(s, '@');
> +       if (at)
> +               *at = 0;
> +
>         return s;
>  }
>
>
> (but obviously just serves to give you an idea of what's going on).
>
>
> With that, only two remain for me:
>
> WARNING: "__guard" [vmlinux] is a static EXPORT_SYMBOL
> WARNING: "__stack_smash_handler" [vmlinux] is a static EXPORT_SYMBOL
>
> and I think that's because they don't even exist at all, so arguably the
> code shouldn't export them, but I didn't find a way to detect at build
> time if -fstack-protector was enabled or not?
>
> Any thoughts?
>
> Thanks,
> johannes
>


-- 
Best Regards
Masahiro Yamada
