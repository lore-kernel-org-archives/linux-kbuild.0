Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:53968 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935564AbeFMPze (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 11:55:34 -0400
MIME-Version: 1.0
References: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
In-Reply-To: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 13 Jun 2018 08:55:22 -0700
Message-ID: <CA+55aFyxY9f9_eGv3CvA0zwzo8K5WeNbNPDFuyhtCrzRyic85A@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for 4.18 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

On Wed, Jun 13, 2018 at 7:47 AM Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>
> Please pull more Kbuild updates.

Pulled. However, I notice a few oddities.

This causes a non-clang build to have

    CLANG_VERSION=0

in the config file. Maybe that's intentional to simplify other
expressions (ie allow "depends on CLANG_VERSION > xyz" elsewhere), but
it does look a bit odd. It looks like GCC_VERSION does the same. But
wouldn't that work even if  it's undefined (I didn't check the Kconfig
language rules)?

So if it _wasn't_ intentional, maybe add a

        depends on CC_IX_xyz

to the 'xyz_VERSION' config options? That would seem to be a bit more
logical to me.

Also, we already had one bug in the compiler detection due to the grep
looking at the wrong lines earlier. Shouldn't we have some sanity
checking of the CC_IS_xyz things?

IOW, maybe we should error out if we see *both* CC_IS_GCC and
CC_IS_CLANG, but also if we see neither?

Other than those small nit-picks, I  really like how it's more
legible, in addition to this part:

 26 files changed, 173 insertions(+), 308 deletions(-)

Thanks,

          Linus
