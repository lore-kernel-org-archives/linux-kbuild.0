Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:34342 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934951AbeFMRt2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 13:49:28 -0400
MIME-Version: 1.0
References: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
 <CA+55aFyxY9f9_eGv3CvA0zwzo8K5WeNbNPDFuyhtCrzRyic85A@mail.gmail.com>
 <CA+55aFy2KEzTiF=0nG8_RFoPpycaqc=n-hf-mQSbKotMzYJG-w@mail.gmail.com> <CAK7LNASd7Mc8eU76L24ZC0OFdUf566adNGVvX9Ou987cT3CCWw@mail.gmail.com>
In-Reply-To: <CAK7LNASd7Mc8eU76L24ZC0OFdUf566adNGVvX9Ou987cT3CCWw@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 13 Jun 2018 10:49:16 -0700
Message-ID: <CA+55aFz7KGMcvABxJfYs719ySyt2JouDX9t0SAV4Qu9yY9tfPA@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for 4.18 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On Wed, Jun 13, 2018 at 10:29 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> I cannot come up with a name better than CC_STACKPROTECTOR_STRONG.

How about just calling it STACKPROTETOR_STRONG and leaving it at that?

Make the "CC_HAVE_xyz" model for compiler feature tests, but when
actually picking an actual option, it's not really about the compiler
any more, except in the sense that it depends on it.

I guess we could leave the CC_STACKPROTECTOR option as-is, just
because it apparently has a lot of small uses in actual code too, but
there is absolutely nothing that uses CONFIG_CC_STACKPROTECTOR_STRONG
outside of the actual compiler option choice (and config files)

                Linus
