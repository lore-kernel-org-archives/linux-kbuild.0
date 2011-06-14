Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from na3sys009aog102.obsmtp.com ([74.125.149.69]:59982 "EHLO
	na3sys009aog102.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751574Ab1FNR3I (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 13:29:08 -0400
Date: Tue, 14 Jun 2011 20:29:01 +0300
From: Felipe Balbi <balbi@ti.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
Message-ID: <20110614172859.GS2353@legolas.emea.dhcp.ti.com>
Reply-To: balbi@ti.com
References: <20110614164513.GP2353@legolas.emea.dhcp.ti.com>
 <Pine.LNX.4.44L0.1106141301000.2102-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="nfj0fqmy56wRO+9X"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1106141301000.2102-100000@iolanthe.rowland.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Felipe Balbi <balbi@ti.com>, Arnaud Lacombe <lacombar@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org


--nfj0fqmy56wRO+9X
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 01:06:16PM -0400, Alan Stern wrote:
> On Tue, 14 Jun 2011, Felipe Balbi wrote:
>=20
> > > --- a/drivers/usb/gadget/Makefile
> > > +++ b/drivers/usb/gadget/Makefile
> > > @@ -34,6 +34,12 @@ obj-$(CONFIG_USB_FUSB300)    +=3D fusb300_udc.o
> > >  # USB gadget drivers
> > >  #
> > >  g_zero-y                       :=3D zero.o
> > > +g_zero-y                       +=3D composite.o
> > > +g_zero-y                       +=3D usbstring.o
> > > +g_zero-y                       +=3D config.o
> > > +g_zero-y                       +=3D epautoconf.o
> > > +g_zero-y                       +=3D f_sourcesink.o
> > > +g_zero-y                       +=3D f_loopback.o
> >=20
> > yes, you can do that. But the problem is the runtime memory footprint
> > that we will have with that. At least that was the reason why Greg had
> > asked Dave to change it to how it is done now.
>=20
> What exactly is the runtime memory footprint problem?  I thought the
> whole reason for #include'ing .c files was that back then, the kbuild
> system wasn't able to do this.

not at all. Kbuild has always been able to generate one module from
several objects. But then we need to remove "static" from many
functions to achieve that.

> > Do we support gcc --combine already ?
>=20
> As far as I know, the only advantage of gcc -combine is that it allows
> the optimizer to work on more than one file at a time.  Would that
> really make any significant difference for these particular source
> files?

AFAICT, gcc --combine will really combine the files as if they were one,
pretty much the same as including the entire C source.

Just look at the rationale from the commit log itself:

commit 4e9ba518ec19c6c961bf6074ec05ae1a927230bc
Author: David Brownell <dbrownell@users.sourceforge.net>
Date:   Mon Aug 18 17:41:02 2008 -0700

    usb gadget: link fixes for serial gadget
   =20
    Change how the serial gadget driver builds:  don't use
    separate compilation, since it works poorly when key parts
    are library code (with init sections etc).  Instead be as
    close as we can to "gcc --combine ...".
   =20
    Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
    Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>

part of it is also in any gadget driver:

/*
 * Kbuild is not very cooperative with respect to linking separately
 * compiled library objects into one module.  So for now we won't use
 * separate compilation ... ensuring init/exit sections work to shrink
 * the runtime footprint, and giving us at least some parts of what
 * a "gcc --combine ... part1.c part2.c part3.c ... " build would.
 */

you can find all such commits by:

$ git log --author=3D"David Brownell" --grep=3D"link fixes" -- drivers/usb/=
gadget/

And here are the original discussions:

http://marc.info/?l=3Dlinux-usb&m=3D121868805717787&w=3D2
http://marc.info/?l=3Dlinux-usb&m=3D121875765411492&w=3D2

In summary:

We don't want to have library code into their own drivers because, well,
you can only have one gadget driver at a time anyway. And we don't want
separate compilation due to having stuff out of init sections.

--=20
balbi

--nfj0fqmy56wRO+9X
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN95pbAAoJEAv8Txj19kN1CHsIAI8zxhYZrruajyViQZIP8Xjk
xfqBthWnA7/tlX4zLtfhVvJuL+atG5rHK49EQ7/lcdeZ8KkXzt4FxCJk8r/qKguN
FcemidN3d847j1aI/oZhnPByZqwRIo9Jhk1AzfZkUWgbxfgHGTmGfkCVdgf81CHc
I239IX+44D20Pv8Ya2OLYfYfgTeNNKTRntz8zAG9VbyCBld/EQqNHrnq0rgzrrOy
xad4ZM5vZ8GIboJZ0nbwf+uMU4CWWKUDXBilY8v9Z7Fr6YOF/1eFRh2asFNGVwYq
19/maaTlpMkqw3pORtnfEyQ7SZNSvL5FBEmfvvZq/uJrqzM8erJ1TLTfeIK92q0=
=RTYS
-----END PGP SIGNATURE-----

--nfj0fqmy56wRO+9X--
