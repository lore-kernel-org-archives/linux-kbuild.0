Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50467 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753660AbaFPGEK (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Jun 2014 02:04:10 -0400
Date: Mon, 16 Jun 2014 08:04:07 +0200
From: Jean Delvare <jdelvare@suse.de>
Subject: Re: Duplicate Kconfig symbol
Message-ID: <20140616080407.27869160@endymion.delvare>
In-Reply-To: <20140615175909.GA22479@ravnborg.org>
References: <20140615181906.20b46668@endymion.delvare>
	<20140615175909.GA22479@ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: "Yann E. MORIN" <yann.morin.1998@free.fr>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

Hi Sam,

On Sun, 15 Jun 2014 19:59:09 +0200, Sam Ravnborg wrote:
> On Sun, Jun 15, 2014 at 06:19:06PM +0200, Jean Delvare wrote:
> > Hi Yann, all,
> > 
> > HISAX_AVM_A1_PCMCIA is declared twice in drivers/isdn/hisax/Kconfig. As
> > a bool both times, but with different defaults and dependencies.
> > 
> > As far as I can see, Kconfig simply ignores the second declaration.
> No - the second declaration wins.

My testing indicates that the first declaration of HISAX_AVM_A1_PCMCIA
wins. If I add a prompt to the second declarations, it shows up in the
menu and the help prints both prompts each with its location, so the
second declaration not completely ignored, but the dependencies are
taken from the first declaration.

> This is on purpose so an arch can override some generic symbol.
> This is used in a lot of places.
> People often add definitions to all archs rahter than a single generic place :-(
> 
> > I'll send a patch to the maintainer of the ISDN subsystem, but
> > couldn't/shouldn't Kconfig complain about the second declaration,
> > instead of ignoring it? That would let us spot such errors much earlier.
> HISAX_AVM_A1_PCMCIA should not appear twice in the same file - so
> please have this fixed.

Then can we at least have Kconfig complain when a symbol is defined
more than once in a given file?

Thanks,
-- 
Jean Delvare
SUSE L3 Support
