Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pandora.arm.linux.org.uk ([78.32.30.218]:42868 "EHLO
	pandora.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753305AbbLKOpy (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 11 Dec 2015 09:45:54 -0500
Date: Fri, 11 Dec 2015 14:45:41 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: [PATCH] scripts: recordmcount: break hardlinks
Message-ID: <20151211144541.GT8644@n2100.arm.linux.org.uk>
References: <20151202090517.432556a4@gandalf.local.home>
 <E1a7MVT-0000et-62@rmk-PC.arm.linux.org.uk>
 <20151211093125.50b72639@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20151211093125.50b72639@gandalf.local.home>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Michal Marek <mmarek@suse.cz>, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, =?iso-8859-1?Q?M=E5ns_Rullg=E5rd?= <mans@mansr.com>, Arnd Bergmann <arnd@arndb.de>, linux-kbuild@vger.kernel.org, linux-arm-msm@vger.kernel.org, Nicolas Pitre <nico@fluxnic.net>, Stephen Boyd <sboyd@codeaurora.org>, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On Fri, Dec 11, 2015 at 09:31:25AM -0500, Steven Rostedt wrote:
> On Fri, 11 Dec 2015 12:09:03 +0000
> Russell King <rmk+kernel@arm.linux.org.uk> wrote:
> 
> > recordmcount edits the file in-place, which can cause problems when
> > using ccache in hardlink mode.  Arrange for recordmcount to break a
> > hardlinked object.
> > 
> > Signed-off-by: Russell King <rmk+kernel@arm.linux.org.uk>
> > ---
> > Steven, sorry it took a while to get this out...
> 
> Should this be for stable, or is it fine to just add this to my 4.5
> queue?

I thought you wanted to test it first - although I've been running with
this for a while now, my nightly builds have masked out the mcount
warning, and I suspect it'll take a while for ccache to purge itself
of the modified objects.

If you're happy to add a stable tag to it, then please do so.

-- 
RMK's Patch system: http://www.arm.linux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
