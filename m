Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f68.google.com ([209.85.216.68]:33281 "EHLO
        mail-pj1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728132AbfLEDaw (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Dec 2019 22:30:52 -0500
Date: Thu, 5 Dec 2019 09:00:38 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
Message-ID: <20191205033035.GB3981@debian>
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
 <20191204041543.GA1086470@ArchLinux>
 <6ff74f67-11d3-d16f-8aeb-828c01455961@metux.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="GRPZ8SYKNexpdSJ7"
Content-Disposition: inline
In-Reply-To: <6ff74f67-11d3-d16f-8aeb-828c01455961@metux.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Enrico Weigelt, metux IT consult" <lkml@metux.net>
Cc: Masahiro Yamada <masahiroy@kernel.org>, Michal Marek <michal.lkml@markovi.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--GRPZ8SYKNexpdSJ7
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 14:48 Wed 04 Dec 2019, Enrico Weigelt, metux IT consult wrote:
>On 04.12.19 05:22, Bhaskar Chowdhury wrote:
>
>Hi,
>
>> I think the usefulness comes from developers wants to see what are the
>> modules are using by the running kernel in formatted way.
>> This is very simple way to enlist all the modules with descriptions of
>> it.So , they can easily parse it with other scripts.
>
>IMHO, this is a good thing to have. I can even imagine it shipped by
>distros, for better bug reports.
>
>OTOH, if it's about the currently running kernel and loaded modules, why
>not putting this into /proc or /sys ?

The reason being not putting in the /proc or /sys is, it is not
dynamically generated stuff. This is small script which do a specific
task ,out of the information available  in /proc or /sys.

And essentially resides in the scripts directory for easy finding and
using. =20

:)

~Bhaskar
>
>
>--mtx
>
>--=20
>Dringender Hinweis: aufgrund existenzieller Bedrohung durch "Emotet"
>sollten Sie *niemals* MS-Office-Dokumente via E-Mail annehmen/=F6ffenen,
>selbst wenn diese von vermeintlich vertrauensw=FCrdigen Absendern zu
>stammen scheinen. Andernfalls droht Totalschaden.
>---
>Hinweis: unverschl=FCsselte E-Mails k=F6nnen leicht abgeh=F6rt und manipul=
iert
>werden ! F=FCr eine vertrauliche Kommunikation senden Sie bitte ihren
>GPG/PGP-Schl=FCssel zu.
>---
>Enrico Weigelt, metux IT consult
>Free software and Linux embedded engineering
>info@metux.net -- +49-151-27565287

--GRPZ8SYKNexpdSJ7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3oedgACgkQsjqdtxFL
KRX1EQf/bM+T/selwfgcqWcb3hw5h1W4xeF8v3MgFwzyiBKWHIbSHd8+ly1G4iO+
YMzDeOSceRGjE3p/GnsR9D2Z2Oz/2Bb9U7LH6QO72TQMsP9yfZCXu2jOgxFWdkns
KKybGCo4udo/Ui8RiLZm+0agD3mJClJoRxPAXEgMZ0euRh/oja4r2FF4qfclfKnW
dCuDmLV8eiFElFez+qR1KK4JzmJLcI+RX+0KgATUBNIwbwv+inu/xLKt+nPg2pPu
L0ui74Slc/RKz0CzEs5HA8jsKF1ErqlKNzweK6GoeHGGGx14vRDwyRmjyU08OIcy
Yx69fTPorBKBHJxyJbWdzPRhhL+UMw==
=Tgd4
-----END PGP SIGNATURE-----

--GRPZ8SYKNexpdSJ7--
