Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from na3sys009aog109.obsmtp.com ([74.125.149.201]:41573 "EHLO
	na3sys009aog109.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751244Ab1FNQpW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 12:45:22 -0400
Date: Tue, 14 Jun 2011 19:45:15 +0300
From: Felipe Balbi <balbi@ti.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
Message-ID: <20110614164513.GP2353@legolas.emea.dhcp.ti.com>
Reply-To: balbi@ti.com
References: <20110613085534.GD3633@legolas.emea.dhcp.ti.com>
 <Pine.LNX.4.44L0.1106131024100.1983-100000@iolanthe.rowland.org>
 <20110613153516.GC2353@legolas.emea.dhcp.ti.com>
 <op.vw1yw3ol3l0zgt@mnazarewicz-glaptop>
 <20110614073218.GR2353@legolas.emea.dhcp.ti.com>
 <BANLkTikYqgzZboNB48MnGr87w7w9u6kLMA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="RNYIsZSUNfbU4BwD"
Content-Disposition: inline
In-Reply-To: <BANLkTikYqgzZboNB48MnGr87w7w9u6kLMA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: balbi@ti.com, Michal Nazarewicz <mina86@mina86.com>, Alan Stern <stern@rowland.harvard.edu>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org


--RNYIsZSUNfbU4BwD
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 14, 2011 at 11:33:32AM -0400, Arnaud Lacombe wrote:
> On Tue, Jun 14, 2011 at 3:32 AM, Felipe Balbi <balbi@ti.com> wrote:
> > On Tue, Jun 14, 2011 at 08:28:05AM +0200, Michal Nazarewicz wrote:
> >> On Mon, 13 Jun 2011 17:35:17 +0200, Felipe Balbi <balbi@ti.com> wrote:
> >> >We also need to a find a better way to get rid of the inclusion of C
> >> >source files. I understand why Dave did it, but it's been quite some
> >> >time since those patches were committed - e.g.
> >> >7e75bc0f9006e995a0fa25f0a285addc3d5fd5cb - and no progress has been m=
ade
> >> >to fix that up. Probably Clang's link-time optimization would help a =
lot
> >> >on that, but Clang still needs quite some work to be usable for us, so
> >> >we need something else. Any ideas ?
> >>
> >> To me it always seemed like it's a bug in/lack of feature of Kbuild.
> >> Would making Kbuild allow building module from separate .o files be
> >> a problem?
> >
> > maybe the guys at linux-kbuild@vger can help answering this.
> >
> What is the problem exactly ?
>=20
> The following patch:
>=20
> diff --git a/drivers/usb/gadget/Makefile b/drivers/usb/gadget/Makefile
> index 4fe92b1..cc432b8 100644
> --- a/drivers/usb/gadget/Makefile
> +++ b/drivers/usb/gadget/Makefile
> @@ -34,6 +34,12 @@ obj-$(CONFIG_USB_FUSB300)    +=3D fusb300_udc.o
>  # USB gadget drivers
>  #
>  g_zero-y                       :=3D zero.o
> +g_zero-y                       +=3D composite.o
> +g_zero-y                       +=3D usbstring.o
> +g_zero-y                       +=3D config.o
> +g_zero-y                       +=3D epautoconf.o
> +g_zero-y                       +=3D f_sourcesink.o
> +g_zero-y                       +=3D f_loopback.o

yes, you can do that. But the problem is the runtime memory footprint
that we will have with that. At least that was the reason why Greg had
asked Dave to change it to how it is done now.

Do we support gcc --combine already ?

--=20
balbi

--RNYIsZSUNfbU4BwD
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN95AZAAoJEAv8Txj19kN1Ch8H/1u5gJtQXpOFCOa1Yijhqc6K
JcWEOlW7DwGhLOGZ4xV5BHMAD7KCLAxW+gD9YjgZsu1YW9nO11biZypHZBXoNZBa
DIMZ7GgQBWSy6H20F++z6azv4dObS7/JflYVmlFc32sh5IjWU2g5qmJnkda0t3Rs
nJkXupa42j4fvyfAE0mqFOH18Bcat2qyA1DgfVlcJ0aucO3rrabWe1MG2vAcSY/k
vLLjf8srRBV0NPmbK8H6u0NEYXvRVRt84EJGeupnF6njj8gPaBv+evmgVLTGAjiD
n+Z3oSk96HJLRJ2IvagCs7Pktt/p5T7V/3dx6iPCqPQvV/oGhRkyIZckDwFZRac=
=ke8O
-----END PGP SIGNATURE-----

--RNYIsZSUNfbU4BwD--
