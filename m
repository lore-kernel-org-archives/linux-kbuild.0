Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:52641 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935404AbeFMQD2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 13 Jun 2018 12:03:28 -0400
MIME-Version: 1.0
References: <CAK7LNARDLbEhbJGrKY6HGwfxL8ebAMBDa_2A+s2QkzQGEKyFHQ@mail.gmail.com>
 <CA+55aFyxY9f9_eGv3CvA0zwzo8K5WeNbNPDFuyhtCrzRyic85A@mail.gmail.com>
In-Reply-To: <CA+55aFyxY9f9_eGv3CvA0zwzo8K5WeNbNPDFuyhtCrzRyic85A@mail.gmail.com>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Wed, 13 Jun 2018 09:03:16 -0700
Message-ID: <CA+55aFy2KEzTiF=0nG8_RFoPpycaqc=n-hf-mQSbKotMzYJG-w@mail.gmail.com>
Subject: Re: [GIT PULL] Kbuild updates for 4.18 (2nd round)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, masahiroy@kernel.org

On Wed, Jun 13, 2018 at 8:55 AM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Wed, Jun 13, 2018 at 7:47 AM Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
> >
> > Please pull more Kbuild updates.
>
> Pulled. However, I notice a few oddities.

Oh, and one actual bug: "make oldconfig" doesn't work right.

I used to have

  CONFIG_HAVE_CC_STACKPROTECTOR=y
  # CONFIG_CC_STACKPROTECTOR_NONE is not set
  # CONFIG_CC_STACKPROTECTOR_REGULAR is not set
  # CONFIG_CC_STACKPROTECTOR_STRONG is not set
  CONFIG_CC_STACKPROTECTOR_AUTO=y

which means that since my compiler supports -fstack-protector-strong,
I should get CONFIG_CC_STACKPROTECTOR_STRONG.

But that's not at all what I get. I get

  CONFIG_HAVE_CC_STACKPROTECTOR=y
  CONFIG_CC_HAS_STACKPROTECTOR_NONE=y
  CONFIG_CC_STACKPROTECTOR=y
  # CONFIG_CC_STACKPROTECTOR_STRONG is not set
  CONFIG_CC_HAS_SANE_STACKPROTECTOR=y

ie CONFIG_CC_STACKPROTECTOR_STRONG basically went away.

The reason for that is that it takes the *old* value of
CONFIG_CC_STACKPROTECTOR_STRONG, which was "no", but that's wrong.

The meaning of the config option has changed, but it took the default
from the old meaning, and decided that I shouldn't get strong stack
protection any more.

This is a pretty dangerous silent change.

               Linus
