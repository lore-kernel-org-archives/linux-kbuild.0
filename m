Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from na3sys009aog112.obsmtp.com ([74.125.149.207]:42947 "EHLO
	na3sys009aog112.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753100Ab1FNTmC (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 15:42:02 -0400
Date: Tue, 14 Jun 2011 22:41:53 +0300
From: Felipe Balbi <balbi@ti.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
Message-ID: <20110614194151.GC30763@legolas.emea.dhcp.ti.com>
Reply-To: balbi@ti.com
References: <20110614172859.GS2353@legolas.emea.dhcp.ti.com>
 <Pine.LNX.4.44L0.1106141453420.2102-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="+xNpyl7Qekk2NvDX"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1106141453420.2102-100000@iolanthe.rowland.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Felipe Balbi <balbi@ti.com>, Arnaud Lacombe <lacombar@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org


--+xNpyl7Qekk2NvDX
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 14, 2011 at 03:27:47PM -0400, Alan Stern wrote:
> On Tue, 14 Jun 2011, Felipe Balbi wrote:
>=20
> > On Tue, Jun 14, 2011 at 01:06:16PM -0400, Alan Stern wrote:
> > > On Tue, 14 Jun 2011, Felipe Balbi wrote:
> > >=20
> > > > > --- a/drivers/usb/gadget/Makefile
> > > > > +++ b/drivers/usb/gadget/Makefile
> > > > > @@ -34,6 +34,12 @@ obj-$(CONFIG_USB_FUSB300)    +=3D fusb300_udc.o
> > > > >  # USB gadget drivers
> > > > >  #
> > > > >  g_zero-y                       :=3D zero.o
> > > > > +g_zero-y                       +=3D composite.o
> > > > > +g_zero-y                       +=3D usbstring.o
> > > > > +g_zero-y                       +=3D config.o
> > > > > +g_zero-y                       +=3D epautoconf.o
> > > > > +g_zero-y                       +=3D f_sourcesink.o
> > > > > +g_zero-y                       +=3D f_loopback.o
> > > >=20
> > > > yes, you can do that. But the problem is the runtime memory footpri=
nt
> > > > that we will have with that. At least that was the reason why Greg =
had
> > > > asked Dave to change it to how it is done now.
> > >=20
> > > What exactly is the runtime memory footprint problem?  I thought the
> > > whole reason for #include'ing .c files was that back then, the kbuild
> > > system wasn't able to do this.
> >=20
> > not at all. Kbuild has always been able to generate one module from
> > several objects. But then we need to remove "static" from many
> > functions to achieve that.
>=20
> If you insist on building an object from multiple source files with
> separate compilation, the price you pay is making symbols non-static. =20
> That's what we have .h files for.  And that's also why the [eou]hci-hcd
> drivers use the same trick of #include'ing various .c files.  I really
> don't know why people object to this idiom.  (Note that if the object=20
> is a module, non-static symbols don't matter.  It's an issue only when=20
> the object is linked into the main kernel.)
>=20
> > AFAICT, gcc --combine will really combine the files as if they were one,
> > pretty much the same as including the entire C source.
> >=20
> > Just look at the rationale from the commit log itself:
> >=20
> > commit 4e9ba518ec19c6c961bf6074ec05ae1a927230bc
> > Author: David Brownell <dbrownell@users.sourceforge.net>
> > Date:   Mon Aug 18 17:41:02 2008 -0700
>=20
> Much as I admired David's work, he could sometimes be a little=20
> difficult to understand.
>=20
> >     usb gadget: link fixes for serial gadget
> >    =20
> >     Change how the serial gadget driver builds:  don't use
> >     separate compilation, since it works poorly when key parts
> >     are library code (with init sections etc).  Instead be as
>=20
> "works poorly" how?  That is, what goes wrong when you try to use=20
> separate compilation?
>=20
> >     close as we can to "gcc --combine ...".
> >=20
> >     Signed-off-by: David Brownell <dbrownell@users.sourceforge.net>
> >     Signed-off-by: Greg Kroah-Hartman <gregkh@suse.de>
> >=20
> > part of it is also in any gadget driver:
> >=20
> > /*
> >  * Kbuild is not very cooperative with respect to linking separately
> >  * compiled library objects into one module.  So for now we won't use
>=20
> (I assume this doesn't use the word "library" in a significant sense. =20
> It isn't referring to static-link .a library archives, for instance.)
>=20
> In what way is kbuild uncooperative?  You said above that kbuild has=20
> always been able to build modules from separately-compiled objects.
>=20
> >  * separate compilation ... ensuring init/exit sections work to shrink
> >  * the runtime footprint, and giving us at least some parts of what
> >  * a "gcc --combine ... part1.c part2.c part3.c ... " build would.
> >  */
>=20
> Is the use of init sections the problem?  I don't see why it should=20
> be.  If you link multiple objects into a single module, all the init=20
> code should go into a single section.  Plenty of drivers throughout the=
=20
> kernel do this successfully.  In fact, g_serial did before David's=20
> patch, didn't it?
>=20
> > you can find all such commits by:
> >=20
> > $ git log --author=3D"David Brownell" --grep=3D"link fixes" -- drivers/=
usb/gadget/
> >=20
> > And here are the original discussions:
> >=20
> > http://marc.info/?l=3Dlinux-usb&m=3D121868805717787&w=3D2
> > http://marc.info/?l=3Dlinux-usb&m=3D121875765411492&w=3D2
>=20
> The problem Greg faced was that he tried to put all the library code=20
> into a separate module.  This clearly leads to potential problems. =20
> Suppose module A contains library code in an init section, which is=20
> used by the init code in module B.  When A is finished loading, its=20
> init code is jettisoned.  Then when B loads and tries to call that=20
> code, the system crashes.
>=20
> It's not clear why single compilation saves space.  The difference
> wasn't tremendous -- in David's g_serial test case
> (http://marc.info/?l=3Dlinux-usb&m=3D121875765411492&w=3D2), 42 bytes were
> saved out of 20000.  And the savings was almost entirely in data and
> bss; you'd have to do some serious digging to figure what really was
> going on.
>=20
> > In summary:
> >=20
> > We don't want to have library code into their own drivers because, well,
> > you can only have one gadget driver at a time anyway.
>=20
> That sentence isn't clear.  Perhaps you mean that having a single copy
> of the executable library code at runtime, which could be shared among
> multiple gadget drivers, doesn't help because there's only one gadget

that's what I meant.

> driver present at a time.  With the new UDC framework, that won't be
> true any more.

Good point.

> > And we don't want
> > separate compilation due to having stuff out of init sections.
>=20
> I still don't understand what the issue is with that.  There are plenty=
=20
> of driver modules built from multiple, separately-compiled objects=20
> that use init sections without trouble.

Maybe we should turn u_*.c and composite.c into their own modules now
that we're starting to allow multiple gadget controllers and thus
multiple gadget drivers loaded. I failed to see that, great catch.

> On the other hand, if you want to share a single copy of the executable
> library code among multiple gadget drivers, then none of it can go in
> an init section.  Since gadget drivers can be loaded and unloaded at
> any time, the library code would have to remain in memory permanently=20
> -- it couldn't go in an init section.

very true. Let's leave this alone for now and revisit once all
controllers are converted to the ->start()/->stop() methods correctly.

--=20
balbi

--+xNpyl7Qekk2NvDX
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN97l/AAoJEAv8Txj19kN1AT4H/1SRdyV0vD6b35mytFXlHxiX
jaKuv/oIXvf3gKtQUv9b+n567jfMWuAa0hlyABodsM8Ma/bsehSMj2vrq9DzagHD
5h3B4FlVlYlRht2FPQA7dyTDmJ31+EkhdfNcbTB8oGViYAj1/dCVHr8C8EwBsS8o
EOvgVnB67riuoKUwm5cVKgfqelS7WKxySYCUXyR9uHgWNLjclg3VDjAlYPYwWzdN
6JLFQyNhDGTBnAR5e0AOBKckwwyVq44YwFRIbpto+Ru669F4BOHB5BEVey81K1VQ
uejkk0Bb/ZUqTTksaQSeuhsiPFQuTxFqdNV3RazBGALFHgZXu6YfTDIYcWdYTEI=
=aL5v
-----END PGP SIGNATURE-----

--+xNpyl7Qekk2NvDX--
