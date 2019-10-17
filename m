Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg1-f196.google.com ([209.85.215.196]:43329 "EHLO
        mail-pg1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728639AbfJQRKY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 17 Oct 2019 13:10:24 -0400
Date: Thu, 17 Oct 2019 22:40:09 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts : mksysmap : NM variable missed the value,so
 fixed
Message-ID: <20191017171006.GA4995@Gentoo>
References: <20191017102506.22192-1-unixbhaskar@gmail.com>
 <265d9be5-217d-3f67-ba94-095efdcf5787@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="h31gzZEtNLTqOjlF"
Content-Disposition: inline
In-Reply-To: <265d9be5-217d-3f67-ba94-095efdcf5787@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org


--h31gzZEtNLTqOjlF
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 08:48 Thu 17 Oct 2019, Randy Dunlap wrote:
>On 10/17/19 3:25 AM, Bhaskar Chowdhury wrote:
>> This patch will provide the missing value for NM variable.
>>=20
>
>Hi,
>
>Does this patch fix some build error that you have encountered?
>If so, please describe it and how to cause it.
>
Okay, I tried to do that ,the script spit out not finding the nm.
Now, the sole reason being I misread it in the first place.
>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>> TO all,
>> Adjusted the subject line, missed in previous one,sorry
>>=20
>>  scripts/mksysmap | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>=20
>> diff --git a/scripts/mksysmap b/scripts/mksysmap
>> index a35acc0d0b82..4b2f45c45f14 100755
>> --- a/scripts/mksysmap
>> +++ b/scripts/mksysmap
>> @@ -40,5 +40,5 @@
>>  # 'W' or 'w'. __crc_ are 'A' and placed in the middle
>>  # so we just ignore them to let readprofile continue to work.
>>  # (At least sparc64 has __crc_ in the middle).
>> -
>> +NM=3D$(which nm)
>
>That's not the POSIX way to do that.  It should be
>
>NM=3D$(command -v nm)
>
>But why is this needed at all?
>The top-level Makefile exports the NM variable (and many more) to scripts
>that it calls.
>
Misread it.=20
>>  $NM -n $1 | grep -v '\( [aNUw] \)\|\(__crc_\)\|\( \$[adt]\)\|\( .L\)' >=
 $2
>> --
>> 2.21.0
>>=20
>
Sorry about the noise. Thanks Randy for catch up lackluster stuff.
>
>--=20
>~Randy
>

--h31gzZEtNLTqOjlF
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl2ooGoACgkQsjqdtxFL
KRX5ywf+K6wUurRjCH9BENWJSsb7+xvmm88Qlg8XtNNjsZYa3GhJXwkVRJulTqqJ
m9GKTCgwx+amP60CNSUjYguBfE/sUDVEBATsVKjHMz0ieosNVZwVvKoAQzhW8TXH
TcmWvWnrr4cX4QmTc/4gAkfuLz2rnWg+jbtv/pOmvnaQ582VXCbyKJiXQJnVLT0A
5GUJJdeDm/UGWTaR3pzdOz/yXLK+2YdEWH40aSTkQOVey29EjepW5tweMbOe9Rvd
eSoDEhlYBVYEkwTids77GJjVQNKACSqPBEFD7+RYci1TiHvRx4PqP9RFCPxycdjA
RgIBvteYuc432yRZBfQV9VZFxegsHw==
=ZXiZ
-----END PGP SIGNATURE-----

--h31gzZEtNLTqOjlF--
