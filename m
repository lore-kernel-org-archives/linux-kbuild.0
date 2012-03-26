Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.17.9]:49178 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754969Ab2CZIj7 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Mar 2012 04:39:59 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: Inconsistent kallsyms data on ARM.
Date: Mon, 26 Mar 2012 08:39:46 +0000
References: <CAP=VYLoStscdVJretZ-Rkbp7V3Vsm8N0oWcjih7ruHFiDN7CiA@mail.gmail.com> <20120326073704.GH5611@n2100.arm.linux.org.uk> <20120326074533.GL15647@pengutronix.de>
In-Reply-To: <20120326074533.GL15647@pengutronix.de>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 8bit
Message-Id: <201203260839.46858.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Uwe =?iso-8859-1?q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: Russell King - ARM Linux <linux@arm.linux.org.uk>, Jon Masters <jonathan@jonmasters.org>, Paul Gortmaker <paul.gortmaker@windriver.com>, linux-next@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-kbuild@vger.kernel.org

On Monday 26 March 2012, Uwe Kleine-König wrote:
> On Mon, Mar 26, 2012 at 08:37:04AM +0100, Russell King - ARM Linux wrote:
> > On Sun, Mar 25, 2012 at 07:59:44PM -0400, Jon Masters wrote:
> > > As to longer term, I am happy to work up something that will spot this
> > > particular kind of failure (symbol changes type) and output something
> > > more useful during the kallsyms generation if you would like.
> > > 
> > > Are you planning to pull in either of the fixes you mention?
> > 
> > I'm not, because those are all sub-optimal - I don't see why we should
> > bloat the kernel image just for the sake of working around kallsyms.
> > 
> > The best I've come up with so far which avoids that is to force
> > KALLSYMS_EXTRA_PASS to always be set on ARM.
> Just to let you know: I even saw failures with KALLSYMS_EXTRA_PASS set.
> Not so in the recent past and sometimes not even reproducible IIRC.
> I will save the build results next time it happens now that I saw what
> to look for.

Yes, I saw these too in my randconfig builds some time ago. Maybe a handful
of builds among 50000 configurations.

	Arnd
