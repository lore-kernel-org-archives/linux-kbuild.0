Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from v094114.home.net.pl ([79.96.170.134]:43770 "HELO
	v094114.home.net.pl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with SMTP id S1753672AbbGBTdN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Jul 2015 15:33:13 -0400
From: "Rafael J. Wysocki" <rjw@rjwysocki.net>
Subject: Re: Kconfig: '+config' valid syntax?
Date: Thu, 02 Jul 2015 21:59:34 +0200
Message-ID: <1928924.P4hPk8jEGV@vostro.rjw.lan>
In-Reply-To: <1435827662.2423.4.camel@tiscali.nl>
References: <CAD3Xx4Kh9ASyVYo7ZyRyr2maJbXwbqauQ7tUsLBUHof_hsaP2w@mail.gmail.com> <1435827662.2423.4.camel@tiscali.nl>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Paul Bolle <pebolle@tiscali.nl>
Cc: Valentin Rothberg <valentinrothberg@gmail.com>, rafael.j.wysocki@intel.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Andreas Ruprecht <andreas.ruprecht@fau.de>, hengelein Stefan <stefan.hengelein@fau.de>, linux@dominikbrodowski.net

On Thursday, July 02, 2015 11:01:02 AM Paul Bolle wrote:
> [Dropped Yann. You already know Yann disappeared.]
> 
> On Thu, 2015-07-02 at 10:08 +0200, Valentin Rothberg wrote:
> > commit ed013214afa7 ("ACPI / init: Make it possible to override _REV")
> > is in today's linux-next tree (i.e., next-20150702) adding the
> > following hunk to drivers/acpi/Kconfig:
> > 
> > --- a/drivers/acpi/Kconfig
> > +++ b/drivers/acpi/Kconfig
> > @@ -428,6 +428,26 @@ config XPOWER_PMIC_OPREGION
> >         help
> >           This config adds ACPI operation region support for XPower 
> > AXP288 PMIC.
> > 
> > ++config ACPI_REV_OVERRIDE_POSSIBLE
> 
> (Odd. Botched conflict resolution?)

A mistake.

Thanks,
Rafael

