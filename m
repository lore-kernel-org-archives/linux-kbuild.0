Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:32844 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726947AbfLQKVu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Dec 2019 05:21:50 -0500
MIME-Version: 1.0
References: <cover.1575879069.git.tommyhebb@gmail.com> <2f42719235f9250ed10209982543f99f4fd41d61.1575879069.git.tommyhebb@gmail.com>
In-Reply-To: <2f42719235f9250ed10209982543f99f4fd41d61.1575879069.git.tommyhebb@gmail.com>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 17 Dec 2019 19:20:51 +0900
Message-ID: <CAK7LNAT8+y8HD9Kui-nVXL=fHkTeUVnEqDrTtLniWZBULFvu2A@mail.gmail.com>
Subject: Re: [PATCH 2/4] kconfig: don't crash on NULL expressions in expr_eq()
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thomas Hebb <tommyhebb@gmail.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Dec 9, 2019 at 5:19 PM Thomas Hebb <tommyhebb@gmail.com> wrote:
>
> NULL expressions are taken to always be true, as implemented by the
> expr_is_yes() macro and by several other functions in expr.c. As such,
> they ought to be valid inputs to expr_eq(), which compares two
> expressions.
>
> Signed-off-by: Thomas Hebb <tommyhebb@gmail.com>
> ---

I applied this patch.
I fixed up the block comment style. Thanks.


diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
index 8284444cc3fa..9f1de58e9f0c 100644
--- a/scripts/kconfig/expr.c
+++ b/scripts/kconfig/expr.c
@@ -254,8 +254,10 @@ static int expr_eq(struct expr *e1, struct expr *e2)
 {
        int res, old_count;

-       /* A NULL expr is taken to be yes, but there's also a different way to
-        * represent yes. expr_is_yes() checks for either representation. */
+       /*
+        * A NULL expr is taken to be yes, but there's also a different way to
+        * represent yes. expr_is_yes() checks for either representation.
+        */
        if (!e1 || !e2)
                return expr_is_yes(e1) && expr_is_yes(e2);





>  scripts/kconfig/expr.c | 5 +++++
>  1 file changed, 5 insertions(+)
>
> diff --git a/scripts/kconfig/expr.c b/scripts/kconfig/expr.c
> index 77ffff3a053c..8284444cc3fa 100644
> --- a/scripts/kconfig/expr.c
> +++ b/scripts/kconfig/expr.c
> @@ -254,6 +254,11 @@ static int expr_eq(struct expr *e1, struct expr *e2)
>  {
>         int res, old_count;
>
> +       /* A NULL expr is taken to be yes, but there's also a different way to
> +        * represent yes. expr_is_yes() checks for either representation. */
> +       if (!e1 || !e2)
> +               return expr_is_yes(e1) && expr_is_yes(e2);
> +
>         if (e1->type != e2->type)
>                 return 0;
>         switch (e1->type) {
> --
> 2.24.0
>


-- 
Best Regards
Masahiro Yamada
