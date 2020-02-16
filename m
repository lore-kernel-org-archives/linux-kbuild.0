Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-06.nifty.com ([210.131.2.91]:30875 "EHLO
        conssluserg-06.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728258AbgBPOmw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 16 Feb 2020 09:42:52 -0500
MIME-Version: 1.0
References: <a06194f0-3713-cc04-1673-c05b35c03242@infradead.org>
In-Reply-To: <a06194f0-3713-cc04-1673-c05b35c03242@infradead.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Sun, 16 Feb 2020 23:41:49 +0900
Message-ID: <CAK7LNATQowM6w5TmHiqCeY7yae8j-qV==e9yw3HYD9=fABxjtg@mail.gmail.com>
Subject: Re: [PATCH] kbuild: add comment for V=2 mode
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Thu, Feb 13, 2020 at 1:41 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> From: Randy Dunlap <rdunlap@infradead.org>
>
> Complete the comments for valid values of KBUILD_VERBOSE,
> specifically for KBUILD_VERBOSE=2.
>
> Signed-off-by: Randy Dunlap <rdunlap@infradead.org>


Applied to linux-kbuild. Thanks.



> ---
>  Makefile |    1 +
>  1 file changed, 1 insertion(+)
>
> --- linux-next-20200206.orig/Makefile
> +++ linux-next-20200206/Makefile
> @@ -68,6 +68,7 @@ unexport GREP_OPTIONS
>  #
>  # If KBUILD_VERBOSE equals 0 then the above command will be hidden.
>  # If KBUILD_VERBOSE equals 1 then the above command is displayed.
> +# If KBUILD_VERBOSE equals 2 then give the reason why each target is rebuilt.
>  #
>  # To put more focus on warnings, be less verbose as default
>  # Use 'make V=1' to see the full commands
>


-- 
Best Regards
Masahiro Yamada
