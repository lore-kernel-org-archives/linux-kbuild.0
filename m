Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:53738 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726808AbfEJGVT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 May 2019 02:21:19 -0400
Date: Fri, 10 May 2019 08:21:16 +0200
From: Greg KH <gregkh@linuxfoundation.org>
Subject: Re: [PATCH 2/2] kconfig: do not write .config if the content is the
 same
Message-ID: <20190510062116.GA18014@kroah.com>
References: <20190510061205.28753-1-yamada.masahiro@socionext.com>
 <20190510061205.28753-2-yamada.masahiro@socionext.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190510061205.28753-2-yamada.masahiro@socionext.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Joel Fernandes <joel@joelfernandes.org>, linux-kernel@vger.kernel.org

On Fri, May 10, 2019 at 03:12:05PM +0900, Masahiro Yamada wrote:
> Kconfig updates the .config when it exits even if its content is
> exactly the same as before. Since its timestamp becomes newer than
> that of other build artifacts, additional processing is invoked,
> which is annoying.
> 
> - syncconfig is invoked to update include/config/auto.conf, etc.
> 
> - kernel/config.o is recompiled if CONFIG_IKCONFIG is enabled,
>   then vmlinux is relinked as well.
> 
> If the .config is not changed at all, we do not have to even
> touch it. Just bail out showing "No change to .config".
> 
>   $ make allmodconfig
>   scripts/kconfig/conf  --allmodconfig Kconfig
>   #
>   # configuration written to .config
>   #
>   $ make allmodconfig
>   scripts/kconfig/conf  --allmodconfig Kconfig
>   #
>   # No change to .config
>   #
> 
> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>

Reported-by: Linus Torvalds <torvalds@linux-foundation.org> ?

:)

Anyway, nice change, looks good to me:


Reviewed-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
