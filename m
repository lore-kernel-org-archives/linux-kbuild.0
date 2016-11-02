Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:52615 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755338AbcKBPmB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 11:42:01 -0400
MIME-Version: 1.0
In-Reply-To: <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net> <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 3 Nov 2016 00:41:49 +0900
Message-ID: <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com>
Subject: Re: [PATCH 01/10] scripts/basic/bin2c: Complete error handling in main()
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2016-10-28 17:31 GMT+09:00 SF Markus Elfring <elfring@users.sourceforge.net>:
> From: Markus Elfring <elfring@users.sourceforge.net>
> Date: Thu, 27 Oct 2016 16:15:04 +0200
>
> Return values were not checked from five calls of the function "printf".
>
> This issue was detected also by using the Coccinelle software.
>
>
> * Add a bit of exception handling there.
>
> * Optimise this function implementation a bit.
>
>   - Replace two output calls with the functions "fputs" and "puts".
>
>   - Use the preincrement operator for the variable "total".
>
> Signed-off-by: Markus Elfring <elfring@users.sourceforge.net>
> ---
>  scripts/basic/bin2c.c | 26 ++++++++++++++++----------
>  1 file changed, 16 insertions(+), 10 deletions(-)
>
> diff --git a/scripts/basic/bin2c.c b/scripts/basic/bin2c.c
> index c3d7eef..c6c8860 100644
> --- a/scripts/basic/bin2c.c
> +++ b/scripts/basic/bin2c.c
> @@ -8,29 +8,35 @@
>   */
>
>  #include <stdio.h>
> +#include <errno.h>
>
>  int main(int argc, char *argv[])
>  {
>         int ch, total = 0;
>
>         if (argc > 1)
> -               printf("const char %s[] %s=\n",
> -                       argv[1], argc > 2 ? argv[2] : "");
> +               if (printf("const char %s[] %s=\n",
> +                          argv[1], argc > 2 ? argv[2] : "") < 16)
> +                       return errno;
>
>         do {
> -               printf("\t\"");
> +               if (fputs("\t\"", stdout) < 0)
> +                       return errno;
> +
>                 while ((ch = getchar()) != EOF) {
> -                       total++;
> -                       printf("\\x%02x", ch);
> -                       if (total % 16 == 0)
> +                       if (printf("\\x%02x", ch) < 4)
> +                               return errno;
> +                       if (++total % 16 == 0)
>                                 break;
>                 }
> -               printf("\"\n");
> +
> +               if (puts("\"") < 0)
> +                       return errno;


Is replacing printf("\"\n") with puts("\"") optimization?


Frankly, the result of this patch
seems extremely unreadable code.


-- 
Best Regards
Masahiro Yamada
