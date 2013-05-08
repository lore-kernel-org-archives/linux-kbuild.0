Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:55925 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1750900Ab3EHEAM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 00:00:12 -0400
Message-ID: <1367985601.4131.194.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH v4 4/4] deb-pkg: add a hook argument to match debian
 hooks parameters
From: Ben Hutchings <ben@decadent.org.uk>
Date: Wed, 08 May 2013 05:00:01 +0100
In-Reply-To: <1367941611-12223-5-git-send-email-anisse@astier.eu>
References: <1367941611-12223-1-git-send-email-anisse@astier.eu>
	 <1367941611-12223-5-git-send-email-anisse@astier.eu>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-1ri4pIpgUFJvZycfceGv"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anisse Astier <anisse@astier.eu>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, maximilian attems <max@stro.at>, debian-kernel@lists.debian.org, kernel-team@lists.ubuntu.com


--=-1ri4pIpgUFJvZycfceGv
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2013-05-07 at 17:46 +0200, Anisse Astier wrote:
> We now provide the installed image path to the kernel hooks.
>=20
> This should allow the package to better integrate with debian hooks, and
> should not be too disruptive of hooks supporting only one parameter.
>=20
> Signed-off-by: Anisse Astier <anisse@astier.eu>
Reviewed-by: Ben Hutchings <ben@decadent.org.uk>

All hook scripts should support both forms, as specified in
<http://kernel-handbook.alioth.debian.org/ch-update-hooks.html>.  Of
course, that is only Debian policy and we don't know that everyone
working on derivatives has read it...

Ben.

> ---
>  scripts/package/builddeb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 73bb551..fa084c6 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -182,7 +182,7 @@ set -e
>  # Pass maintainer script parameters to hook scripts
>  export DEB_MAINT_PARAMS=3D"\$*"
> =20
> -test -d $debhookdir/$script.d && run-parts --arg=3D"$version" $debhookdi=
r/$script.d
> +test -d $debhookdir/$script.d && run-parts --arg=3D"$version" --arg=3D"/=
$installed_image_path" $debhookdir/$script.d
>  exit 0
>  EOF
>  	chmod 755 "$tmpdir/DEBIAN/$script"
> --=20
> 1.8.3.rc1
>=20
>=20

--=20
Ben Hutchings
For every action, there is an equal and opposite criticism. - Harrison

--=-1ri4pIpgUFJvZycfceGv
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIVAwUAUYnNwee/yOyVhhEJAQrhwhAAkXNVl/3NcoNYMYa4SWWVT4BV+K2c6Gd2
wTFXRzh0GuAjQzOz4qxjMGmBrv3kVeX1dxLJ6HQMw6It3m3mp/Zl0aY1FKkVv58w
Gs7ZdKr6jThup8IE7IdBlRHk2xlJHCWzBKu6klfFpWOhhmU+JfktWnu69018ryi/
w2PvVeQKMpYi7ltA+VvV3k7JxBVg0y9TAFVSsQ6woQycJ1Iod2Ic31KPMo9+qSqy
p1Kx+ai4Ax7LRy7yEMvShaIm72f19v9DfUcUI88W0p0BoJH2rgIkW9RC4Omtj6PY
LNtAAD21gRqqyA+f+wqy8iGTPNXAGxAg2VZ4x5Y5VdEt+LUGYkCt3XlwpmPtIQjR
y4ehERhWTQL5TTFeOlv7QeB/cHh9yKjavTpfLEA0yqzUg600to4F10EDNhyc6ced
vKOaYzV38grEqxbxMv0O0q/Gk+IMin9o7jMLhmHKI4urm3aOh+tItK4lOHVVIDYt
1WHcAEn7TLxm3t1SlwzSgEcQIQqiXVcNCvLtNqxQ9JZR1DbUg/o7zkm1XWKwKEcS
NujoMdFSduMVX8UPN7/WIp9sMEv0EuQMAbYjRov9gE6y32fWZ2nUdGfe/uCRB/Jp
c8yisjlGEgG/EW0N286twCOX3CYXV+30hRDTMmn6tMMTqHzJ6EyifHaduVFhF/1h
AbOJQWaTOW8=
=x0OH
-----END PGP SIGNATURE-----

--=-1ri4pIpgUFJvZycfceGv--
