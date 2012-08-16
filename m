Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f174.google.com ([209.85.220.174]:42133 "EHLO
	mail-vc0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753614Ab2HPSP2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 16 Aug 2012 14:15:28 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdVed0OU+D_tdrG-UtFiLzFp0KQKWVpY+OS9M1oCs_4SnQ@mail.gmail.com>
References: <CAMuHMdVEKpVYn+Yr5rzdOvV5zUWrD12Fas197Mn2oVDC5YgVgw@mail.gmail.com>
	<1345125049.26882.16.camel@joe2Laptop>
	<CAMuHMdVed0OU+D_tdrG-UtFiLzFp0KQKWVpY+OS9M1oCs_4SnQ@mail.gmail.com>
Date: Thu, 16 Aug 2012 20:15:27 +0200
Message-ID: <CAMuHMdWMxXq8KjF=Jdys9s-SzhoFbJsSEDbH1n+3DtE1Hs6oag@mail.gmail.com>
Subject: Re: Regression: Spurious "^A" in UML output
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: uml-devel <user-mode-linux-devel@lists.sourceforge.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, linux-kernel@vger.kernel.org

On Thu, Aug 16, 2012 at 5:03 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> However, now include/linux/kern_levels.h is fairly self-container, perhaps
> we should just include that file directly instead of, and get rid of all
> DEFINE_STR() users.

I sent out a patch to do that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
