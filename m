Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bues.ch ([80.190.117.144]:42624 "EHLO bues.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726241AbeG2NvD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 29 Jul 2018 09:51:03 -0400
Date: Sun, 29 Jul 2018 13:42:02 +0200
From: Michael =?UTF-8?B?QsO8c2No?= <m@bues.ch>
Subject: Re: [TRIVIAL RFC PATCH] Kconfigs - reduce use of "depends on
 EXPERT"
Message-ID: <20180729134202.5ab56762@wiggum>
In-Reply-To: <27780ceb2056b871d746803a2ac23464396f3026.camel@perches.com>
References: <27780ceb2056b871d746803a2ac23464396f3026.camel@perches.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
 boundary="Sig_/zF+NOvxa9zL7F4P8tC0wFvf"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, linux-kbuild <linux-kbuild@vger.kernel.org>, Thomas Gleixner <tglx@linutronix.de>, "H. Peter Anvin" <hpa@zytor.com>, x86@kernel.org, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Jani Nikula <jani.nikula@linux.intel.com>, Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, Rodrigo Vivi <rodrigo.vivi@intel.com>, David Airlie <airlied@linux.ie>, Rob Clark <robdclark@gmail.com>, Johannes Berg <johannes.berg@intel.com>, Emmanuel Grumbach <emmanuel.grumbach@intel.com>, Luca Coelho <luciano.coelho@intel.com>, Intel Linux Wireless <linuxwifi@intel.com>, Kalle Valo <kvalo@codeaurora.org>, "David S. Miller" <davem@davemloft.net>, Bartlomiej Zolnierkiewicz <b.zolnierkie@samsung.com>, "Rafael J. Wysocki" <rjw@rjwysocki.net>, Len Brown <len.brown@intel.com>, Pavel Machek <pavel@ucw.cz>, James Morris <jmorris@namei.org>, "Serge E. Hallyn" <serge@hallyn.com>

--Sig_/zF+NOvxa9zL7F4P8tC0wFvf
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Sat, 28 Jul 2018 15:13:00 -0700
Joe Perches <joe@perches.com> wrote:

>  config SSB_SILENT
> -	bool "No SSB kernel messages"
> -	depends on SSB && EXPERT
> +	bool "No SSB kernel messages" if EXPERT
> +	depends on SSB
>  	help
>  	  This option turns off all Sonics Silicon Backplane printks.
>  	  Note that you won't be able to identify problems, once


What about removing this option entirely?
We would just have to remove it from Kconfig and from its only use in
drivers/ssb/ssb_private.h
I don't think anybody uses (or should use) this option anyway.
That would reduce the EXPERT dependencies by one, which is a good
thing. :)

--=20
Michael

--Sig_/zF+NOvxa9zL7F4P8tC0wFvf
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEihRzkKVZOnT2ipsS9TK+HZCNiw4FAltdqAoACgkQ9TK+HZCN
iw4Ktw//R+OJKZ2oixZtTGzCwin21bIigZ+8SeqCv3UwNZELVGrvuQnQTWmF9i9T
1kKqo82CZnHL9udgdJqFPp+zvQWDrohX45C0j+ROzBpsyNACaGU3wy7cxayv+0Bn
uTvuRdN4LiBzkaOV1HLu6HN6RYDujuGreIe0v+ks/ugNiRPxg1QopUGISu0N98kw
e4ypm/A3RnU+Ho4T2P3tZFAhc9PVXAUmaIT43rmxZtKxJ0Q0eCjBJmtugr0ffxYg
fg6iG11O/zREjA0Ha9BBaOhVGTj9qg+e2X2w/hdslhfMl1Fft3//JsKRqZPlNfV7
FI6IUx8NqwR0Cmu2b4wVtjyqNkz/1zOh2mbdkWGRQ92IpFDjaLIONo1Xd9ad/L15
VaEckI9AlR7/Jzzz/ZHozXobS/VivBYJi35t0VseWV4kU1x4vvtlAyH7ofnlru6F
Uk5EP3iS7qIPN3fP++ecJ8zPIJEoulxTRTj3PMW9r8io9xXWhR0cywMD8urk64XE
zLB83QiP2ptqGncUYtTdKC1+0rEhmaZgDcLb7Uud+kUCcKLrs73PQWZFyMcURo63
LGArOw9KENQuxhro8f7H0EUUkp44SCOlTtxEebiFka7sB2V67aGPDk9+iNEXyDny
rwPgn393I6XpWKEe83nWlR5z2aK740mzSR0E0AKF64LJW4EnWnU=
=fPeg
-----END PGP SIGNATURE-----

--Sig_/zF+NOvxa9zL7F4P8tC0wFvf--
