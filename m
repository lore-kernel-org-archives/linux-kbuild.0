Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.52
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794943522;
	b=UAWUP+K7lufw0dATEOq90jJeLKeiP1Or3vakZqvWt2WM9qt8lqDiYaIVt8IPaEONogXd
	 DAcJJsQRjdhs/an7gM0XRENMCaDycKO5Q4J9oVt96sX/Rk0OcRj0fbyAVHGHZOmfdrZSz
	 /Ms2L8G46Xy2eDe/PbJRimlSr9MSvlFjVozOyIPtpvc2qPtynTLs2sywAozyVXLlmhjQt
	 lvEtnqUAgGiYwtmqTjXO1IxM52DpdDRxjEDXain1pW/enk6Y7XZau28qVZ7274Ydbx2ip
	 K8+Gz1YSgYIkNqvRXNETzwv619SMieubtA9t7I41b7KMU3li0/ckm7AKuSWrP6C7ROw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794943522;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:Subject:To:Cc:
	 References:Content-Language:From:In-Reply-To:Content-Type;
	bh=B8MjyhYguiwLesyCEY4OhpKHbfRfW8qAAwEpxRAKXd0=;
	b=uvdvkOpSBqa0v32mx0hMpzMfR6UXBDbXeLKbUDC+4ejJ556YrEds6AY0fRItG2LUaqdE
	 zOSBV90PxZF9annSNNknEG0ICLqPnB1FeqCI3cmFoMAP1GX9gmdx144IajvXe9SeiRD2A
	 NqGFRIlMy8A8awzghhO/LvN/J2RfA+vFLbQCoxJt+rxzq4f9yeiBVD9X2oZiDvvkgrlXM
	 L5CKAu96nLda4/vYIv7LTVh/kFvB3tCo1xdXymP73rbyaDlZ+R63xTWYVHw7KEhsLYygT
	 xtC6P8QcE4E6dYbk7DOzCg4yooo7UqGyLxfkhYvQDEUz/B06IN0K3ZQF78Fctf9eZYA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkDKKmQE;
	arc=none smtp.remote-ip=209.85.128.52
Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFE85606A32C
	for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 19:25:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EFE85606A32C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=bkDKKmQE
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso2358495e9.3
        for <linux-kbuild@vger.kernel.org>; Tue, 17 Nov 2026 11:25:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794943520; x=1795548320; darn=vger.kernel.org;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=B8MjyhYguiwLesyCEY4OhpKHbfRfW8qAAwEpxRAKXd0=;
        b=bkDKKmQErNzaF6smeftQWBOpWfgtjVM5vGBkntiPqeIhKc4VhM+KvNPs0pA0sgqXwt
         VimIqchx3dU0UBKYCYuJvXdRTBDbSUbjYoVurn2OnxsofUYJXXovQgNJ02XbR/2I1iRz
         yQY5tOLcoY0VtUg6HQJ2zMgyrpnM21Ygbz+BrUWj0jgdwCzx2RGvdybIxlDU2dYvU9tj
         xTZNk/2tXq85So1kTNLLOZm1bkiu7JM8gElovAUhHyyAsR8i7iDjbbPE3tKvmnXx9XcJ
         STuTEDgGKm3r8clrf2XCGF6J+JGGGFI3F6LWZxudUeh2hhoXB3CcUpxrSXkFABEecj0O
         oBjQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794943520; x=1795548320;
        h=content-type:in-reply-to:from:content-language:references:cc:to
         :subject:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B8MjyhYguiwLesyCEY4OhpKHbfRfW8qAAwEpxRAKXd0=;
        b=PsGKMS1Ml3QI+n5//kwErBForzV3s5AY0K2PThA2+qxgmQVo/V1qnxyi+DiPdXlEvy
         Hft3t20c6B41s4tQ8exsEN7A+hBMWbmv4R95Hz1rSisOiZEBedhHvR1haqf80ZUygRxa
         qiBVg7GBEwnZYlBeybgGtZngR8qKiZso4PSm/pgr6Dd+Y7CiO6Fd2CTAFIUxAtCSBTgv
         Y8abQMCTJDy/cH3Qzql9XfEoXLveqzcSOcclPkKTSsYvcWgnzlh5Jj3+CwHnA2rXQsax
         5jemz3KIs1KPI1kfbP4Wt7AHQy4oVBhSQYz50mL6TXDtXo7K4vTEVUCk4lM2xaPh1nmU
         j1mw==
