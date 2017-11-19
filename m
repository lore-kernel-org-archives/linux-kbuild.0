Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from atrey.karlin.mff.cuni.cz ([195.113.26.193]:54218 "EHLO
        atrey.karlin.mff.cuni.cz" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750954AbdKSW1F (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 19 Nov 2017 17:27:05 -0500
Date: Sun, 19 Nov 2017 23:27:03 +0100
From: Pavel Machek <pavel@ucw.cz>
Subject: v4.15-rc0 perl locale warnings
Message-ID: <20171119222703.GA12824@amd>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="T4sUOijqQbZv57TR"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: kernel list <linux-kernel@vger.kernel.org>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org


--T4sUOijqQbZv57TR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

I'm getting quite a lot of perl warnings in v4.15-rc0.

Any ideas what is going on there?

									Pavel

  CC      arch/arm/boot/compressed/fdt_rw.o
  perl: warning: Setting locale failed.
  perl: warning: Please check that your locale settings:
  	LANGUAGE =3D "en_US:en",
		 LC_ALL =3D (unset),
		 	LC_COLLATE =3D "C",
				   LC_NUMERIC =3D "C",
				   	      LANG =3D "en_US.UTF-8"
					          are supported and
  installed on your system.
  perl: warning: Falling back to the standard locale ("C").
    CC      arch/arm/boot/compressed/fdt_ro.o
    perl: warning: Setting locale failed.
    perl: warning: Please check that your locale settings:
    	  LANGUAGE =3D "en_US:en",
	  	   LC_ALL =3D (unset),
		   	  LC_COLLATE =3D "C",
			  	     LC_NUMERIC =3D "C",
				     		LANG =3D "en_US.UTF-8"
						    are supported and
  installed on your system.
  perl: warning: Falling back to the standard locale ("C").
    CC      arch/arm/boot/compressed/fdt_wip.o
    perl: warning: Setting locale failed.
    perl: warning: Please check that your locale settings:
    	  LANGUAGE =3D "en_US:en",
	  	   LC_ALL =3D (unset),
		   	  LC_COLLATE =3D "C",
			  	     LC_NUMERIC =3D "C",
				     		LANG =3D "en_US.UTF-8"
						    are supported and
  installed on your system.
  perl: warning: Falling back to the standard locale ("C").
 =20
--=20
(english) http://www.livejournal.com/~pavelmachek
(cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blo=
g.html

--T4sUOijqQbZv57TR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iEYEARECAAYFAloSBTcACgkQMOfwapXb+vKoxACfS5+AU41MXqmRZ5IQNu/YgMuU
jdUAn0D50j/G3mr9TkRU3oxxSwtqn03k
=mt9E
-----END PGP SIGNATURE-----

--T4sUOijqQbZv57TR--
