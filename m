Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:50448 "EHLO
	shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751267Ab3JFQWo (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 6 Oct 2013 12:22:44 -0400
Message-ID: <1381076552.2788.22.camel@deadeye.wl.decadent.org.uk>
Subject: Re: [PATCH 1/1] builddeb: add arm64 in the supported architectures
From: Ben Hutchings <ben@decadent.org.uk>
Date: Sun, 06 Oct 2013 17:22:32 +0100
In-Reply-To: <1380882711-31929-1-git-send-email-fathi.boudra@linaro.org>
References: <1380882711-31929-1-git-send-email-fathi.boudra@linaro.org>
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-fWlyo5WIESHjJYj+ZqtE"
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Fathi Boudra <fathi.boudra@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, maximilian attems <max@stro.at>, Michal Marek <mmarek@suse.cz>


--=-fWlyo5WIESHjJYj+ZqtE
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, 2013-10-04 at 13:31 +0300, Fathi Boudra wrote:
> Signed-off-by: Fathi Boudra <fathi.boudra@linaro.org>
> ---
>  scripts/package/builddeb | 6 +++++-
>  1 file changed, 5 insertions(+), 1 deletion(-)
>=20
> diff --git a/scripts/package/builddeb b/scripts/package/builddeb
> index 90e521f..f76be3a 100644
> --- a/scripts/package/builddeb
> +++ b/scripts/package/builddeb
> @@ -43,7 +43,11 @@ create_package() {
>  	mips*)
>  		debarch=3Dmips$(grep -q CPU_LITTLE_ENDIAN=3Dy $KCONFIG_CONFIG && echo =
el) ;;
>  	arm*)
> -		debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el) ;;
> +		if grep -q '^CONFIG_ARM64=3Dy' $KCONFIG_CONFIG ; then
> +			debarch=3Darm64
> +		else
> +			debarch=3Darm$(grep -q CONFIG_AEABI=3Dy $KCONFIG_CONFIG && echo el)
> +		fi ;;
>  	*)
>  		echo "" >&2
>  		echo "** ** **  WARNING  ** ** **" >&2

As arm64 is a separate architecture in terms of kernel source, I think
it would make more sense to add an arm64 case above the arm* case.

Ben.

--=20
Ben Hutchings
Who are all these weirdos? - David Bowie, reading IRC for the first time

--=-fWlyo5WIESHjJYj+ZqtE
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.14 (GNU/Linux)

iQIVAwUAUlGOSOe/yOyVhhEJAQo96A//RwE89W+XRbHYBAKO88RFRaFwp3nSiPI8
0mZ4WSaxAqADpsb+00mYaMzZNA3sIdII6NUrVwe3e6/xLz6j9jb+TsCsXd49xfmj
sZrvCrfUTkgFDegLAPu/vCLcxZbzIIAXpBhICsV7WPF58dvBkRVpqFWLYF9U1qaj
v3r2hSqo5DsAAJTholn9FD4ie9+xNI0pQDmZylq83wyh2HD/XtPYbjokj7Y3qWf6
vMc0LSXNQoiiLEGjbTaXHy+nUC4GcujnytA42vnAHQbR9o4Ny78HHkS9vuTQiiCR
pNnWb40K3Pbcquh5YZiAf/HXKYKtujE79jWXcGJew/iicne5naMlK+45hWyQccY2
sDd8FwtzLqUsQV94myQIjZcChGKQHryEkxeWofN2ldPVlMFP8ZejMeZ5g8J5wCEC
+EZsn6PwLBE6f7b1ncnVJMTq4nZ86SERriwihkHqsHik5EyaX8nXQSBhooAttv6A
EzjaL/ANKBGVoFp67Qa7jJYZvTw5jRPHxIqhRb9pXDxVmqHYjG5pyLQ0a3tS/OnU
HOtzQCs2ZmHArOfigr3k689pZWeLauMo7Xi5FNn+ccIaYFUnlHRpwOP52+SXaBBG
/ulYDEoWLKpaCByZAyl3nbHWIe8buiruW/nzRteDMUu1rzH9ARRWVhLU5okkUtnh
i4rtra2ngaQ=
=oM9l
-----END PGP SIGNATURE-----

--=-fWlyo5WIESHjJYj+ZqtE--
