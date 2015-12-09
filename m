Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bear.ext.ti.com ([192.94.94.41]:59656 "EHLO bear.ext.ti.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753147AbbLISZO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 9 Dec 2015 13:25:14 -0500
From: Tomi Valkeinen <tomi.valkeinen@ti.com>
Subject: Behaviour of kernel makefiles when entering a subdir using a config
 symbol = m
Message-ID: <56687204.4080404@ti.com>
Date: Wed, 9 Dec 2015 20:25:08 +0200
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature";
	boundary="9EAtk5nwsVl3MtDnSMNlD117wfc3B8Tsg"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org

--9EAtk5nwsVl3MtDnSMNlD117wfc3B8Tsg
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Hi,

I wonder if this is as designed, or a bug:

I have a makefile which has

obj-$(CONFIG_FOO) +=3D foo/

In the foo directory, I have a makefile which has

obj-$(CONFIG_FOO_BAR) +=3D bar.o

The values of the variables are

CONFIG_FOO=3Dm
CONFIG_FOO_BAR=3Dy

When building the kernel with the above setup, I would expect make to
enter the foo/ directory, and build 'bar.o' into the kernel image.

And make does enter the directory, and does compile 'bar.o', but I think
'bar.o' doesn't end up anywhere. At least it's not compiled into the
kernel image.

If CONFIG_FOO=3Dy, then 'bar.o' will be built in to the kernel image.

Am I doing something wrong here?

 Tomi


--9EAtk5nwsVl3MtDnSMNlD117wfc3B8Tsg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJWaHIFAAoJEPo9qoy8lh71+xMP/1M7UO/8UfHKtC5KJPVjeylT
lqCK35t+tyHZ9bUTdRJDzcogbmlofM4JMQiVvOcrWH/Oq/n4mb6FTZr3bUjlDU0l
dE6bofKoa3VHec7QTn8fzY6+eImh7pMM8NYsv3GWyG4/OnjQLcopCCkzGc0mBlGb
kgNyJsiayXFJeW/FCxDzVzVENLArHCI2M7uIz+ALvEtW896YkMIatIRPDjQd0bPO
GayVVwkVhvT9lR6kgxStB/UzS65hK0nmxje0H1zjoNWjVg/1ZdYJ/iGqwbv65vnZ
pf+U1R9RPj8wNb6E/rYGPvLt+YOvLgire9Ba9K2AO5zXr2YoeQ2DmbqnRSQYdkLy
ntpPy9GLk4ZPPv9E5hzLZcGcwq1LgxvnJiSLh/EthZPyYj97/BPJdi/oJVjqz8Im
FzwXt02wEpZ2vG9wBw3wQyZO5wrNiGx+fgnQ3DkTjCPN7JpHbBuk2MKIXFjBuv22
h9rBdLwttTycitzfODA0Ddz9FmY8d/+4tWAFQVuWqjtt4IG4IuHp8e2OrNPlf+WN
mXDaHFMR+2JDEHeRB0yaYNKQyRzTgR1eFnTeJR1K9ASyn0Ur+04ZTRklif+GuLXg
IJm7ZVi5pj8ROZk2Tn25So+ELVdlBIhvA1GS2flK0Gk6ynu/3Sli4vccLFfX0x3G
5iRv827n3sYW8XGMiFDX
=CUP4
-----END PGP SIGNATURE-----

--9EAtk5nwsVl3MtDnSMNlD117wfc3B8Tsg--
