Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:45915 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965043AbeF0Qal (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 27 Jun 2018 12:30:41 -0400
Received: from mail-vk0-f50.google.com (mail-vk0-f50.google.com [209.85.213.50]) (authenticated)
        by conssluserg-06.nifty.com with ESMTP id w5RGUUe5028742
        for <linux-kbuild@vger.kernel.org>; Thu, 28 Jun 2018 01:30:30 +0900
Received: by mail-vk0-f50.google.com with SMTP id b134-v6so1532621vke.13
        for <linux-kbuild@vger.kernel.org>; Wed, 27 Jun 2018 09:30:30 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20180622192739.5327-2-dirk@gouders.net>
References: <20180622192739.5327-1-dirk@gouders.net> <20180622192739.5327-2-dirk@gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 28 Jun 2018 01:29:49 +0900
Message-ID: <CAK7LNASmkU0LUyG3aOeUNODrwkpp2=mBAWSVhePgGBO7R9Z1HA@mail.gmail.com>
Subject: Re: [PATCH 1/3] kconfig: avoid assert()-triggered segfaults in xfwrite()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-06-23 4:27 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> xfwrite uses assert() to ensure it does not operate on empty strings.
> Two users respect this, expr_print_file_helper() doesn't and causes
> segfaults e.g. when the dependency for an empty default string is printed.
>
> Fix this by calling xfwrite with an empty string pattern ("") for
> empty strings.
>
> INITRAMFS_SOURCE was one symbol that caused this problem, with this
> fix applied the zconfdump() output for this symbol looks as follows:
>
> ------------------------------------------------------------------------
> config INITRAMFS_SOURCE
>   string
>   symbol INITRAMFS_SOURCE
>   prompt "Initramfs source file(s)" if BLK_DEV_INITRD
>   default "" if BLK_DEV_INITRD
>   help
> This can be either a single cpio archive with a .cpio suffix or a
> space-separated list of directories and files for building the
> initramfs image.  A cpio archive should contain a filesystem archive
> to be used as an initramfs image.  Directories should contain a
> filesystem layout to be included in the initramfs image.  Files
> should contain entries according to the format described by the
> "usr/gen_init_cpio" program in the kernel tree.
>
> When multiple directories and files are specified then the
> initramfs image will be the aggregate of all of them.
>
> See <file:Documentation/early-userspace/README> for more details.
>
> If you are not sure, leave it blank.
> ------------------------------------------------------------------------
>
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> ---


Hmm, please let me think about this.

I know this is an easy way to fix the seg-fault,
but I think it is not a correct way.



If the config entry were like this:

config INITRAMFS_SOURCE
        string "Initramfs source file(s)"
        default "foo"



It would be dumped like this:

config INITRAMFS_SOURCE
  string
  symbol INITRAMFS_SOURCE
  prompt "Initramfs source file(s)"
  default foo




I want it to be displayed like this:

   default "foo"


If we can quote the string values,
the problem will be eventually fixed.

It may not be easy to fix it...




>  scripts/kconfig/expr.c | 5 ++++-
>  1 file changed, 4 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index e1a39e90841d..e064bf4c2881 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -1231,7 +1231,10 @@ void expr_print(struct expr *e,
>
>  static void expr_print_file_helper(void *data, struct symbol *sym, const char *str)
>  {
> -       xfwrite(str, strlen(str), 1, data);
> +       if (*str != '\0')
> +               xfwrite(str, strlen(str), 1, data);
> +       else
> +               xfwrite("\"\"", 2, 1, data);
>  }
>
>  void expr_fprint(struct expr *e, FILE *out)
> --
> 2.13.6
>
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
