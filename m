Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from caramon.arm.linux.org.uk ([78.32.30.218]:34673 "EHLO
	caramon.arm.linux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754826Ab2ATT2D (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Jan 2012 14:28:03 -0500
Date: Fri, 20 Jan 2012 19:27:50 +0000
From: Russell King - ARM Linux <linux@arm.linux.org.uk>
Subject: Re: inconvenience when hand editing DEBUG_LL in .config
Message-ID: <20120120192750.GE11845@n2100.arm.linux.org.uk>
References: <20120120164036.GO4066@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20120120164036.GO4066@pengutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Uwe =?iso-8859-1?Q?Kleine-K=F6nig?= <u.kleine-koenig@pengutronix.de>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, kernel@pengutronix.de, linux-arm-kernel@lists.infradead.org

On Fri, Jan 20, 2012 at 05:40:36PM +0100, Uwe Kleine-König wrote:
> Hello,
> 
> usually when I want to change a single kernel option I just open .config
> in my editor, remove the line for the config item I want to change and
> run oldconfig. For DEBUG_LL (defined in arch/arm/Kconfig.debug) this
> doesn't work as usual though.
> 
> On 3.3-rc1 the following happens:
> 
> 	make ARCH=arm at91rm9200_defconfig
> 	sed -i /CONFIG_DEBUG_LL/d .config

Note that this deletes two entries.  Use /CONFIG_DEBUG_LL\\\>/d to delete
just one (or get rid of two of those \ and use ' to quote it.)

> 	make ARCH=arm oldconfig
> 
> The last command then asks me for DEBUG_LL, after specifying 'y', the
> output looks as follows:
> 
> 	Verbose user fault messages (DEBUG_USER) [N/y/?] n
> 	Kernel low-level debugging functions (read help!) (DEBUG_LL) [N/y/?] (NEW) y
> 	  Kernel low-level debugging port
> 	  > 1. No low-level debugging UART (DEBUG_LL_UART_NONE) (NEW)
> 	    2. Kernel low-level debugging via EmbeddedICE DCC channel (DEBUG_ICEDCC) (NEW)
> 	    3. Kernel low-level debugging on rm9200, 9260/9g20, 9261/9g10 and 9rl (AT91_DEBUG_LL_DBGU0) (NEW)
> 	  choice[1-3]: 1
> 	  Early printk (EARLY_PRINTK) [N/y/?] (NEW) 
> 
> Note that I didn't specify the '1' for the choice even though all items
> are marked as new and oldconfig only starts at EARLY_PRINTK to ask
> again.
> 
> I would have expected to be able to select AT91_DEBUG_LL_DBGU0.

Confirmed here.

> This is not intended, is it?

Nope - and if you delete all the DEBUG choice entries from your .config,
it still defaults to the first and doesn't offer it for you to choose.
Ditto if you delete none.
