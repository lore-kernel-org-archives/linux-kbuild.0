Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from heliosphere.sirena.org.uk ([172.104.155.198]:37212 "EHLO
        heliosphere.sirena.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934741AbdJQSwI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 17 Oct 2017 14:52:08 -0400
Date: Tue, 17 Oct 2017 19:52:06 +0100
From: Mark Brown <broonie@kernel.org>
Subject: Re: more build problems with "Makefile: move stackprotector
 availability out of Kconfig"
Message-ID: <20171017185206.dquho5wtr5f6pwmv@sirena.co.uk>
References: <CAK8P3a3ppb1hB0rahY+BXNbMzzKq6b0QorjJE8HqaKWcxmW3iQ@mail.gmail.com>
 <CAK8P3a3OZTvvT1m167Ocajo0yTLbb2q6Jq53tZGWUFuUaboibA@mail.gmail.com>
 <CAGXu5j+jPbMpTyQr8OfgVo3cmM_qk0XNAs+9whQ7DGw1xnBkzw@mail.gmail.com>
 <CAGXu5j+1+rLA4uOrEv9yc9RE9Rna4QVsNqfg0zTDSMZ6VwGzaw@mail.gmail.com>
 <CAK8P3a3fHWdgH23LjACzM+htGCY-bHgM5Y6uB8J6K5XgfT8e+g@mail.gmail.com>
 <CAGXu5j+LeV+7GBXCikUfiO-Rzu1Dnv7pMh2sfFLc_RMOSoiStg@mail.gmail.com>
 <CAK8P3a2N+QW9JjOAdp3tHsXLFU3Cmy7yR3Mr3vZvi4Vy5VbOYw@mail.gmail.com>
 <CAK8P3a0Qa4dw_6WLsyjWFVXD3-DUa_2V=Yj9THvNE=wWMNH5VA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="pap3uk36hvur72bw"
Content-Disposition: inline
In-Reply-To: <CAK8P3a0Qa4dw_6WLsyjWFVXD3-DUa_2V=Yj9THvNE=wWMNH5VA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Kees Cook <keescook@chromium.org>, Andrew Morton <akpm@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>


--pap3uk36hvur72bw
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Oct 17, 2017 at 08:47:06PM +0200, Arnd Bergmann wrote:

> To clarify: with my gcc-4.9/gcc-5 build, -mstack-protector-guard=tls
> has no effect,
> the output is the same as with -mstack-protector-guard=global using the Ubuntu
> compilers of the same version.

Jumping in here...  on IRC Arnd suggested reverting 123c48cf899d
("Makefile: introduce CONFIG_CC_STACKPROTECTOR_AUTO") from -next.  What
do you think Kees?

--pap3uk36hvur72bw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAlnmUVUACgkQJNaLcl1U
h9Ckngf/f7UJTLBwGz7tlsh7Cb4/w63PFk01tc3HXv8Gp5lL3DgTrEPPO2tAo/f1
u6xFmOf7R5c57+R+pw2mnRA4Ltz8f+z+95UrOC5Fpn92ksjBFP3+pNCNY49XhoqE
L/3/+QrN1oN4tEx6IoZxOEy/4ncFuKc9S+qm1KqiDn5s/C8f7qgItNGBh+afC4Qc
Y2weGUqnNglod+4Q4YeoLClNEUiRBYsugjY5pYVJMA+V8xFpHO2hPvElHVr6ySVI
fTcURTvWMpRVLFtlOeF67RQq3xIalhd+NGyU6BHUJG0oaV4tHNTVIXZQxO9V+qw5
UFTicwpNQeJLAZxkd1eRwiehos7rZw==
=+KBC
-----END PGP SIGNATURE-----

--pap3uk36hvur72bw--
