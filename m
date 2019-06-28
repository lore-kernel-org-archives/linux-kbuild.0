Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk4.altibox.net ([109.247.116.15]:40824 "EHLO
        asavdk4.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726056AbfF1RDb (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 28 Jun 2019 13:03:31 -0400
Date: Fri, 28 Jun 2019 19:03:26 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: get rid of misleading $(AS) from documents
Message-ID: <20190628170326.GB12826@ravnborg.org>
References: <20190628020433.19156-1-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190628020433.19156-1-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

Hi Masahiro.

On Fri, Jun 28, 2019 at 11:04:33AM +0900, Masahiro Yamada wrote:
> The assembler files in the kernel are *.S instead of *.s, so they must
> be preprocessed. Hence, we always use $(CC) as an assembler driver.
> 
> $(AS) is almost unused in Kbuild. As of writing, there is just one user.
> 
>   $ git grep '$(AS)' -- :^Documentation
>   drivers/net/wan/Makefile:  AS68K = $(AS)
> 
> The documentation about *_AFLAGS* sounds like the flags were passed
> to $(AS). This is somewhat misleading since we do not invoke $(AS)
> directly.
Thanks, another of your many nice cleanups.

>  AFLAGS_KERNEL
>  --------------------------------------------------
> -Additional options for $(AS) when used for assembler
> -code for code that is compiled as built-in.
> +Additional options when used for assembling code that is compiled as built-in.
To me reading "assembling code" make me think of something else than the
assembler.
It would be nice to spell out that we talk about the assembler
everywhere. Even though the assembler is invoked via gcc.
This comments applies to a few places, some where "assembling" was used
in the old text.

Other than this - looks good!

	Sam
