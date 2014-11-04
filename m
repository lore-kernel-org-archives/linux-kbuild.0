Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pd0-f175.google.com ([209.85.192.175]:45398 "EHLO
	mail-pd0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751337AbaKDErP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 3 Nov 2014 23:47:15 -0500
Received: by mail-pd0-f175.google.com with SMTP id y13so12954677pdi.34
        for <linux-kbuild@vger.kernel.org>; Mon, 03 Nov 2014 20:47:14 -0800 (PST)
Date: Mon, 3 Nov 2014 20:47:17 -0800
From: Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] dts, kbuild: Implement support for dtb vendor subdirs
Message-ID: <20141104044717.GA13562@quad.lixom.net>
References: <1409899692-1455-1-git-send-email-rric@kernel.org>
 <20141021181504.GV20170@rric.localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20141021181504.GV20170@rric.localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Robert Richter <rric@kernel.org>
Cc: Rob Herring <robh+dt@kernel.org>, Mark Rutland <mark.rutland@arm.com>, Arnd Bergmann <arnd@arndb.de>, Michal Marek <mmarek@suse.cz>, linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Robert Richter <rrichter@cavium.com>, Andrew Bresticker <abrestic@google.com>, Abhilash Kesavan <kesavan.abhilash@gmail.com>

On Tue, Oct 21, 2014 at 08:15:04PM +0200, Robert Richter wrote:
> Arnd,
> 
> On 05.09.14 08:48:06, Robert Richter wrote:
> > From: Robert Richter <rrichter@cavium.com>
> > 
> > For arm64 we want to put dts files into vendor's subdirectories from
> > the beginning. This patch set implements this. As this is a generic
> > kbuild implementation, vendor subdirs will be also available for
> > arch/arm and other architectures. The subdirectory tree is also
> > reflected in the install path.
> > 
> > A new makefile variable dts-dirs is introduced to point to dts
> > subdirs. This variable is used by kbuild for building and installation
> > of dtb files.
> > 
> > A dts Makefile looks now as follows:
> > 
> > ----
> > dtb-$(CONFIG_...) += some_file_1.dtb
> > dtb-$(CONFIG_...) += some_file_2.dtb
> > 
> > dts-dirs          += dir_vendor_a
> > dts-dirs          += dir_vendor_b
> > 
> > # come always afterwards:
> > always         := $(dtb-y)
> > subdir-y       := $(dts-dirs)
> > clean-files    := *.dtb
> > ----
> > 
> > This patches also introduces the dtbs_install make target for
> > arm64. Install rules are moved to Makefile.dtbinst using the same
> > style and calling convention like for modinst and fwinst.
> > 
> > Robert Richter (6):
> >   dts, arm64: Add dtbs_install make target
> >   dts, kbuild: Factor out dtbs install rules to Makefile.dtbinst
> >   dts, arm/arm64: Remove dtbs build rules in sub-makes
> >   dts, kbuild: Implement support for dtb vendor subdirs
> >   dts, arm64: Move dts files to vendor subdirs
> >   dts, arm: Remove $(MACHINE) variable from dtbs make recipes
> 
> please pull this series for inclusion into v3.19 from:
> 
>  git://git.kernel.org/pub/scm/linux/kernel/git/rric/linux.git dts-subdirs-for-arm-soc-v3.19
> 
> I have updated and rebased the patches to v3.18-rc1. No changes except
> conflict resolution of patch 5/6.

Pulled, and I added the description from 0/6 as the merge text -- feel free to
add it to the tag if you do something like this in the future.


-Olof
