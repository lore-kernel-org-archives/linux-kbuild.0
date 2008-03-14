Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from wavehammer.waldi.eu.org ([82.139.201.20]:58711 "EHLO
	wavehammer.waldi.eu.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751335AbYCNSNW (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 14 Mar 2008 14:13:22 -0400
Date: Fri, 14 Mar 2008 18:55:01 +0100
From: Bastian Blank <bastian@waldi.eu.org>
Subject: kconfig bug - select vs. depends
Message-ID: <20080314175501.GA11107@wavehammer.waldi.eu.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="rwEMma7ioTxnRzrJ"
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


--rwEMma7ioTxnRzrJ
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks

I work on the s390 kernel, linus/linux2.6.git, and found something which
looks buggy. The kernel have HWMON enabled even if the dependencies does
not allow it.

Dependency structure:
| menuconfig THERMAL
|         bool "Generic Thermal sysfs driver"
|         select HWMON
|         default y
|=20
| menuconfig HWMON
|         tristate "Hardware Monitoring support"
|         depends on HAS_IOMEM
|         default y
|=20
| config HAS_IOMEM
|         boolean
|         depends on !NO_IOMEM
|         default y
|=20
| config NO_IOMEM
|         def_bool y

HWMON should never be selectable in this case, but the select forces it
to yes:
| Hardware Monitoring support (HWMON) [Y/?] (NEW) y

Bastian

--=20
History tends to exaggerate.
		-- Col. Green, "The Savage Curtain", stardate 5906.4

--rwEMma7ioTxnRzrJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature
Content-Disposition: inline

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.6 (GNU/Linux)

iEYEARECAAYFAkfau/UACgkQnw66O/MvCNH8HACfeSB7D9nq6GyQvqaQxPkbnFx6
+OYAn0E5zqdaZAMeq7miepmzj/ksL6/5
=Hm8w
-----END PGP SIGNATURE-----

--rwEMma7ioTxnRzrJ--
