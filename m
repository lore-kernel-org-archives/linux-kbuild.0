Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:36167 "EHLO
        mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726388AbfIMG2i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Sep 2019 02:28:38 -0400
Date: Fri, 13 Sep 2019 08:28:11 +0200
From: Nicolas Schier <nicolas@fjasle.eu>
Subject: Re: [PATCH] Documentation: kbuild: Add document about reproducible
 builds
Message-ID: <20190913062811.GG8267@fjasle.eu>
References: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="ReaqsoxgOBHFXBhH"
Content-Disposition: inline
In-Reply-To: <20190911115353.yngbk6hf6gwctock@decadent.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ben Hutchings <ben@decadent.org.uk>
Cc: Jonathan Corbet <corbet@lwn.net>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-doc@vger.kernel.org, linux-kbuild@vger.kernel.org, ab@php.net


--ReaqsoxgOBHFXBhH
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Ben,

thanks for that document, I really enjoyed reading it!

On Wed, Sep 11, 2019 at 12:53:53PM +0100, Ben Hutchings wrote:
[...]
> diff --git a/Documentation/kbuild/reproducible-builds.rst b/Documentation=
/kbuild/reproducible-builds.rst
> new file mode 100644
> index 000000000000..4d988faf93b8
> --- /dev/null
> +++ b/Documentation/kbuild/reproducible-builds.rst
> @@ -0,0 +1,115 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Reproducible builds
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +It is generally desirable that the building the same source code with

In this sentence, I think there is either one word to much (the first
'the') or some word is missing (e.h. 'of').

Kind regards,
Nicolas

> +the same set of tools is reproducible, i.e. the output is always
> +exactly the same.  This makes it possible to verify that the build
> +infrastructure for a binary distribution or embedded system has not
> +been subverted.  This can also make it easier to verify that a source
> +or tool change does not make any difference to the resulting binaries.


--=20
epost: nicolas@fjasle.eu               irc://oftc.net/nsc
=E2=86=B3 gpg: 18ed 52db e34f 860e e9fb  c82b 7d97 0932 55a0 ce7f
     -- frykten for herren er opphav til kunnskap --

--ReaqsoxgOBHFXBhH
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCAAdFiEEh0E3p4c3JKeBvsLGB1IKcBYmEmkFAl17NvcACgkQB1IKcBYm
EmmVmQ//QH35Xc9OqVJkaK8WXJdIlEsfxgm4letcgAC8jDRDnKe3YoLKOvtvkarA
lvSNUdeIpPEljqv3RBHbzehqPJo2ci6XG8/n94u7VzTvTkcKFrP8qHxJSR1BGJPB
Dc+DVjQHVwzqJnPXLN4/Fxudi+XZAQELzJgmppOaeYFMQqLzfmAI4jxAvUYtIuJZ
HwMKqUcuohswDPL0yF4GPLN0cJizDf4CHXwNFrgfMU0GLHjnQlOxxQc6gl+hT0A7
aWIkB4x5zA4a05C/0/YJ5h3Dnfqsd62g2ku51Pd50XAMq9p+7JTsP825MDPhb5B9
mHXPvmIGD44rJmfLiiIEWyn//bgOh+RjzTsPIs2NS0xQS4UHjOcHI52RpFQpKGoV
iveYZBAs9x+DeI38sbtVdYU0FHgc4za034Bq3rlIK+0zcUTZgY0m4ANaZQDrLutL
Nj7reGp+RzHF6/FxU6h157M99x2jyxJ1689jgObdMSbFudYzZv1hbQ9qKTTCb4nA
uIKNBtF1Ex4jKlvQdxF46JSFwuBHEf8iow3F1X2K9J+dJiyV5mO49GtKUJuPgxtu
dUAM6VpoInEnUtl8ywfllVBHf+eZd4jo02+hL0tw2ZhwOhxzwbOKRDimPx2gbEzk
AzvK+THZM2sYdqLSz0n0VuEtZJ1mvTATuAblAG7MxU1cEbZDqYs=
=udyO
-----END PGP SIGNATURE-----

--ReaqsoxgOBHFXBhH--
