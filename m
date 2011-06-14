Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from na3sys009aog107.obsmtp.com ([74.125.149.197]:38459 "EHLO
	na3sys009aog107.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1754588Ab1FNHcZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 03:32:25 -0400
Date: Tue, 14 Jun 2011 10:32:20 +0300
From: Felipe Balbi <balbi@ti.com>
Subject: generate one module from multiple object files (was: Re: [PATCH 2/2]
 usb: gadget: convert all users to the new udc)
Message-ID: <20110614073218.GR2353@legolas.emea.dhcp.ti.com>
Reply-To: balbi@ti.com
References: <20110613085534.GD3633@legolas.emea.dhcp.ti.com>
 <Pine.LNX.4.44L0.1106131024100.1983-100000@iolanthe.rowland.org>
 <20110613153516.GC2353@legolas.emea.dhcp.ti.com>
 <op.vw1yw3ol3l0zgt@mnazarewicz-glaptop>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="5G+Imvfxoe+o1e80"
Content-Disposition: inline
In-Reply-To: <op.vw1yw3ol3l0zgt@mnazarewicz-glaptop>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Nazarewicz <mina86@mina86.com>
Cc: Alan Stern <stern@rowland.harvard.edu>, Felipe Balbi <balbi@ti.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org


--5G+Imvfxoe+o1e80
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 14, 2011 at 08:28:05AM +0200, Michal Nazarewicz wrote:
> On Mon, 13 Jun 2011 17:35:17 +0200, Felipe Balbi <balbi@ti.com> wrote:
> >We also need to a find a better way to get rid of the inclusion of C
> >source files. I understand why Dave did it, but it's been quite some
> >time since those patches were committed - e.g.
> >7e75bc0f9006e995a0fa25f0a285addc3d5fd5cb - and no progress has been made
> >to fix that up. Probably Clang's link-time optimization would help a lot
> >on that, but Clang still needs quite some work to be usable for us, so
> >we need something else. Any ideas ?
>=20
> To me it always seemed like it's a bug in/lack of feature of Kbuild.
> Would making Kbuild allow building module from separate .o files be
> a problem?

maybe the guys at linux-kbuild@vger can help answering this.

> Also, at one point in time I had an idea of a framework in which each
> individual composite function would be a separate module.  I haven't
> thought it through though so it's probably not such a great idea after
> all. ;)

such a framework won't work for Certification. The original composite
framework that I implemented with the guidance of Dave was doing exactly
that. Each function driver was a module of its own and you built
composite gadgets by loading the different drivers.

That was until Dave explained to me why it wouldn't fly. You can't have
completely dynamic USB peripherals. If you go to certification with
something like that, you will be denied certification as your device can
change how it appears to the bus at any time.

So, the way we have things now, is good. We just need to figure out a
way to avoid the inclusion of C files.

--=20
balbi

--5G+Imvfxoe+o1e80
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN9w6CAAoJEAv8Txj19kN1SZwH/jKKFApOJ3cN5iisxaLk4AKX
q2TSMBm9wGmYhG6YkZu4DO+6+7qm85GG33Gi3IiffOd5dsfB1++XzHt+/28i1YH9
sGusfDzhvvQYH641gsQXi704/gyJq4wLTLUQ1egvk3hVzFdSWjs12kJMLQ8imRzA
iRXB1G70TRV2GR+2yLQaligR7JfepGUmdtoqLLTGLF/hsu5GWhRsDRXIzd5YJlrC
v4RUNWflpkFpjXWAqIxKg8PygZWcmhwLrrItu5FQAkvjieKPEaS1SuMye11UdIua
LJs701zrfO91SS8JFm5SJh3HoQHftAPWy91D+Jwp0+GjQnYSTyobSNRT9xhBbq4=
=8Ech
-----END PGP SIGNATURE-----

--5G+Imvfxoe+o1e80--
