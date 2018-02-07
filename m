Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f68.google.com ([209.85.213.68]:37505 "EHLO
        mail-vk0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750899AbeBGXnH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 7 Feb 2018 18:43:07 -0500
MIME-Version: 1.0
In-Reply-To: <1517877294-4826-6-git-send-email-yamada.masahiro@socionext.com>
References: <1517877294-4826-1-git-send-email-yamada.masahiro@socionext.com> <1517877294-4826-6-git-send-email-yamada.masahiro@socionext.com>
From: Ulf Magnusson <ulfalizer@gmail.com>
Date: Thu, 8 Feb 2018 00:43:05 +0100
Message-ID: <CAFkk2KRpb2aGNS4DP3iwqbZNXcAdXyjHsS1MrsYUgKUm-6vAUA@mail.gmail.com>
Subject: Re: [PATCH 05/14] kconfig: remove 'config*' pattern from .gitignnore
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Andrew Morton <akpm@linux-foundation.org>, Nicolas Pitre <nicolas.pitre@linaro.org>, "Luis R . Rodriguez" <mcgrof@suse.com>, Randy Dunlap <rdunlap@infradead.org>, Sam Ravnborg <sam@ravnborg.org>, Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Tue, Feb 6, 2018 at 1:34 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> I could not figure out why this pattern should be ignored.
> Checking commit 1e65174a3378 ("Add some basic .gitignore files")
> did not help.
>
> Let's remove this pattern, then see if it is really needed.
>
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
> ---
>
>  scripts/kconfig/.gitignore | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/scripts/kconfig/.gitignore b/scripts/kconfig/.gitignore
> index 51f1c87..a76856e 100644
> --- a/scripts/kconfig/.gitignore
> +++ b/scripts/kconfig/.gitignore
> @@ -1,7 +1,6 @@
>  #
>  # Generated files
>  #
> -config*
>  *.lex.c
>  *.tab.c
>  *.tab.h
> --
> 2.7.4
>

Reviewed-by: Ulf Magnusson <ulfalizer@gmail.com>
