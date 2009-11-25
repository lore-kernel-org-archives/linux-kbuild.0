Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from chilli.pcug.org.au ([203.10.76.44]:33711 "EHLO smtps.tip.net.au"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751296AbZKYGVY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 25 Nov 2009 01:21:24 -0500
Date: Wed, 25 Nov 2009 17:21:22 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] kbuild: Steppeing down as Maintainer
Message-Id: <20091125172122.46beaf17.sfr@canb.auug.org.au>
In-Reply-To: <20091120182613.GA28307@merkur.ravnborg.org>
References: <20091120182249.GA28251@merkur.ravnborg.org>
	<20091120182613.GA28307@merkur.ravnborg.org>
Mime-Version: 1.0
Content-Type: multipart/signed; protocol="application/pgp-signature";
 micalg="PGP-SHA1";
 boundary="Signature=_Wed__25_Nov_2009_17_21_22_+1100_8Slg7/Ruc4.1h3fg"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Linus Torvalds <torvalds@linux-foundation.org>, Andrew Morton <akpm@linux-foundation.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>

--Signature=_Wed__25_Nov_2009_17_21_22_+1100_8Slg7/Ruc4.1h3fg
Content-Type: text/plain; charset=US-ASCII
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Sam,

On Fri, 20 Nov 2009 19:26:13 +0100 Sam Ravnborg <sam@ravnborg.org> wrote:
>
> It has been fun but the last year or more it has
> been a duty and a burden. So I leave it open for
> other to take over.

I, also, want to thank you very much for all your work.

I am, however, wondering what will happen to the changes you have that are
currently in linux-next:

Apparently for v2.6.32 (in kbuild-current):

Michael Tokarev (1):
      kbuild: fix bzImage build for x86

And queued for v2.6.33:

Sam Ravnborg (14):
      kbuild: search arch/$ARCH/include before include/
      dontdiff: add generated
      kbuild: move bounds.h to include/generated
      kbuild: move asm-offsets.h to include/generated
      ia64: move nr-irqs.h to include/generated
      arm: move mach-types to include/generated
      sh: move machtypes.h to include/generated
      kbuild: drop include2/ used for O=3D... builds
      kbuild: do not check for include/asm-$ARCH
      kbuild: drop include/asm
      kbuild: move compile.h to include/generated
      drop explicit include of autoconf.h
      kbuild: move autoconf.h to include/generated
      kbuild: move utsrelease.h to include/generated

I am (for the moment) still merging these from the copy I have of your
trees, but what to do in the longer term?

--=20
Cheers,
Stephen Rothwell                    sfr@canb.auug.org.au
http://www.canb.auug.org.au/~sfr/

--Signature=_Wed__25_Nov_2009_17_21_22_+1100_8Slg7/Ruc4.1h3fg
Content-Type: application/pgp-signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.10 (GNU/Linux)

iEYEARECAAYFAksMzOIACgkQjjKRsyhoI8yfCwCfeEyt9feGMS4nzocXa/QKFcqb
R80AoJ9ISMy96+31Soz4ZuK/g1QxD/h8
=7lV7
-----END PGP SIGNATURE-----

--Signature=_Wed__25_Nov_2009_17_21_22_+1100_8Slg7/Ruc4.1h3fg--
