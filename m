Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ig0-f176.google.com ([209.85.213.176]:36132 "EHLO
	mail-ig0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754442AbbGBWZI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 18:25:08 -0400
MIME-Version: 1.0
In-Reply-To: <20150702203736.GA23499@pobox.suse.cz>
References: <20150702203736.GA23499@pobox.suse.cz>
Date: Thu, 2 Jul 2015 15:25:07 -0700
Message-ID: <CA+55aFx2NScXTnv_0gx=WBe1RGdzHp=QKkaoh1cpcTZ1HKaSxg@mail.gmail.com>
Subject: Re: [GIT PULL] kbuild misc fixes for v4.2-rc1
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Andi Kleen <ak@linux.intel.com>, andrej.skvortzov@gmail.com, arnaud.patard@rtp-net.org, Borislav Petkov <bp@suse.de>, dmitry.kalinkin@gmail.com, Florian Fainelli <f.fainelli@gmail.com>, fabio.estevam@freescale.com, Jim Davis <jim.epost@gmail.com>, riku.voipio@linaro.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

So with all these changes to the build system fro 4.2, I'm *still*
getting that annoying

   X.509 certificate list changed

issue. Which apparently people don't normally see, because it does to
stdout rather than to stderr, so it's hidden by all the other random
build output.

Making it show more information gives me

   X.509 certificate list changed to "signing_key.x509" from
"./signing_key.x509"

so it's still that "./" issue.

This is *trivial* to reproduce for me using

    git clean -dqfx
    make oldconfig
    make -j16
    make -j16

where that second "make" invocation will do it.

Not only is that "./" wrong, but the whole rule to check equality is
bad because the certificate list is still generated the wrong way
around, and then randomly deleted without proper rules for it.

I sent a patch to do it right (using filechk), but it apparently never
got merged? Instead, we continue to have that racy "remove the
.x509.list file at a random time" thing.

Do I need to fish out my patch and apply it directly? I hate just
bypassing the maintainership chain for stupid things like this, but
this has been pending for way too long. At least that fixes the
re-generation of that file, even if it doesn't fix the problem with
the spurious extra ./ at the head.

                  Linus
