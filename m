Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:54788 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932327AbdJ0X4m (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 27 Oct 2017 19:56:42 -0400
MIME-Version: 1.0
In-Reply-To: <1508993751-17218-1-git-send-email-yamada.masahiro@socionext.com>
References: <1508993751-17218-1-git-send-email-yamada.masahiro@socionext.com>
From: Jim Davis <jim.epost@gmail.com>
Date: Fri, 27 Oct 2017 16:56:40 -0700
Message-ID: <CA+r1Zhhy_kbW_EwruY9n_0LCccEfFaOdfk5Jhn3NN2vwyNhuTA@mail.gmail.com>
Subject: Re: [PATCH] coccinelle: fix verbose message about .cocci file being run
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: cocci@systeme.lip6.fr, linux-kbuild <linux-kbuild@vger.kernel.org>, Julia Lawall <Julia.Lawall@lip6.fr>, Nicolas Palix <nicolas.palix@imag.fr>, linux-kernel <linux-kernel@vger.kernel.org>, Gilles Muller <Gilles.Muller@lip6.fr>, Michal Marek <michal.lkml@markovi.net>

On Wed, Oct 25, 2017 at 9:55 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> If you run coccicheck with V=1 and COCCI=, you will see a strange
> path to the semantic patch file.  For example, run the following:
>
> $ make V=1 COCCI=scripts/coccinelle/free/kfree.cocci coccicheck
>   [ snip ]
>  The semantic patch that makes this report is available
>  in scriptcoccinelle/free/kfree.cocci.
>
> Notice "s/" was dropped from "scripts/coccinelle/free/kfree.cocci".
>
> When running coccicheck without O=, $srctree is expanded to ".", which
> represents one arbitrary character in the regular expression.  Using
> sed is not a good choice here.  Strip $srctree/ simply without sed.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/coccicheck | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/scripts/coccicheck b/scripts/coccicheck
> index 1bfa2d2..9d18662 100755
> --- a/scripts/coccicheck
> +++ b/scripts/coccicheck
> @@ -186,7 +186,7 @@ coccinelle () {
>
>      if [ $VERBOSE -ne 0 -a $ONLINE -eq 0 ] ; then
>
> -       FILE=`echo $COCCI | sed "s|$srctree/||"`
> +       FILE=${COCCI#$srctree/}

[jim@krebstar linux-rc]$ make CONFIG_SHELL=dash V=1
COCCI=scripts/coccinelle/free/kfree.cocci coccicheck
dash ./scripts/coccicheck
./scripts/coccicheck: 63: ./scripts/coccicheck: Bad substitution
make: *** [Makefile:1585: coccicheck] Error 2

-- 
Jim
