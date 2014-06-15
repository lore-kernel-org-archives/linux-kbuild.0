Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:43280 "EHLO
	asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751723AbaFOR71 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Jun 2014 13:59:27 -0400
Date: Sun, 15 Jun 2014 19:59:09 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Duplicate Kconfig symbol
Message-ID: <20140615175909.GA22479@ravnborg.org>
References: <20140615181906.20b46668@endymion.delvare>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20140615181906.20b46668@endymion.delvare>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jean Delvare <jdelvare@suse.de>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Sun, Jun 15, 2014 at 06:19:06PM +0200, Jean Delvare wrote:
> Hi Yann, all,
> 
> HISAX_AVM_A1_PCMCIA is declared twice in drivers/isdn/hisax/Kconfig. As
> a bool both times, but with different defaults and dependencies.
> 
> As far as I can see, Kconfig simply ignores the second declaration.
No - the second declaration wins.
This is on purpose so an arch can override some generic symbol.
This is used in a lot of places.
People often add definitions to all archs rahter than a single generic place :-(

> I'll send a patch to the maintainer of the ISDN subsystem, but
> couldn't/shouldn't Kconfig complain about the second declaration,
> instead of ignoring it? That would let us spot such errors much earlier.
HISAX_AVM_A1_PCMCIA should not appear twice in the same file - so
please have this fixed.

	Sam