X-Forwarded-Encrypted: i=1; AL+hErFXIlkOfYmXP3auRp/tW113FvKYKgKLmyauNM82LTzBAGZzgiQvR90togXmsau/pD+CUSAMcqs5FaZhkwo=@vger.kernel.org
X-Gm-Message-State: APuU4Z/wbMguNrdRKs2+Ei3eDz6Hm+2v7aM+R8JhwLprUrsPugG+lqE1
	eWLPx+wpsjr05yLbc0OuzvO2mg9yO24hB9DdD4JjFPIduAovR9NW5Hzf2IleFISx
X-Gm-Gg: AYBFou2ie15VuUlCXUaf9HEPjEh3Be5pva70moQ68lK43QyzPGAqnsKyTE/revVQiG6
	96582Tpx23AprAGrhJ7gNiLp73Nm6Rt/ldwmd8sKWJxUjU6fdiPWY4htBh7fiMxZ1eZ24d1m732
	7Bih+SmvEC60p29uLw8u3Z9VJz34XB8w+Axg5RRg0IURa+INouqcX1UiOtQu7MMIqTzWiQCG7SF
	R/IWbzSNLy2D5FXflPvSrXNDS05gKMVREmyKx8Cwr48d9G4nYlT6hYlGYuoRdoELmlL2dSXHOk+
	fUO2s7fcYgduF00uA1xFRF46/mTKHTy3+O68N/JJzD9SsJohXs6dlrnvoCQO/tvmkgfH2sxTSLX
	iQnQMBxPGM3JpKlRejwt3BaIQn4nr87KsSyTi4pju45Zu84W1wJisYHKk2uh8hqnLAoevH7nA+Z
	F/HYVc5SvdqkFZQ+Wpn2hCP4BSDlsOSlRfCTD4iFNQBkbfYUDsH6XI0yr2Pr27tmbJEPWWd7/ev
	qMjBx4IB6d4BtsSP1SmBHSFEWYSF6oMmDbrm6njQfdxbmQyTpFOSmu+4OCNvDOZPhdFW/mmsFPi
	GY9H7m5BsxcO/3LGtZXUoaIWc1n/dJR5wVTNhBN+q2T/7/WQo5n2U/H8iQ/X2l/9ceuIcgEnjZf
	cWjQW6xwdCxgHwgYX33CFFg==
X-Received: by 2002:a05:600c:1c03:b0:4a3:5aea:21e5 with SMTP id 5b1f17b1804b1-4bb7da1392emr3582515e9.9.1794943520032;
        Tue, 17 Nov 2026 11:25:20 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb7d256f64sm6615065e9.1.2026.11.17.11.25.18
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Nov 2026 11:25:19 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <26f53b63-2f75-4fa4-bf6f-d3495e4e5cb0@gmail.com>
Date: Tue, 17 Nov 2026 19:25:17 +0000
X-Mailing-List: linux-kbuild@vger.kernel.org
List-Id: <linux-kbuild.vger.kernel.org>
List-Post: <mailto:linux-kbuild@vger.kernel.org>
List-Help: <mailto:linux-kbuild+help@vger.kernel.org>
List-Subscribe: <mailto:linux-kbuild+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-kbuild+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-kbuild+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
To: Dmitry Voytik <voytikd@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20261117132513.52725-1-voytikd@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261117132513.52725-1-voytikd@gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------h9NH4JQ2nsmywqa2RPKACNQG"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------h9NH4JQ2nsmywqa2RPKACNQG
Content-Type: multipart/mixed; boundary="------------1ksFLSAbDFp3BUVtXrT4MIm0";
 protected-headers="v1"; hp="clear"
Message-ID: <26f53b63-2f75-4fa4-bf6f-d3495e4e5cb0@gmail.com>
Date: Tue, 17 Nov 2026 19:25:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8] scripts/config: honor $KBUILD_OUTPUT by default
To: Dmitry Voytik <voytikd@gmail.com>, Nathan Chancellor <nathan@kernel.org>,
 Nicolas Schier <nsc@kernel.org>
