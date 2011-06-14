Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from na3sys009aog116.obsmtp.com ([74.125.149.240]:44775 "EHLO
	na3sys009aog116.obsmtp.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752736Ab1FNUQi (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 14 Jun 2011 16:16:38 -0400
Date: Tue, 14 Jun 2011 23:16:33 +0300
From: Felipe Balbi <balbi@ti.com>
Subject: Re: generate one module from multiple object files (was: Re: [PATCH
 2/2] usb: gadget: convert all users to the new udc)
Message-ID: <20110614201632.GD30763@legolas.emea.dhcp.ti.com>
Reply-To: balbi@ti.com
References: <20110614194151.GC30763@legolas.emea.dhcp.ti.com>
 <Pine.LNX.4.44L0.1106141553220.2102-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="9UV9rz0O2dU/yYYn"
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1106141553220.2102-100000@iolanthe.rowland.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Stern <stern@rowland.harvard.edu>
Cc: Felipe Balbi <balbi@ti.com>, Arnaud Lacombe <lacombar@gmail.com>, Michal Nazarewicz <mina86@mina86.com>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, Greg KH <greg@kroah.com>, Linux USB Mailing List <linux-usb@vger.kernel.org>, linux-kbuild@vger.kernel.org


--9UV9rz0O2dU/yYYn
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue, Jun 14, 2011 at 04:01:29PM -0400, Alan Stern wrote:
> Consider usbcore as an example.  Grepping through drivers/usb/core/*.c,
> you'll see there are init routines in devio.c, inode.c, and usb.c. =20
> These files are all compiled separately.  Yet they are linked into a
> single object module, usbcore.ko, and the init sections work out just
> fine.
>=20
> In short, I don't see what's wrong with separate compilation. =20
> Apparently the only problem David found was that it increased the size=20
> of the final driver by 42 bytes.  Is that really worth worrying about?

probably not... But Greg initiated the discussion. It was something
related with always recompiling the same objects or something. I really
don't recall.

--=20
balbi

--9UV9rz0O2dU/yYYn
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.11 (GNU/Linux)

iQEcBAEBAgAGBQJN98GgAAoJEAv8Txj19kN10MIH/1GVZCZR8p7iJMcwkF6T5b5H
4YXR66+rFkFhiKBJjDaW/mixRMhRol8XDEijU11L+OEJUjggEzFlCVF6h6bo/XTj
z1Hy/1961BsY6ixvEYf6e9zkLwqBkcMz0YUi2UsC7YNzuPmOClBGnJBNI89uj6ES
OCKQHxC6rjnZmUcXGtkGJ8dL7hbZM+aF/coM9C8OmlYFEAVoVFpO4ebHp2Cnd2tr
xEi4mJyW8S2QPFmU/n6cVXAtnVuABWyD/4QmF5VnzbXVdf1st1JOpZMWpzhLmIZ9
uyjVvmYyMg8to0FrgpxKV2qhBk5GIL6xZebffK57RaHZ4nPHSh6tdb7YftkG3M0=
=Zxxx
-----END PGP SIGNATURE-----

--9UV9rz0O2dU/yYYn--
