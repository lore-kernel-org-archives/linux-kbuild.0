Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39287 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727703AbgCaPLh (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 31 Mar 2020 11:11:37 -0400
MIME-Version: 1.0
References: <CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com>
 <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
In-Reply-To: <1A630698-E385-4CDF-9755-ACDAAF60DBB9@fb.com>
Reply-To: sedat.dilek@gmail.com
From: Sedat Dilek <sedat.dilek@gmail.com>
Date: Tue, 31 Mar 2020 17:11:35 +0200
Message-ID: <CA+icZUWBJz6765Szg65HcOfhDh9tyoarJTnZ_kmahqvB5QKU=g@mail.gmail.com>
Subject: Re: [PATCH v3 0/8] Add support for ZSTD-compressed kernel and initramfs
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nick Terrell <terrelln@fb.com>
Cc: Nick Terrell <nickrterrell@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Chris Mason <clm@fb.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "x86@kernel.org" <x86@kernel.org>, "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>, Petr Malat <oss@malat.biz>, Kees Cook <keescook@chromium.org>, Kernel Team <Kernel-team@fb.com>, Adam Borowski <kilobyte@angband.pl>, Patrick Williams <patrickw3@fb.com>, Michael van der Westhuizen <rmikey@fb.com>, "mingo@kernel.org" <mingo@kernel.org>, Patrick Williams <patrick@stwcx.xyz>, Nick Desaulniers <ndesaulniers@google.com>

On Tue, Mar 31, 2020 at 6:15 AM Nick Terrell <terrelln@fb.com> wrote:

[...]

> > Do you plan to push this for Linux v5.7?
>
> I hope that it will be accepted. From my point of view this patch set is
> ready for merge, except for the maximum window size increase
> requested by Petr.
>

Hi Nick,

thanks for your answer.

Did you send out a pull-request already?

Can you point me to that request or patch of Petr?
Is it relevant or optional for the pull-request?

> > Feel free to add credits for the whole series:
> >
> >   Tested-by: Sedat Dilek <sedat.dilek@gmail.com>
>
> Thanks for testing the patch set Sedat!
>

I have re-tested zstd-v3 patchset with Linux version 5.6 final and
Clang/LLD version 10.0.0 final (from Debian/unstable repository).

Is it possible to mention that there might distro-specific changes
needed to initramfs-handling?
For Debian you are welcome to include below Link [1].
Not sure I will send/ask to/on the debian-kernel mailing list in this topic.

Thanks and bonne chance.

Regards,
- Sedat -

[1] LINK: https://lore.kernel.org/lkml/CA+icZUXCn2an9aNDrm+-eneSAOyGibz0W1xYhwkA5k3B3U-5vQ@mail.gmail.com/
