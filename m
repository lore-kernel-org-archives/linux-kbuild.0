Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:52590 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750771AbbACDIs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 2 Jan 2015 22:08:48 -0500
Message-ID: <1420254507.5686.130.camel@decadent.org.uk>
Subject: Re: [RFC v5] builddeb: Try to determine distribution
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sat, 03 Jan 2015 03:08:27 +0000
In-Reply-To: <1420246852-7113-1-git-send-email-sedat.dilek@gmail.com>
References: <1420246852-7113-1-git-send-email-sedat.dilek@gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-BgE1dXCvJfPpKB8OQoyg"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sedat Dilek <sedat.dilek@gmail.com>
Cc: maximilian attems <max@stro.at>, Thorsten Glaser <tg@mirbsd.org>, Alexander Wirt <formorer@debian.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org


--=-BgE1dXCvJfPpKB8OQoyg
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Sat, 2015-01-03 at 02:00 +0100, Sedat Dilek wrote:
> lsb_release command is a good choice to determine the distribution
> name for the changelog file in the generated Debian packages [1].
> Its installation is no precondition.
> In Debian it is still not essential or build-essential.
>=20
> Ben gave some helpful informations and detailed explanations in [2].
> There he also suggested to have an option to explicitly set the
> distribution name (see $KDEB_CHANGELOG_DIST variable).
>=20
> Embedded the improvement as suggested by Thorsten (see [3]):
>=20
> "This is suboptimal: if KDEB_CHANGELOG_DIST is defined,
> lsb_release is not necessary. The following snippet
> also omits using its output if it fails but still
> produces any:"
>=20
> Dealing with this issue I learned about "The Colon in the Shell." and
> possible pitfalls in this area (see [4,5]). Furthermore, refreshed my
> knowledge about redirecting outputs with the echo command (see [5]).
> Special thanks to Thorsten, I enjoyed the IRC session with you.
>=20
> Cooked together the snippets of Ben and Thorsten (see [2,3]).
> Tested against Linux v3.19-rc2.
>=20
> Thanks goes to Alexander, Ben, maximilian and Thorsten for the very
> vital help.
>=20
> [1] https://lkml.org/lkml/2012/4/23/516
> [2] http://marc.info/?l=3Dlinux-kbuild&m=3D142022188322321&w=3D2
> [3] http://marc.info/?l=3Dlinux-kbuild&m=3D142023476825460&w=3D2
> [4] http://blog.brlink.eu/index.html#i70
> [5] https://www.mirbsd.org/permalinks/wlog-10_e20141209-tg.htm
> [6] http://stackoverflow.com/questions/23489934/echo-2-some-text-what-doe=
s-it-mean-in-shell-scripting
>=20
> CC: Ben Hutchings <ben@decadent.org.uk>

Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

> CC: maximilian attems <max@stro.at>
> CC: Thorsten Glaser <tg@mirbsd.org>
> CC: Alexander Wirt <formorer@debian.org>
> CC: Michal Marek <mmarek@suse.cz>
> CC: linux-kbuild@vger.kernel.org
> Suggested-by: Ben Hutchings <ben@decadent.org.uk>
> Suggested-by: Thorsten Glaser <tg@mirbsd.org>
> Signed-off-by: Sedat Dilek <sedat.dilek@gmail.com>
> ---
> v5: Improve commit-message and fix Thorsten's email-address
> v4: Embed improvements suggested by Thorsten
> v3: Massaged the commit-message
> v2: Suppress error messages when lsb_release is not installed.
>     (Thanks maximilian and Ben.)
>=20
>  scripts/package/builddeb | 13 ++++++++++++-
>  1 file changed, 12 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 5972624..f631c77 100755
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -217,9 +217,20 @@ else
>  fi
>  maintainer=3D"$name <$email>"
> =20
> +# Try to determine distribution
> +if [ -n "$KDEB_CHANGELOG_DIST" ]; then
> +        distribution=3D$KDEB_CHANGELOG_DIST
> +elif distribution=3D$(lsb_release -cs 2>/dev/null) && [ -n "$distributio=
n" ]; then
> +        : # nothing to do in this case
> +else
> +        distribution=3D"unstable"
> +        echo >&2 "Using default distribution of 'unstable' in the change=
log"
> +        echo >&2 "Install lsb-release or set \$KDEB_CHANGELOG_DIST expli=
citly"
> +fi
> +
>  # Generate a simple changelog template
>  cat <<EOF > debian/changelog
> -linux-upstream ($packageversion) unstable; urgency=3Dlow
> +linux-upstream ($packageversion) $distribution; urgency=3Dlow
> =20
>    * Custom built Linux kernel.
> =20

--=20
Ben Hutchings
Theory and practice are closer in theory than in practice.
                                - John Levine, moderator of comp.compilers

--=-BgE1dXCvJfPpKB8OQoyg
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIVAwUAVKddMue/yOyVhhEJAQo2dg//agPfsCCZHscirZMg+sWoAKgr1dUhnxh1
16ELN0tRBK05bqTzg+6urK2jJBIimNrY2IZesEkXAgCyPbsq2o0aoe/rC7ZYiJNG
fyRivr60nqq6rVfH98GIGrKLIvrZS1PWrilwztY32KiE2pSXEjN9mmxdIm9HvMCz
06ERcsspUwAIBF86vFp8/TpMHftQOUh0YMgbpf+PsHJWlsVa8Wnqjb2eW5d6kLH+
f+2PoauDPnMk7D4lH51LKkkStiLNwtQ6LCaaohrLRRR++Z2pphHJFb0b8OQtvddg
ourD8O8aYpkocMtCU61I+Qm9Aaenjba0PB46piaBBApywwyiFaQfaC/r8MMCBnzY
5wFsPDi/9gvFEWnlf15PaKAQks25gfujQ4Nhr9G568v4nkyfHZ/oSOlY7y6tf8qf
N3m0Mw0L5t3IAhFifwPjknIoRyCQMGRDt+kXW7pdgoAaDz272CsFFh/QkSjcnlQq
ty0+msU2QWbPj/0i3pXzBWBf3NCcjOOGQNud5T/EAtUhpu+6mtovBhm3ksOPF3IH
W0wRrGzXu4wbY8jrQdflfbCUeec/CIeG5h7HUdnPhB6LPrNNIzmju2+ekm7IS4NC
UejBg2Vo3xH0SimiMn2Cq95paDkhPEVY+6VsswPj7LVXbQLeAeA6HgniOc2SeF71
6ueR46bweDE=
=9og/
-----END PGP SIGNATURE-----

--=-BgE1dXCvJfPpKB8OQoyg--
