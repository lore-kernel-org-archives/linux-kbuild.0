Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-il1-f195.google.com ([209.85.166.195]:46239 "EHLO
        mail-il1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726408AbfKCUaY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 3 Nov 2019 15:30:24 -0500
MIME-Version: 1.0
References: <CAK7LNASG4GzaU6SR=ThfJpjrqmC53xmcSMAWqppciWbx3jMgdw@mail.gmail.com>
 <20191029150119.19823-1-e5ten.arch@gmail.com> <CAK7LNAT0HdWrHaubdjNuVSEdQWvqj6SkXNybs5LvEd2i9Ku1cA@mail.gmail.com>
In-Reply-To: <CAK7LNAT0HdWrHaubdjNuVSEdQWvqj6SkXNybs5LvEd2i9Ku1cA@mail.gmail.com>
From: Ethan Sommer <e5ten.arch@gmail.com>
Date: Sun, 3 Nov 2019 15:30:11 -0500
Message-ID: <CAMEGPiraGzabPXUzWVNDFkkJ-4rLD00uyMnE44Kgebu5ht6t2g@mail.gmail.com>
Subject: Re: [PATCH v2] kbuild: support byacc as alternative YACC to bison
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>

> Hmm, this is unfortunate since there is no common way to
> specify the header path directly.
>
> I am not sure how much effort we should invent
> to support non-GNU implementation
> since we already rely on various GNU tools.
>
> If we decide to support byacc,
> we must carry the restriction
> that bans GNU-extension.

I just realized that I accidentally only responded to Masahiro with my
previous email from a few days ago so I'll just quote it here:
"I feel like changing 10 lines to support a different yacc
implementation that supports most of the GNU-specific features here
isn't the same thing as banning all GNU extensions, and in regards to
the file prefix, the method in my patch creates the same file names as
the bison-specific one for the 3 cases it is used for, and the flags
used for it are POSIX yacc compatible. In my opinion increasing
compatibility shouldn't have to be all or nothing, and it makes sense to
make changes that increase compatibility without outright banning GNU
extensions entirely."

Aside from that, patch to dtc has just been applied, so pulling the latest
upstream changes as well as the v2 of this patch should be what would be
needed to support byacc.
