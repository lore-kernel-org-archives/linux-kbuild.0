Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pasmtpa.tele.dk ([80.160.77.114]:55686 "EHLO pasmtpA.tele.dk"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750753AbYBEMDc (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Feb 2008 07:03:32 -0500
Date: Tue, 5 Feb 2008 13:03:34 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: Fix instrumentation removal breakage on avr32
Message-ID: <20080205120334.GA23560@uranus.ravnborg.org>
References: <20080203211042.GF2648@uranus.ravnborg.org> <20080204124448.3633e937@dhcp-252-066.norway.atmel.com> <20080204194626.GA16664@uranus.ravnborg.org> <20080205121126.7ccdce8f@dhcp-252-066.norway.atmel.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080205121126.7ccdce8f@dhcp-252-066.norway.atmel.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Haavard Skinnemoen <hskinnemoen@atmel.com>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

On Tue, Feb 05, 2008 at 12:11:26PM +0100, Haavard Skinnemoen wrote:
> On Mon, 4 Feb 2008 20:46:26 +0100
> Sam Ravnborg <sam@ravnborg.org> wrote:
> 
> > Sorry for not catching this.
> > I just blow away my git tree at kernel.org to avoid getting it
> > merged with the bug but Linus was too quick for me so he already
> > merged kbuild.git and applied this patch afterwards.
> 
> Ok, the result looks good. Thanks.
> 
> Bisecting on avr32 will be a nightmare though, but not only because of
> this patch...

This problem had not required a cross-tool chain - so no excuses but..
I recal I once had an AVR32 toolchain but I lost it when I got my new dev box.

Any pointer to a recent AVR32 toolchain I can use for test builds.

	Sam
