Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:37326 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751509AbaGNAeI (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Jul 2014 20:34:08 -0400
Date: Mon, 14 Jul 2014 10:33:57 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 0/6] kbuild: use target compiler for user binaries in
 samples/
Message-ID: <20140714103357.33d3bdc7@canb.auug.org.au>
In-Reply-To: <20140714102936.73f43591@canb.auug.org.au>
References: <20140713183636.GA17241@ravnborg.org>
	<20140714102936.73f43591@canb.auug.org.au>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/m+IcKUJ_qzpK53kAz=R3N91"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Thierry Reding <thierry.reding@gmail.com>, David Herrmann <dh.herrmann@googlemail.com>, Jiri Kosina <jkosina@suse.cz>

--Sig_/m+IcKUJ_qzpK53kAz=R3N91
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Mon, 14 Jul 2014 10:29:36 +1000 Stephen Rothwell <sfr@canb.auug.org.au> =
wrote:
>=20
> On Sun, 13 Jul 2014 20:36:37 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
> >
> > NOTE: This will likely break the build if the toolchain used do
> > not include a libc. Let's see how much noise this creates.
>=20
> Then I will drop them from linux-next.  Until someone supplies lots of
> cross compilers with libc support, the samples can not (must not) be
> built by default.

Just to be clear: for my current build infrastructure, this means
powerpc and x86_64 hosted cross compilers.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/m+IcKUJ_qzpK53kAz=R3N91
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJTwyV+AAoJEMDTa8Ir7ZwVurAP/ReIj4zT+kfMqVsxNd/Tm+0W
T9Nb6aAbR/K/wkMxpZYXUeMSz8xzam5YCxjGTUFkCCXtE0oA7BQHR6Wx0NUyZfxw
Xx8UXnpv4hmwrUE+uBeMGEeRM2+NqNYMX5yvIgvOZjvH75GQHPaN3EU0xmqEIHyA
NljmUcutnBcmXfLt3i4dzce9h1oA49dB0LRh1rai6GvnIe7jnvLD704cGIzaaAc2
sHaX+Fkdu5Y/d4i2gWfD8EbLVRGbkrMsGAp+BvgKx05Pg418cq89zHcm+8egQYdR
n60/0XiZbVPGYwti3lh6wg5ioq8kx59t71Q/xfj5g5VJYltqq56D8bQehIYKiutv
cz7IeDS80qXiBuqm3ClHqauEADbONUUkaVAGWMShgpQ+P+GNtV0LqJrMj7Ghhjee
bicy5vgnnP0hGfbhhorTu5cp08S8NE+keF/z0FeAiWiBqICJ9wqCIBns3AUPUmUH
7lkAbV22nUWNyRh9PHYoeCpq1lcfG8btyQyXA33imiIvPFCImAAbuiRUMWAazDZ/
H4vmpNef/awtplCSVOavrIxmmZfkMEQaiGhQXvIF0KAgLOkiwzi18/2M6fYIWPIc
lOtfQidezgiZgBeIdljbYvzRRlvwQesMLkGQgLgM9rQSNvcZv5bT1yyhEXsz8hk0
qnwsEdbq2W1fAvEkDSH3
=ciI6
-----END PGP SIGNATURE-----

--Sig_/m+IcKUJ_qzpK53kAz=R3N91--
