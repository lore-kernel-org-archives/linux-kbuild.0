Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:40502 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726183AbeHPAEy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Aug 2018 20:04:54 -0400
MIME-Version: 1.0
References: <CAK7LNAT9p+YPmvasWPG1qdriM+dkauf6h3bqJLnxTcZo8LG_SA@mail.gmail.com>
In-Reply-To: <CAK7LNAT9p+YPmvasWPG1qdriM+dkauf6h3bqJLnxTcZo8LG_SA@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 15 Aug 2018 14:10:51 -0700
Message-ID: <CA+55aFxRPLjo_XnWDw5sYLnSjNhf8iPHGXomQitnGJjyuViXCQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/3] Kconfig updates for v4.19
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

On Wed, Aug 15, 2018 at 10:58 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Masahiro Yamada (15):
>       kconfig: make syncconfig update .config regardless of sym_change_count

This one is annoying me.

I don't care if it updates .config. But it does so *noisily*, so now
my build scripts en dup having extra noise coming out from them in the
form of another

  scripts/kconfig/conf  --syncconfig Kconfig
  #
  # configuration written to .config
  #

which is just distracting me and doesn't seem to add any value at all.

Ok, so it happens because I for legacy reasons have a "made dep" that
isn't useful any more (but my fingers have that as the "let's do a
kernel build" now macro), but it does seem to be entirely pointless.
Why make that big noise about something that doesn't even *do*
anything?

                  Linus
