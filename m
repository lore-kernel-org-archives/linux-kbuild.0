Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.southpole.se ([193.12.106.18]:37716 "EHLO
	mail.southpole.se" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752691Ab0DVHpI (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 22 Apr 2010 03:45:08 -0400
Received: from assp.southpole.se (localhost [127.0.0.1])
	by mail.southpole.se (Postfix) with ESMTPSA id 904104801AE
	for <linux-kbuild@vger.kernel.org>; Thu, 22 Apr 2010 09:23:21 +0200 (CEST)
Subject: Set INSTALL_HDR_PATH on command line
From: Jonas Bonn <jonas@southpole.se>
Content-Type: multipart/signed; micalg="pgp-sha1"; protocol="application/pgp-signature"; boundary="=-8deoHJKCA6FUtgTRKzDx"
Date: Thu, 22 Apr 2010 09:23:28 +0200
Message-ID: <1271921008.5866.16.camel@needafix>
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org


--=-8deoHJKCA6FUtgTRKzDx
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

In the toplevel Linux Makefile, INSTALL_HDR_PATH is hardcoded as
follows:

# Kernel headers

#Default location for installed headers
export INSTALL_HDR_PATH =3D $(objtree)/usr

Should this not be done with ?=3D so that the install path can be
overridden on the command line?

export INSTALL_HDR_PATH ?=3D $(objtree)/usr

This would make installation of headers for cross-build environments
simpler.  Or am I missing something else?

Regards,
Jonas

--=-8deoHJKCA6FUtgTRKzDx
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEABECAAYFAkvP+W4ACgkQ70gcjN2673Pq3ACgwKjNtQS1qaPG+HDAgTK1IqCi
C7MAn2aAmxo5RRked7cSlfDgOKe5Fv2c
=Cfft
-----END PGP SIGNATURE-----

--=-8deoHJKCA6FUtgTRKzDx--

