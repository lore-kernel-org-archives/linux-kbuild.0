Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:41572 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725901AbfLEFPH (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Dec 2019 00:15:07 -0500
Date: Thu, 5 Dec 2019 10:44:54 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH 2/2] fix the SPDX syntax and bash interprester pointer
Message-ID: <20191205051454.GB1795@Slackware>
References: <20191203095339.615774-1-unixbhaskar@gmail.com>
 <56303cd3-fcf8-49cd-f66a-4db7e382774c@infradead.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="5QAgd0e35j3NYeGe"
Content-Disposition: inline
In-Reply-To: <56303cd3-fcf8-49cd-f66a-4db7e382774c@infradead.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--5QAgd0e35j3NYeGe
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 19:36 Wed 04 Dec 2019, Randy Dunlap wrote:
>On 12/3/19 1:53 AM, Bhaskar Chowdhury wrote:
>> SPDX syntax was complining by checkpatch fixed it,added space before it.
>> And add bash interpreter to find by the env .
>>=20
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/kernel_modules_info.sh | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>=20
>> diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_inf=
o.sh
>> index f005c47a3aa6..3a9b00988ed3 100755
>> --- a/scripts/kernel_modules_info.sh
>> +++ b/scripts/kernel_modules_info.sh
>> @@ -1,5 +1,5 @@
>> -#!/bin/bash -=20
>> -#SPDX-License-Identifier: GPL-2.0
>> +#!/usr/bin/env bash=20
>> +# SPDX-License-Identifier: GPL-2.0
>>  #=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>>  #
>>  #          FILE: kernel_modules_info.sh
>>=20
>
>a.  There is no good reason for patch 2/2.  Just merge the 2 patches.
>
>b.  The big header comment in patch 1/2 is not needed and is unwanted.
>Just put some or all of that in the patch description/comment message.
>
Sure, will do.
>
>--=20
>~Randy
>

--5QAgd0e35j3NYeGe
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3okkgACgkQsjqdtxFL
KRXbxQgAhat4587gaoyRNOa21+kvB4Q6ui6yRplOY+G3lUt8lFz1WDylqXgkZJXt
mqHAwXXgZ7UEcYeHN+UQ3Zv9BeJ3z7kdZ9dDjNJlyP+RLJ26w28FshQLRF5k6LyT
PRiprV5e80wxct4OJD+ImS7MpRck5wnKaOxQLqJ46mUMOCC7JKBehA305WZvb5DV
6bZMQ1IErFST+66nuPs/gs6Vqs+MeuaesiCP68+s/iRohYSko6IJedqqK3Smh42J
ecczqKILoZeulJ0MBcA256eKv3U4Jw6vMpsU3rPawy87LJdwLNZ7rHBqTvSXZiB2
FAo1g4Gn1dXPNilqkOIipzObG0G+Fg==
=i601
-----END PGP SIGNATURE-----

--5QAgd0e35j3NYeGe--
