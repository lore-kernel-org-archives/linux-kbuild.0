Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:32942 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932269AbeFFSmB (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Jun 2018 14:42:01 -0400
MIME-Version: 1.0
References: <CAK7LNASMpvFgue9gZ=6Epq_Skt2pvTVOoT9w=SzA_uGR87KP-w@mail.gmail.com>
In-Reply-To: <CAK7LNASMpvFgue9gZ=6Epq_Skt2pvTVOoT9w=SzA_uGR87KP-w@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 6 Jun 2018 11:41:49 -0700
Message-ID: <CA+55aFyWNq8Hcg0DWB+7H2+JD-q5ZhdANJgYP0gAiW-+mnkjwQ@mail.gmail.com>
Subject: Re: [GIT PULL 2/2] Kconfig updates for v4.18
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

On Wed, Jun 6, 2018 at 10:19 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Please pull Kconfig updates for v4.18

Thanks, pulled, going through my build testing now.

I just wanted to say how much I like the new Kconfig syntax
extensions, even if this tree didn't contain the nice cleanups to
actually use the new syntax.

Of course, maybe it causes unforseen problems and I'll grow to hate it
over time, but at least for now this really looks *so* nice to have
the ability move nasty things from Makefiles to the Kconfig phase.

Thanks,

          Linus
