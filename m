Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:35054 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751732Ab1ETGUo convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 May 2011 02:20:44 -0400
MIME-Version: 1.0
In-Reply-To: <20110520061259.GA13483@p183>
References: <20110520061259.GA13483@p183>
Date: Fri, 20 May 2011 08:20:42 +0200
Message-ID: <BANLkTi=2yReXfrr7swhys7TgkuJ5r97jqQ@mail.gmail.com>
Subject: Re: [PATCH] kstrtox: drop kstrtol()/kstrtoul() when possible
From: Geert Uytterhoeven <geert@linux-m68k.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alexey Dobriyan <adobriyan@gmail.com>
Cc: akpm@linux-foundation.org, linux-kernel@vger.kernel.org, arnd@arndb.de, mmarek@suse.cz, linux-kbuild@vger.kernel.org

On Fri, May 20, 2011 at 08:15, Alexey Dobriyan <adobriyan@gmail.com> wrote:
> If "long" and "long long" types are identical at runtime,
> kstrtol() can be aliased to kstrtoll().
>
> Unfortunately, one can't write
>
>        #if sizeof(long) == sizeof(long long) ...

One can write #ifdef CONFIG_64BIT instead.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
