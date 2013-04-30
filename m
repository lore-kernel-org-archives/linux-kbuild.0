Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:62819 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1759520Ab3D3KYm (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 30 Apr 2013 06:24:42 -0400
Date: Tue, 30 Apr 2013 12:24:40 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: Kconfig "softdepends" idea
Message-ID: <20130430102440.GA15522@merkur.ravnborg.org>
References: <517F9472.2030106@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <517F9472.2030106@ti.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Tomi Valkeinen <tomi.valkeinen@ti.com>
Cc: linux-kernel <linux-kernel@vger.kernel.org>, linux-kbuild@vger.kernel.org, "Balbi, Felipe" <balbi@ti.com>

> 
> So, my idea is to have a new kind of Kconfig dependency. I'll call it
> "softdepends" in lack of better name. A driver maintainer could use
> "softdepends on ARCH_OMAP", instead of "depends on ARCH_OMAP", to say
> that this driver does not actually build depend on ARCH_OMAP, but for
> all normal purposes it does.
> 
> Normally, this would result in the same behavior as the normal
> "depends", and Linus would not get a questions whether he wants to
> enable this OMAP specific driver or not, and the driver would not be
> visible on the menuconfig.
> 
> But the user could enable the driver if he explicitly so wants. Perhaps
> a Kconfig option such as "ignore softdepends", enabling of which would
> allow the user to enable the drivers that use softdepends. Or, maybe
> just require the user to add the config option manually into his .config.

If I understand you correct this is already possible today without
extending the kconfig language.

config OMAP_SPECIFIC_DRIVER
	depends on ARCH_OMAP || SHOW_ALL_DRIVERS


If SHOW_ALL_DRIVERS are "y" then user can say "y" to the OMAP specific driver too,
even without ARCH_OMAP being selected.

	Sam
