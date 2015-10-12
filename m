Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:34995 "EHLO
	mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750710AbbJLFEe (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Oct 2015 01:04:34 -0400
MIME-Version: 1.0
In-Reply-To: <CAJhHMCA=CGdBdnGKzG05HDPOESgGZvZ=VwDTMUnpgT==mKSe3w@mail.gmail.com>
References: <CAJhHMCA=CGdBdnGKzG05HDPOESgGZvZ=VwDTMUnpgT==mKSe3w@mail.gmail.com>
Date: Sun, 11 Oct 2015 22:04:31 -0700
Message-ID: <CA+r1Zhhs5Ef1sqC8iV11vwAwVkezxRjmM6-cuA63T3ya0Ne4EQ@mail.gmail.com>
Subject: Re: bindeb-pkg error (was Re: kbuild misc changes for v4.3-rc1 )
From: Jim Davis <jim.epost@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pranith Kumar <bobby.prani+lkml@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, Linus Torvalds <torvalds@linux-foundation.org>, Andi Kleen <ak@linux.intel.com>, andrej.skvortzov@gmail.com, arnaud.patard@rtp-net.org, Borislav Petkov <bp@suse.de>, dmitry.kalinkin@gmail.com, Florian Fainelli <f.fainelli@gmail.com>, fabio.estevam@freescale.com, k.kozlowski@samsung.com, linux@rasmusvillemoes.dk, lists@nerdbynature.de, mike.marciniszyn@intel.com, Riku Voipio <riku.voipio@linaro.org>, sboyd@codeaurora.org, linux-kbuild@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>

On Sun, Oct 11, 2015 at 7:58 PM, Pranith Kumar
<bobby.prani+lkml@gmail.com> wrote:
>
>
> ../linux-firmware-image-4.3.0-rc4_4.3.0-rc4-7_powerpc.deb: No such
> file or directory
> scripts/package/Makefile:97: recipe for target 'bindeb-pkg' failed
> make[1]: *** [bindeb-pkg] Error 2
> Makefile:1226: recipe for target 'bindeb-pkg' failed
> make: *** [bindeb-pkg] Error 2

So this is a build on a ppc system?  What's the distro?  I've checked
that bindeb-pkg works fine with 4.3-rc4 on Ubuntu 15.04 with the amd64
architecture, but that's probably not much consolation.

-- 
Jim
