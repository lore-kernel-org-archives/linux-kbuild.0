Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat-132.atmel.no ([80.232.32.132]:65170 "EHLO relay.atmel.no"
	rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
	id S1751423AbYBEMJE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Feb 2008 07:09:04 -0500
Date: Tue, 5 Feb 2008 13:08:44 +0100
From: Haavard Skinnemoen <hskinnemoen@atmel.com>
Subject: Re: [PATCH] kbuild: Fix instrumentation removal breakage on avr32
Message-ID: <20080205130844.435e8cb3@dhcp-252-066.norway.atmel.com>
In-Reply-To: <20080205120334.GA23560@uranus.ravnborg.org>
References: <20080203211042.GF2648@uranus.ravnborg.org>
	<20080204124448.3633e937@dhcp-252-066.norway.atmel.com>
	<20080204194626.GA16664@uranus.ravnborg.org>
	<20080205121126.7ccdce8f@dhcp-252-066.norway.atmel.com>
	<20080205120334.GA23560@uranus.ravnborg.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Andrew Morton <akpm@linux-foundation.org>, Mathieu Desnoyers <mathieu.desnoyers@polymtl.ca>

On Tue, 5 Feb 2008 13:03:34 +0100
Sam Ravnborg <sam@ravnborg.org> wrote:

> On Tue, Feb 05, 2008 at 12:11:26PM +0100, Haavard Skinnemoen wrote:
> > On Mon, 4 Feb 2008 20:46:26 +0100
> > Sam Ravnborg <sam@ravnborg.org> wrote:
> > 
> > > Sorry for not catching this.
> > > I just blow away my git tree at kernel.org to avoid getting it
> > > merged with the bug but Linus was too quick for me so he already
> > > merged kbuild.git and applied this patch afterwards.
> > 
> > Ok, the result looks good. Thanks.
> > 
> > Bisecting on avr32 will be a nightmare though, but not only because of
> > this patch...
> 
> This problem had not required a cross-tool chain - so no excuses but..
> I recal I once had an AVR32 toolchain but I lost it when I got my new dev box.
> 
> Any pointer to a recent AVR32 toolchain I can use for test builds.

http://www.atmel.com/dyn/products/tools_card.asp?tool_id=4118

or if you want to use buildroot:

http://www.atmel.no/buildroot/

Haavard
