Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:54934 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751153AbaGNA3m (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 13 Jul 2014 20:29:42 -0400
Date: Mon, 14 Jul 2014 10:29:36 +1000
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH v2 0/6] kbuild: use target compiler for user binaries in
 samples/
Message-ID: <20140714102936.73f43591@canb.auug.org.au>
In-Reply-To: <20140713183636.GA17241@ravnborg.org>
References: <20140713183636.GA17241@ravnborg.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/bXWqs1y/U+SrIRV=At1j06x"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Thierry Reding <thierry.reding@gmail.com>, David Herrmann <dh.herrmann@googlemail.com>, Jiri Kosina <jkosina@suse.cz>

--Sig_/bXWqs1y/U+SrIRV=At1j06x
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Sun, 13 Jul 2014 20:36:37 +0200 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> NOTE: This will likely break the build if the toolchain used do
> not include a libc. Let's see how much noise this creates.

Then I will drop them from linux-next.  Until someone supplies lots of
cross compilers with libc support, the samples can not (must not) be
built by default.

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au

--Sig_/bXWqs1y/U+SrIRV=At1j06x
Content-Type: application/pgp-signature; name=signature.asc
Content-Disposition: attachment; filename=signature.asc

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJTwyR0AAoJEMDTa8Ir7ZwVBdQP/2P5rUAFiJ6YKKkYkRO+OJz/
7URtrqf0MF7lLOEyo+kA4VVvOUJr9EMZiwCL36XS78o/zuQqKIbTpnSf4Aol2xOU
2Z3+w9enmGovJBS0Y4XqAVhKIHvYrB+YYpTg7rbJkt5eS8yqC26Wa3+9xmDVzBnx
1r/MxaB6s/R/75u81CYQOecPIfiR7jA79LACdNhCuDAx50melvSVrgb72M952Dmj
OTCgZo1XRdQCzxYAc25KxQRfeCadgyyX2K3czJxIpG85BWCLrg7XxIFtC4geospp
g/Rj2pT1F+K1igjWT1y7iwHp+8nn8JjG2v+0r1CGTq5yMl3AWk8SDul2EvFvokjm
uhhzb8O82AbpPwmqO4jBxpsprh1M54Bx5LeYyTk3n9uugZ2se+EAbuqN8+3Gk+yb
h3/ina6z5IHmvQNWKFDiAkOLI4haaNmFFDyXDAQAnH24bdHkWBD2RVnUfHpYJZYd
4vOQZPZ0sMPDXIYdQMFJrjLKCg6Kxu9lMqsFxB/xzkVb4FXuAJzKxvGGdxzcqkHH
1n8xI7Ha1r6eiOVbpmNtHLAIqRuuZexfmHq3sdaL8yOtvv+ukQJLCpDcE1i66alo
3c7lhHKyuiUSY5CRrxb2dk3L5EyAy0JkPl7peoYCcBL1m6UB4h/d7WhiaTk6/WmN
zc1iLPW2FIFYbfxRlAFv
=kQFm
-----END PGP SIGNATURE-----

--Sig_/bXWqs1y/U+SrIRV=At1j06x--
