Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bn1on0084.outbound.protection.outlook.com ([157.56.110.84]:56760
	"EHLO na01-bn1-obe.outbound.protection.outlook.com"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1750807AbaJTQ7M (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Oct 2014 12:59:12 -0400
Date: Mon, 20 Oct 2014 17:24:25 +0200
From: Robert Richter <robert.richter@caviumnetworks.com>
Subject: Re: [GIT PULL] dts, kbuild: Implement support for dtb vendor subdirs
Message-ID: <20141020152425.GY31556@rric.localhost>
References: <1409899692-1455-1-git-send-email-rric@kernel.org>
 <CAL1qeaGCeRyeKLo70E264bZcamOfBKoN9Y8_NDCjV5j4DoOw1Q@mail.gmail.com>
 <20140919123056.GC20170@rric.localhost>
 <20140919140856.GG2295@e104818-lin.cambridge.arm.com>
 <20140923112619.GG20170@rric.localhost>
 <20141002150804.GP20170@rric.localhost>
 <CAM4voakQnY1JMnjrXfTSNTyzA6_f6jtUgJZXXz2N0YRjq3kXRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAM4voakQnY1JMnjrXfTSNTyzA6_f6jtUgJZXXz2N0YRjq3kXRg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Abhilash Kesavan <kesavan.abhilash@gmail.com>
Cc: Robert Richter <rric@kernel.org>, Olof Johansson <olof@lixom.net>, Arnd Bergmann <arnd@arndb.de>, Catalin Marinas <catalin.marinas@arm.com>, Andrew Bresticker <abrestic@google.com>, Michal Marek <mmarek@suse.cz>, Mark Rutland <Mark.Rutland@arm.com>, "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Rob Herring <robh+dt@kernel.org>, "linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>

On 20.10.14 19:26:32, Abhilash Kesavan wrote:

> >> > > > > Robert Richter (6):
> >> > > > >   dts, arm64: Add dtbs_install make target
> >> > > > >   dts, kbuild: Factor out dtbs install rules to Makefile.dtbinst
> >> > > > >   dts, arm/arm64: Remove dtbs build rules in sub-makes
> >> > > > >   dts, kbuild: Implement support for dtb vendor subdirs
> >> > > > >   dts, arm64: Move dts files to vendor subdirs
> >> > > > >   dts, arm: Remove $(MACHINE) variable from dtbs make recipes

> > you may want to pull from here alternatively.
> 
> I have been using your patchset as the base for my new arm64 SoC
> support (http://www.spinics.net/lists/linux-samsung-soc/msg37047.html).
> Are you planning to rebase and send this again as some of the patches
> did not apply cleanly for me on linux-next.

Yes, I will rebase it and resend the pull request this week.

-Robert
