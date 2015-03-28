Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ftx-008-i768.relay.mailchannels.net ([50.61.143.68]:65237 "EHLO
	relay.mailchannels.net" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
	with ESMTP id S1750881AbbC1RRg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 28 Mar 2015 13:17:36 -0400
Date: Sat, 28 Mar 2015 15:59:14 +0000
From: Jason Cooper <jason@lakedaemon.net>
Subject: Re: [PATCH] dtbsinstall: don't move target directory out of the way
Message-ID: <20150328155913.GB25778@io.lakedaemon.net>
References: <20150328132320.GA24391@n2100.arm.linux.org.uk>
 <E1YbqvP-000283-5m@rmk-PC.arm.linux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1YbqvP-000283-5m@rmk-PC.arm.linux.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Russell King <rmk+kernel@arm.linux.org.uk>
Cc: torvalds@linux-foundation.org, Grant Likely <grant.likely@secretlab.ca>, Rob Herring <robh@kernel.org>, Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org, Pawel Moll <pawel.moll@arm.com>, Ian Campbell <ijc+devicetree@hellion.org.uk>, Stephen Warren <swarren@wwwdotorg.org>, Olof Johansson <olof@lixom.net>, linux-arm-kernel@lists.infradead.org, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sat, Mar 28, 2015 at 01:37:19PM +0000, Russell King wrote:
> No other kernel installation target moves the target directory out of
> the way, even deleting an old version of it.  These are destructive
> operations, ones which the kernel build system should not be making.
> 
> Remove this behaviour.
> 
> If this behaviour is required at installation time, this should be
> done by the installation external to the kernel makefiles, just like
> it would be done for 'make modules_install'.
> 
> Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> ---
>  scripts/Makefile.dtbinst | 2 --
>  1 file changed, 2 deletions(-)

Acked-by: Jason Cooper <jason@lakedaemon.net>

thx,

Jason.
