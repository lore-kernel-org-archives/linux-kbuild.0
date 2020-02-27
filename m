Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:59758 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729134AbgB0QIG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 27 Feb 2020 11:08:06 -0500
MIME-Version: 1.0
References: <20200226174458.8115-1-masahiroy@kernel.org>
In-Reply-To: <20200226174458.8115-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 28 Feb 2020 01:07:25 +0900
Message-ID: <CAK7LNAQxD6FkYRoz+Cn=SVFr8So-m0=Qf0rASFxM_-01FC1_-A@mail.gmail.com>
Subject: Re: [PATCH] kbuild: get rid of trailing slash from subdir- example
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>

On Thu, Feb 27, 2020 at 2:45 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> obj-* needs a trailing slash for a directory, but subdir-* does not.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---

Applied to linux-kbuild.


>  Documentation/kbuild/makefiles.rst | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 0e0eb2c8da7d..c9adfa1f9e21 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -765,7 +765,7 @@ is not sufficient this sometimes needs to be explicit.
>         Example::
>
>                 #arch/x86/boot/Makefile
> -               subdir- := compressed/
> +               subdir- := compressed
>
>  The above assignment instructs kbuild to descend down in the
>  directory compressed/ when "make clean" is executed.
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
