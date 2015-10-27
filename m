Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.holgerlevsen.de ([62.201.164.66]:58557 "EHLO
	alpha.holgerlevsen.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752063AbbJ0Bjt (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Oct 2015 21:39:49 -0400
From: Holger Levsen <holger@layer-acht.org>
Subject: Re: [Reproducible-builds] [PATCH] kbuild: Add support for SOURCE_DATE_EPOCH environment variable
Date: Mon, 26 Oct 2015 19:31:18 -0600
References: <1443741332.2730.75.camel@decadent.org.uk> <562E950D.2030609@suse.com> <1445906948.2395.82.camel@decadent.org.uk>
In-Reply-To: <1445906948.2395.82.camel@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed;
  boundary="nextPart1516687.rIS0SRzgJS";
  protocol="application/pgp-signature";
  micalg=pgp-sha512
Content-Transfer-Encoding: 7bit
Message-Id: <201510261931.27345.holger@layer-acht.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: reproducible-builds@lists.alioth.debian.org
Cc: Ben Hutchings <ben@decadent.org.uk>, Michal Marek <mmarek@suse.com>, linux-kbuild <linux-kbuild@vger.kernel.org>

--nextPart1516687.rIS0SRzgJS
Content-Type: Text/Plain;
  charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi,

On Montag, 26. Oktober 2015, Ben Hutchings wrote:
> It's aimed at all build tools.  For examples, see:
>=20
> https://codesearch.debian.net/results/%5C%24SOURCE_DATE_EPOCH%20-path%3Ad=
eb
> ian%2F/page_0
> https://codesearch.debian.net/results/getenv%5C%28%22SOURCE_DATE_EPOCH%22%
> 5C%29%20-path%3Adebian%2F/page_0

https://reproducible-builds.org/specs/source-date-epoch/ has a spec for=20
SOURCE_DATE_EPOCH.

According to=20
https://wiki.debian.org/ReproducibleBuilds/TimestampsProposal#Reading_the_v=
ariable
the following Debian packages support it already:

debhelper (>=3D 9.20151004)
epydoc (>=3D 3.0.1+dfsg-8)
ghostscript (>=3D 9.16~dfsg-1)
help2man (>=3D 1.47.1)
sphinx (>=3D 1.3.1-3)
texi2html (>=3D 1.82+dfsg1-4)=20

plus we have patches for doxygen, docbook-utils, gcc, gettext, libxslt,=20
ocamldoc, qt4-x11, texlive-bin and txt2man.

(We are only tracking adoption in Debian packages but of course we aim for=
=20
upstream inclusion of this.)


cheers,
	Holger

--nextPart1516687.rIS0SRzgJS
Content-Type: application/pgp-signature; name=signature.asc 
Content-Description: This is a digitally signed message part.

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAVi7T6AkauFYGmqocAQocQBAAuDyuqrJGcnQ0CJyzaS5oj64uDcwXtble
4Qco/sWaIbWG+TGn5Nqgdy2i9JFG1YJVrjrbqFfQcZ7E9xP5v0YOV2i+6QL8DCPk
Q8VtX928DDFWnUjt4MmC1Sgh1ahMH63JryOpRrvW34HX6wt0bd7p82a1O8VnEGDO
N3VT8dg+jE5hMOD1QFqhHk/LwbGG6ow+CwRmr6AGipIxmbhJf6DcQ249dzZg0vUO
k0juD54KehVi3DmiAB392cDK6r4FS4kBXLr7cuxPIC79VklO59iRq3h4T3gyZw0p
klOE7g/5O2xLmWNaO9lk57Zj1XBX8YZXvWcui4L9eyn17/XfsyX5xtazg0gEF0qP
kt4EoV1S7nsxtWby6QZJny1drQyY9ejHt+hrN/V+r9IFoj5C97RswpqyD6bXaxjV
Zgidug4KNTBImxxRXxN4lSvJLDMAkQS1yQolizRqQ5ecSUJ3yBmKntoga58OZNGb
YP0vp1d6tnY0x0eNdlOOySBPGPKl+lUg2r7QqdjXToUWEc1QQud4YwwjxIxzCMfv
QHqygnfv94qh/0o5F59YyF6OrvO7X7jxnfrU5885Ca6wNG+cK002OTZhvmFnjfNs
kjRkvtL5mpWuUMa2foq+RR0qMd3Z+sP4h75NPQax5JMwc8SCDQGE1/G1nM3PhqYb
pP+3Tv2nLLA=
=W1zn
-----END PGP SIGNATURE-----

--nextPart1516687.rIS0SRzgJS--
