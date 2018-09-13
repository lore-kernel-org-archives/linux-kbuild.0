Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:35703 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727760AbeIMUPy (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 13 Sep 2018 16:15:54 -0400
MIME-Version: 1.0
References: <CALjTZvb4hOY_Hew-jEUtpyhkGbmh4Tgb0doPC6EaGtz_rMGt7A@mail.gmail.com>
 <eb1fe15c9ced6950d6a38c901278b8196ae4938d.camel@decadent.org.uk>
In-Reply-To: <eb1fe15c9ced6950d6a38c901278b8196ae4938d.camel@decadent.org.uk>
From: Rui Salvaterra <rsalvaterra@gmail.com>
Date: Thu, 13 Sep 2018 16:05:47 +0100
Message-ID: <CALjTZvYcKOycB=XeF-Eqtmq3ADh2be+gfWGiw0jbSgEUo6q8Dw@mail.gmail.com>
Subject: Re: 4.19-rc3: bindeb-pkg target is failing on ppc64
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: ben@decadent.org.uk
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, 13 Sep 2018 at 13:32, Ben Hutchings <ben@decadent.org.uk> wrote:
>
> On Tue, 2018-09-11 at 15:58 +0100, Rui Salvaterra wrote:
> > Greetings! I'm having trouble building the kernel on my ppc64 machine
> > (Power Mac G5) running Debian Sid. The make bindeb-pkg target is failing
> > ever since 4.19-rc1. Is this a known issue? If not, let me know if you need
> > anything else in order to help debug this. Thanks in advance!
>
> It sounds like you don't actually have a ppc64 installation, but a
> powerpc installation with a 64-bit kernel.  In that case you will now
> need to add ppc64 as a secondary architecture by running:
>
>     dpkg --add-architecture ppc64
>
> If that doesn't help, please send the error messages you're getting.
>
> Ben.
>
> --
> Ben Hutchings
> Computers are not intelligent.  They only think they are.
>

Hi, Ben!

Thanks for the hint, I had added the ppc64 architecture already, but
no luck. I spent yesterday bisecting between v4.18 and v4.19-rc1, but
the result pointed to an obviously wrong commit.
Serendipitously (by building a v4.19-rc3 allnoconfig), I discovered
32-bit builds fine, but 64-bit big endian doesn't.
I started digging in the git history for some clues. I tried reverting
this commit[1], which seemed suspicious, but the build still fails
(the initial dpkg-buildpackage warnings are gone, though).
Let me know what else can I do to help.

Thanks,

Rui

[1] https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit/?id=50d511ba6246c46654857b8ef64aefe76a87e455
