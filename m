Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from forward106p.mail.yandex.net ([77.88.28.109]:55623 "EHLO
        forward106p.mail.yandex.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728301AbfKKSnV (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 11 Nov 2019 13:43:21 -0500
From: Dmitry Golovin <dima@golovin.in>
Subject: Re: [PATCH v2] kbuild: support byacc as alternative YACC to bison
MIME-Version: 1.0
Date: Mon, 11 Nov 2019 20:37:25 +0200
Message-Id: <17102241573497445@vla1-b2d94eaf2344.qloud-c.yandex.net>
Content-Transfer-Encoding: 7bit
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Ethan Sommer <e5ten.arch@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Rob Herring <robh+dt@kernel.org>, Frank Rowand <frowand.list@gmail.com>, Sedat Dilek <sedat.dilek@gmail.com>, Nathan Chancellor <natechancellor@gmail.com>, Nick Desaulniers <ndesaulniers@google.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, DTML <devicetree@vger.kernel.org>

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

In fact Linux now can be built without using GNU
binutils and using LLVM tools instead. It's just
one architecture and a specific config now, but
eventually the others will be built too. You can
follow the progress here:
https://github.com/ClangBuiltLinux/continuous-integration/issues/73

I believe that compatibility with different
alternative tools is a good thing as long as it
doesn't add unwanted complexity. And as this patch
is just changing command-line flags to their
portable variants and explicitly adds a couple of
definitions that are presumed by GNU bison, I
can't see a problem with it.

Regards,
Dmitry
