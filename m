Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from na3sys009aob106.obsmtp.com ([74.125.149.76]:57695 "EHLO
	na3sys009aog106.obsmtp.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751850Ab1FNSg3 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 14:36:29 -0400
Date: Tue, 14 Jun 2011 21:36:22 +0300
From: Felipe Balbi <balbi@ti.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
Message-ID: <20110614183621.GA30763@legolas.emea.dhcp.ti.com>
Reply-To: balbi@ti.com
References: <20110614164513.GP2353@legolas.emea.dhcp.ti.com>
 <Pine.LNX.4.44L0.1106141301000.2102-100000@iolanthe.rowland.org>
 <20110614172859.GS2353@legolas.emea.dhcp.ti.com>
 <BANLkTimRUyt-7gJc--Ja4XuAS5H0UBdNUg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="wRRV7LY7NUeQGEoC"
Content-Disposition: inline
In-Reply-To: <BANLkTimRUyt-7gJc--Ja4XuAS5H0UBdNUg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: balbi@ti.com, Alan Stern <stern@rowland.harvard.edu>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org


--wRRV7LY7NUeQGEoC
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 14, 2011 at 01:48:39PM -0400, Arnaud Lacombe wrote:
> On Tue, Jun 14, 2011 at 1:29 PM, Felipe Balbi <balbi@ti.com> wrote:
> > [...]
> > In summary:
> >
> > We don't want to have library code into their own drivers because,
> I am not sure to parse that correctly, could you elaborate ?

u_*.c and composite.c are basically library code. We don't want to have
composite.ko and/or u_*.ko.

> > well, you can only have one gadget driver at a time anyway. And we don't
> > want separate compilation due to having stuff out of init sections.
> >
> on that last point, are you implying that section mapping is not kept
> across the different linking steps ?

could be. I don't remember all the details. That was back on 2.6.27
times. I would need to really revisit all the details on the archives.

What I remember is that Dave noted code shrunk when combining the source
files, even if he didn't mark all the other functions as "static".

Greg, do you remember why you started this discussion when you first
introduced g_utils.ko ??

> ps: about the code size issue, looking at f_acm.c, f_obex.c and
> f_serial.c also highlight code duplication...

that's USB. While the underlying connection is pretty much the same
(serial) between those, the descriptors are completely different and we
don't want to have either ifdefs nor phase out descriptors to something
else. See those as example implementations for possible real gadget
drivers.

As of today, we don't have a good solution to avoid that. In fact, a lot
of duplication has been removed when the composite gadget framework was
introduced.

--=20
balbi

--wRRV7LY7NUeQGEoC
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN96olAAoJEAv8Txj19kN1COUH/0IaSBhNVoWpeI8wznUJlWke
6xI/Y6GCDdn6SIGf1zzFOc20s5QwXvC3PNkbu+3sviMgwK3Yo24L/W/O2zXHCE1u
ikDlSg0iOuzIoKJfjd7I9nsamWy4x/RCD618HJ/0rxBGsChSXasbYRuI25rt3iF8
aILYKPF+H137R5vLP6WpP2J4gGC0j3nysKqlGmW7X9tCyCaUuemugfF2uaJ7n3cU
mD3Qwealfe2xGW/2+ix+98xLuHD4mrftYN1oW2XqfMqq3DsghND4gtwviAH04kSq
2EPHF7hlupev3Ed+qYUjpgPHHKCk4TpG6FPQOV3JIW4MrJ5MLaha9kcxFtACdaY=
=iufF
-----END PGP SIGNATURE-----

--wRRV7LY7NUeQGEoC--
