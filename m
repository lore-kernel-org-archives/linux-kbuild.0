Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34905 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1425337AbdDUTkG (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 21 Apr 2017 15:40:06 -0400
MIME-Version: 1.0
In-Reply-To: <1492801407-26823-1-git-send-email-yamada.masahiro@socionext.com>
References: <1492801407-26823-1-git-send-email-yamada.masahiro@socionext.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 21 Apr 2017 21:40:04 +0200
Message-ID: <CAMuHMdXnVucvnojMzqumvTOn=QwdDpr8FdfykjJHhtdGzO_Cyw@mail.gmail.com>
Subject: Re: [RFC PATCH 0/2] kbuild: use relative path from $(srctree) instead
 of __FILE__
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, Greg KH <gregkh@linuxfoundation.org>, the arch/x86 maintainers <x86@kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Linus Torvalds <torvalds@linux-foundation.org>, Michal Marek <mmarek@suse.com>, Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

Hi Yamada-san,

On Fri, Apr 21, 2017 at 9:03 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Kbuild works in objtree, not in srctree.  So, __FILE__ is prefixed
> with $(srctree)/ for out-of-tree build.
>
> It would be nice to see the same log regardless
> in-tree, or out-of-tree build.
>
> 1/2 adds a new macro KBUILD_FILE.  This points the relative path
> of the file we are building.  This is intended to replace __FILE__.
>
> 2/2 replaces __FILE__ in bug.h as an example.  This will improve
> the output of WARN_ON() etc.

I haven't tried your series, but I love the idea behind it!
I never liked exposing full file paths in kernel images.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
