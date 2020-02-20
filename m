Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:16587 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728130AbgBTQ3T (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Feb 2020 11:29:19 -0500
MIME-Version: 1.0
References: <20200219011519.22148-1-masahiroy@kernel.org>
In-Reply-To: <20200219011519.22148-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Fri, 21 Feb 2020 01:28:16 +0900
Message-ID: <CAK7LNARuqSDxc1=pMQXUF942TSBeDeB0NosS-n0_hhiWhQZhQw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: remove wrong documentation about mandatory-y
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Feb 19, 2020 at 10:15 AM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This sentence does not make sense in the section about mandatory-y.
>
> This seems to be a copy-paste mistake of commit fcc8487d477a ("uapi:
> export all headers under uapi directories").
>
> The correct description would be "The convention is to list one
> mandatory-y per line ...".
>
> I just removed it instead of fixing it. If such information is needed,
> it could be commented in include/asm-generic/Kbuild and
> include/uapi/asm-generic/Kbuild.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>


Applied to linux-kbuild.

> ---
>
>  Documentation/kbuild/makefiles.rst | 3 ---
>  1 file changed, 3 deletions(-)
>
> diff --git a/Documentation/kbuild/makefiles.rst b/Documentation/kbuild/makefiles.rst
> index 0e0eb2c8da7d..4018ad7c7a11 100644
> --- a/Documentation/kbuild/makefiles.rst
> +++ b/Documentation/kbuild/makefiles.rst
> @@ -1379,9 +1379,6 @@ See subsequent chapter for the syntax of the Kbuild file.
>         in arch/$(ARCH)/include/(uapi/)/asm, Kbuild will automatically generate
>         a wrapper of the asm-generic one.
>
> -       The convention is to list one subdir per line and
> -       preferably in alphabetic order.
> -
>  8 Kbuild Variables
>  ==================
>
> --
> 2.17.1
>


-- 
Best Regards
Masahiro Yamada
