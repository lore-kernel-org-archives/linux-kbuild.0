Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f51.google.com ([209.85.218.51]:33921 "EHLO
	mail-oi0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753239AbbEaI02 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 31 May 2015 04:26:28 -0400
MIME-Version: 1.0
In-Reply-To: <CA+ToGPGAhmKm3RT=GB6Bxi2TBEMsWpjMTTm0WeqgQNATnM6b6g@mail.gmail.com>
References: <1432640395-17310-1-git-send-email-geert+renesas@glider.be>
	<1432640395-17310-2-git-send-email-geert+renesas@glider.be>
	<CA+ToGPGAhmKm3RT=GB6Bxi2TBEMsWpjMTTm0WeqgQNATnM6b6g@mail.gmail.com>
Date: Sun, 31 May 2015 10:26:27 +0200
Message-ID: <CAMuHMdWohSUg_uxg5VaFtT0Po_pwaht3+G7A+hAPS7B2hEXJcg@mail.gmail.com>
Subject: Re: [PATCH 2/3] kconfig: Wrap long "make help" text lines
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Diego Viola <diego.viola@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>, Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, linux-kbuild <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

On Sun, May 31, 2015 at 3:10 AM, Diego Viola <diego.viola@gmail.com> wrote:
> Can you please include a minor change in your patch?
>
> At line 89, there's this:
>
> # on its behavior(sets new symbols to their default value but not 'n') with the
>
> Please change this line to this:
>
> # on its behavior (sets new symbols to their default value but not 'n') with the
>
> There should be a space between "behavior" and the parentheses/bracket.

That's an unrelated change in an unrelated part of my patch.

Please send a separate patch to fix that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