Cc: Nicolas Schier <n.schier@fritz.com>, linux-kernel@vger.kernel.org,
 linux-kbuild@vger.kernel.org
References: <20261117132513.52725-1-voytikd@gmail.com>
Content-Language: en-US
From: Julian Braha <julianbraha@gmail.com>
In-Reply-To: <20261117132513.52725-1-voytikd@gmail.com>

--------------1ksFLSAbDFp3BUVtXrT4MIm0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Dmitry,

On 11/17/26 13:25, Dmitry Voytik wrote:
> If $KBUILD_OUTPUT is set, use it by default if --file is not passed.

I guess this isn't inaccurate, but it should perhaps mention for
completeness that 'scripts/config' will also now default to using
'$KBUILD_OUTPUT' if passing '.config' with '--file'.

>=20
> Fix the issue when the script silently updates a stale .config in
> the root directory, while the user expects ${KBUILD_OUTPUT}/.config
> to be updated.
> Handle properly if the config file is a relative path.
>=20
> The problem can be worked around with --file, but this is easy to miss,=

> and is inconsistent with how the Makefile and other tools work
> (e.g., scripts/diffconfig).
>=20
> How to reproduce the issue:
> 	make mrproper
> 	export KBUILD_OUTPUT=3D.out
> 	make defconfig
> 	./scripts/config \
> 	       -e CONFIG_UBSAN
> Error reported:
> 	grep: .config: No such file or directory
>=20
> Signed-off-by: Dmitry Voytik <voytikd@gmail.com>
> Suggested-by: Nathan Chancellor <nathan@kernel.org>
> ---
> How the patch was tested:
> 	make mrproper
> 	export KBUILD_OUTPUT=3D.out
> 	make defconfig
> 	grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config || echo "OK"
>=20
> Test the basic usage:
> 	./scripts/config -e CONFIG_UBSAN
> 	grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config && echo "OK"
>=20
> Test --refresh picks up correct config file by using $KBUILD_OUTPUT:
> 	./scripts/config -d CONFIG_UBSAN
> 	grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config && echo "FAIL"
> 	./scripts/config --refresh -e CONFIG_UBSAN
> 	grep "CONFIG_UBSAN=3Dy" $KBUILD_OUTPUT/.config && echo "OK"
>=20
> Test --file takes precedence over $KBUILD_OUTPUT and a relative
> path is handled properly:
> 	./scripts/config -d CONFIG_UBSAN
> 	mkdir .out2
> 	cp .out/.config .out2/.my_config
> 	grep "CONFIG_UBSAN=3Dy" .out2/.my_config  && echo "FAIL"
> 	./scripts/config --file .out2/.my_config --refresh \
> 	       -e CONFIG_UBSAN
> 	grep "CONFIG_UBSAN=3Dy" .out2/.my_config && echo "OK"
> 	ls .out/.out2 && echo "FAIL"
> 	ls .out/.out && echo "FAIL"
>=20
> Test --file can accept files with hyphen:
> 	./scripts/config -d CONFIG_UBSAN
> 	cp .out/.config -- -my_config
> 	grep "CONFIG_UBSAN=3Dy" -- -my_config && echo "FAIL"
> 	./scripts/config  --refresh \
> 	       -e CONFIG_UBSAN --file -my_config
> 	grep "CONFIG_UBSAN=3Dy" -- -my_config && echo "OK"
> ---
> v8:
>  * Nathan Chancellor ironed out the patch to the acceptable state
> v7:
>  * Adressed https://sashiko.dev/#/patchset/20261006142337.821859-1-voyt=
ikd%40gmail.com
> v6:
>  * Per Nathan Chancellor's suggestions, simplified
>  * https://lore.kernel.org/
> lkml/179121581235.2275809.12565811683284940522.b4-review@b4/
> v5:
>  * Per Nathan Chancellor's suggestion, improved handling $FN path by
>    realpath
>  * https://lore.kernel.org/
> lkml/179097210878.309835.10523307262544578337.b4-review@b4/
>  * Documented the new test scenario in the git commit message
> v4:
>  * Addressed Nicolas Schier's comments - dropped the change how '--refr=
esh'
>    is handled
>  * Implemented conversion of $FN to the absolute path which helps with
>    '--refresh' and relative paths
>  * Documented testing steps in the commit message
> v3:
>  * Added an example in the commit message how to reproduce the issue
> v2:
>  * Addressed comments by sashiko:
>    * https://sashiko.dev/#/patchset/20260920064350.17999-1-voytikd%40gm=
ail.com
>    * use basename when --refresh is used
>    * remove echo which can be misleading when --file is passed
> v1:
>  * https://lore.kernel.org/all/20260920064350.17999-1-voytikd@gmail.com=
/
> ---
>  scripts/config | 22 +++++++++++++++++++---
>  1 file changed, 19 insertions(+), 3 deletions(-)
>=20
> diff --git a/scripts/config b/scripts/config
> index 32428ea909c2..13b87b7f316a 100755
> --- a/scripts/config
> +++ b/scripts/config
> @@ -144,6 +144,22 @@ while [[ $# -gt 0 ]]; do
>  	fi
>  done
> =20
> +# If no '--file' was specified, use KBUILD_OUTPUT as the base if it ex=
ists
> +if [[ "$FN" =3D ".config" && -n "$KBUILD_OUTPUT" ]]; then

Right so this will give different results with:
    '--file .config'
and:
    '--file ./.config'

but maybe that was intentional -- i.e. we're assuming a user passing
'.config' intends it to be '$KBUILD_OUTPUT/.config' while a user passing
'./.config' would intend CWD/.config?

> +	if [[ ! -d "$KBUILD_OUTPUT" ]]; then
> +		echo "KBUILD_OUTPUT is set ('$KBUILD_OUTPUT') but does not exist or =
is not a directory." >&2
> +		echo "Create it before running $myname or use '--file' to specify co=
nfiguration file." >&2
> +		exit 1
> +	fi
> +	FN=3D"$KBUILD_OUTPUT/$FN"
> +fi
> +# Turn FN into an absolute path if it is relative so that '--refresh' =
works on
> +# the correct file. This does not use realpath, as $FN may not exist y=
et.
> +case "$FN" in
> +	/*) ;;
> +	*) FN=3D"$PWD/$FN" ;;
> +esac
> +
>  set -- "${CMDS[@]}"
>  if [ "$1" =3D "" ] ; then
>  	usage
> @@ -200,10 +216,10 @@ while [ "$1" !=3D "" ] ; do
>  		;;
> =20
>  	--state|-s)
> -		if grep -q "# ${CONFIG_}$ARG is not set" $FN ; then
> +		if grep -q "# ${CONFIG_}$ARG is not set" "$FN" ; then
>  			echo n
>  		else
> -			V=3D"$(grep "^${CONFIG_}$ARG=3D" $FN)"
> +			V=3D"$(grep "^${CONFIG_}$ARG=3D" "$FN")"
>  			if [ $? !=3D 0 ] ; then
>  				echo undef
>  			else
> @@ -229,7 +245,7 @@ while [ "$1" !=3D "" ] ; do
>  		;;
> =20
>  	--refresh)
> -		yes "" | make oldconfig KCONFIG_CONFIG=3D$FN
> +		yes "" | make oldconfig KCONFIG_CONFIG=3D"$FN"
>  		;;
> =20
>  	*)
> -- 2.56.1
>=20

Tested-by: Julian Braha <julianbraha@gmail.com>
Reviewed-by: Julian Braha <julianbraha@gmail.com>

--------------1ksFLSAbDFp3BUVtXrT4MIm0--

--------------h9NH4JQ2nsmywqa2RPKACNQG
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavyqHQUDAAAAAAAKCRDElYPCBXNxIKGe
AP4pDmqqFsz3r95g9aqPdO3jTxBzN/dky9iQK/BePfsGgAEAoNorCzArcpVk28VeKaS+ISJBOQdx
Im02pG67wW/PBQA=
=ybVr
-----END PGP SIGNATURE-----

--------------h9NH4JQ2nsmywqa2RPKACNQG--
