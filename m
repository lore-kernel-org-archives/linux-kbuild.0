Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eu-smtp-delivery-151.mimecast.com ([207.82.80.151]:39825 "EHLO
        eu-smtp-delivery-151.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728395AbeJEPtu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 5 Oct 2018 11:49:50 -0400
From: David Laight <David.Laight@ACULAB.COM>
Subject: RE: [PATCH] kbuild: fix kernel/bounds.c 'W=1' warning
Date: Fri, 5 Oct 2018 08:52:02 +0000
Message-ID: <08b190b9dabd4625ae3d636b88b43ccb@AcuMS.aculab.com>
References: <20180921142234.16882-1-kieran.bingham+renesas@ideasonboard.com>
 <20181005083313.2088252-1-arnd@arndb.de>
In-Reply-To: <20181005083313.2088252-1-arnd@arndb.de>
Content-Language: en-US
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: 'Arnd Bergmann' <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>
Cc: "linux-renesas-soc@vger.kernel.org" <linux-renesas-soc@vger.kernel.org>, Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>, "stable@vger.kernel.org" <stable@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "yamada.masahiro@socionext.com" <yamada.masahiro@socionext.com>

From: Arnd Bergmann
> Sent: 05 October 2018 09:33
> 
> Building any configuration with 'make W=1' produces a warning:
> 
> kernel/bounds.c:16:6: warnign: no previous prototype for 'foo' [-Wmissing-prototypes]
> 
> When also passing -Werror, this prevents us from building any
> other files. Nobody ever calls the function, but we can't make
> it 'static' either since we want the compiler output.
> 
> Calling it 'main' instead however avoids the warning, because gcc
> does not insist on having a declaration for main.

Ugg.
main() might be special in other ways too.
It wouldn't surprise me if some linkers don't do special stuff for it.

What is wrong with just putting and extra "void foo(void);" before
the function?

	David

-
Registered Address Lakeside, Bramley Road, Mount Farm, Milton Keynes, MK1 1PT, UK
Registration No: 1397386 (Wales)
