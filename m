Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61556 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731745AbgEZK3i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 May 2020 06:29:38 -0400
MIME-Version: 1.0
References: <20200521043117.242585-1-masahiroy@kernel.org>
In-Reply-To: <20200521043117.242585-1-masahiroy@kernel.org>
From: Masahiro Yamada <masahiroy@kernel.org>
Date: Tue, 26 May 2020 19:28:32 +0900
Message-ID: <CAK7LNAT6p5kj5BWvF8M+7LFyOM0dxUe1w9DL5SzY65ZNraWutQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: doc: remove documentation about copying
 Module.symvers around
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>
Cc: Jessica Yu <jeyu@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Thu, May 21, 2020 at 1:31 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> This is a left-over of commit 39808e451fdf ("kbuild: do not read
> $(KBUILD_EXTMOD)/Module.symvers").
>
> Kbuild no longer supports this way.
>
> Signed-off-by: Masahiro Yamada <masahiroy@kernel.org>
> ---
>

Applied to linux-kbuild.



>  Documentation/kbuild/modules.rst | 12 ------------
>  1 file changed, 12 deletions(-)
>
> diff --git a/Documentation/kbuild/modules.rst b/Documentation/kbuild/modules.rst
> index e0b45a257f21..a45cccff467d 100644
> --- a/Documentation/kbuild/modules.rst
> +++ b/Documentation/kbuild/modules.rst
> @@ -528,18 +528,6 @@ build.
>                 will then do the expected and compile both modules with
>                 full knowledge of symbols from either module.
>
> -       Use an extra Module.symvers file
> -               When an external module is built, a Module.symvers file
> -               is generated containing all exported symbols which are
> -               not defined in the kernel. To get access to symbols
> -               from bar.ko, copy the Module.symvers file from the
> -               compilation of bar.ko to the directory where foo.ko is
> -               built. During the module build, kbuild will read the
> -               Module.symvers file in the directory of the external
> -               module, and when the build is finished, a new
> -               Module.symvers file is created containing the sum of
> -               all symbols defined and not part of the kernel.
> -
>         Use "make" variable KBUILD_EXTRA_SYMBOLS
>                 If it is impractical to add a top-level kbuild file,
>                 you can assign a space separated list
> --
> 2.25.1
>


-- 
Best Regards
Masahiro Yamada
