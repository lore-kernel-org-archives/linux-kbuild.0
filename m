Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-qk0-f176.google.com ([209.85.220.176]:34500 "EHLO
        mail-qk0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753144AbdCOPhc (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 15 Mar 2017 11:37:32 -0400
Received: by mail-qk0-f176.google.com with SMTP id p64so16044879qke.1
        for <linux-kbuild@vger.kernel.org>; Wed, 15 Mar 2017 08:37:32 -0700 (PDT)
Date: Wed, 15 Mar 2017 11:37:55 -0400
From: Tom Rini <trini@konsulko.com>
Subject: Re: kbuild/mkspec: Fix architectures where KBUILD_IMAGE isn't a full
 path
Message-ID: <20170315153755.GR19897@bill-the-cat>
References: <1489276762-22280-1-git-send-email-trini@konsulko.com>
 <20170315145118.GA30463@bill-the-cat>
 <39bd8ad9-ce11-3d81-95a9-235ceaded812@suse.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
        protocol="application/pgp-signature"; boundary="9yXOoLah2kaaoKTR"
Content-Disposition: inline
In-Reply-To: <39bd8ad9-ce11-3d81-95a9-235ceaded812@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will.deacon@arm.com>


--9yXOoLah2kaaoKTR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 15, 2017 at 04:03:44PM +0100, Michal Marek wrote:
> Dne 15.3.2017 v 15:51 Tom Rini napsal(a):
> > I found https://patchwork.kernel.org/patch/9442211/ today and I see that
> > it was brought up again just before I sent my patch.  I just want to
> > point out that 9442211 doesn't address arm, arc, and sh and they will
> > still not have a functional rpm build target.  This is at least probably
> > important for arm.  Of course all of those could also be addressed with
> > a patch similar to 9442211, and my main concern is making sure
> > everything gets fixed one way or another.  Thanks!
>=20
> The patch is 1/6 of a series that also covers other architectures, but
> patchwork won't should you the rest of the thread. Have a look here for
> instance: https://lkml.org/lkml/2016/11/22/750.

Ah, OK, thanks.  I'll just hope it gets in soon, I like being able to
easily drop new kernels in on my arm64 box :)

--=20
Tom

--9yXOoLah2kaaoKTR
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBAgAGBQJYyV/TAAoJEIf59jXTHXZSAq8P/2knknKCjsZQJ3LkShMGBZj6
sHZYeOZODPZ1Lw6XwATCJfRdOEHPoTI5hB2JlX55dKa+3mxpXtT0nx7tfpzlcwql
zxnmx/8Wxw5ugd4ZQPCgrW0qkDWGy4COqdElOp0aOToS6ZH07W2rvojGO01LY2ht
p21sDSwXhS9JolH+1r0gxdNP/9pUzneaD2z5StwqxWdtuXwKvYFsh9sSaJIBMKKZ
FP9PCvC8NxFMVVzIYVgrk7I1LTLNphRXxqUYc9q22tbhlzcF2P62PALh0Uz1IlqN
BM9TOlwqgdSCmQl0gWJ5sHG7pVsnAetoJ56QORxH+W63FXwQa28SpI6I0xTOdSkD
sdAN/CSSAgWD7fyPfqsLnLkKPkdt4WgWHKyn3Cezsu9hCK8BYQp62eWpwZDKzi+C
Ku3mUSqAq3+12YfbV/TVDrMKeTqMm65b0tbmrX7UX5ln/mUuzVBjuS/LTsWUc9FT
zV1AP6GPLvlyZbloLrFcprXSwgxxJnEXxJjic7XjQ0YfTVjWIAkazPwdplTLJM7L
jZ+XWcbodzESNOyW4jv+0TbHLLYA8J6mTvDRav/XC+50J+CIBVzgNVNerwEHXnj2
1jhxKXsq0AYZns/WrPsCCFy5WxS9MWoTi2KqQrNPyZaogzDaCQn62l7EYNQVY0Pd
JzJ3cbjffwMiJdQnr4h3
=SzR4
-----END PGP SIGNATURE-----

--9yXOoLah2kaaoKTR--
