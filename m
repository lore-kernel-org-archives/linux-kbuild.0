Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f176.google.com ([209.85.220.176]:50289 "EHLO
	mail-fx0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753501AbZCOKxI convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Mar 2009 06:53:08 -0400
MIME-Version: 1.0
In-Reply-To: <20090315102856.GB6292@uranus.ravnborg.org>
References: <20090315102341.GA6051@uranus.ravnborg.org>
	 <20090315102856.GB6292@uranus.ravnborg.org>
Date: Sun, 15 Mar 2009 11:53:03 +0100
Message-ID: <10f740e80903150353i233d0da5rabde6e97607e3435@mail.gmail.com>
Subject: Re: [PATCH 2/2] kconfig: improve seed in randconfig
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Roman Zippel <zippel@linux-m68k.org>, Ingo Molnar <mingo@elte.hu>

On Sun, Mar 15, 2009 at 11:28, Sam Ravnborg <sam@ravnborg.org> wrote:
> 'make randconfig' uses glibc's rand function, and the seed of
> that PRNG is set via:
>
>                        srand(time(NULL));
>
> But 'time()' only increases once every second - freezing the
> randconfig result within a single second.
>
> My Nehalem testbox does randconfig much faster than 1 second
>  and i have a few scripts that do 'randconfig until condition X'
> loops.
>
> Those scripts currently waste a lot of CPU time due to randconfig
> changing its seed only once per second currently.
>
> Change the seed to be micrseconds based. (I checked the statistical
> spread of the seed - the now.tv_sec*now.tv_usec multiplication
> there further improves it.)

> +                       gettimeofday(&now, NULL);
> +
> +                       seed = (unsigned int)(now.tv_sec*now.tv_usec);

Just wondering: may there be some platforms that don't offer microsecond
resolution, and tv_usec is always zero?

Gr{oetje,eeting}s,

						Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
							    -- Linus Torvalds
