Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.20]:56085 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753068AbdEQNMS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2017 09:12:18 -0400
Subject: Re: [PATCH v2] Fix ctype(3) usage in the kconfig code on NetBSD
References: <1457397085-10907-1-git-send-email-n54@gmx.com>
 <20170507134422.2666-1-n54@gmx.com>
 <b2a75122-5762-542e-14b8-c6ef459b0825@gmx.com>
 <0857dbdf-d62f-c290-37ca-727fc2b1696b@infradead.org>
 <a0bc2b55-0985-49a3-067d-5e7c1eb3ee5e@infradead.org>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <35570f77-5439-2760-a098-7aa4a60aad03@gmx.com>
Date: Wed, 17 May 2017 15:13:48 +0200
MIME-Version: 1.0
In-Reply-To: <a0bc2b55-0985-49a3-067d-5e7c1eb3ee5e@infradead.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="Q8CmlUlVrO3vfiIR1WQpwrMD69s6irvtJ"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, Andrew Morton <akpm@linux-foundation.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, richard@nod.at

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--Q8CmlUlVrO3vfiIR1WQpwrMD69s6irvtJ
Content-Type: multipart/mixed; boundary="E9ohursximgfekXebdDUj2MmrpQTHhVJs";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Randy Dunlap <rdunlap@infradead.org>, linux-kbuild@vger.kernel.org
Cc: yann.morin.1998@free.fr, Andrew Morton <akpm@linux-foundation.org>,
 Masahiro Yamada <yamada.masahiro@socionext.com>, richard@nod.at
Message-ID: <35570f77-5439-2760-a098-7aa4a60aad03@gmx.com>
Subject: Re: [PATCH v2] Fix ctype(3) usage in the kconfig code on NetBSD
References: <1457397085-10907-1-git-send-email-n54@gmx.com>
 <20170507134422.2666-1-n54@gmx.com>
 <b2a75122-5762-542e-14b8-c6ef459b0825@gmx.com>
 <0857dbdf-d62f-c290-37ca-727fc2b1696b@infradead.org>
 <a0bc2b55-0985-49a3-067d-5e7c1eb3ee5e@infradead.org>
In-Reply-To: <a0bc2b55-0985-49a3-067d-5e7c1eb3ee5e@infradead.org>

--E9ohursximgfekXebdDUj2MmrpQTHhVJs
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

Resending and CC Richard.

On 09.05.2017 01:52, Randy Dunlap wrote:
> On 05/07/17 17:04, Randy Dunlap wrote:
>>
>> Patch makes sense to me. I haven't tested it but I can.
>=20
> Tested-by: Randy Dunlap <rdunlap@infradead.org>
>=20
>=20
>> A bigger problem is who will merge it.  Yann has relinquished the
>> maintainership of kconfig (see http://marc.info/?l=3Dlinux-kbuild&m=3D=
149185505605964&w=3D2).
>> (That patch needs to be merged also.)
>>
>> and the kbuild maintainer is not maintaining kconfig IIRC.
>>
>> Andrew, would you push this patch?  and the one for the MAINTAINERS fi=
le?
>> (http://marc.info/?l=3Dlinux-kbuild&m=3D149419921910871&w=3D2)
>>
>>
>>
>> On 05/07/17 06:59, Kamil Rytarowski wrote:
>>> I've rebased the patch to the current HEAD.
>>>
>>> This is general yearly PING...
>>>
>>> On 07.05.2017 15:44, Kamil Rytarowski wrote:
>>>> The current code produces set of warnings on NetBSD-7.99.25 (GCC 4.8=
=2E5):
>>>>
>=20
>>>>
>>>> Signed-off-by: Kamil Rytarowski <n54@gmx.com>
>>>> ---
>>>>  scripts/basic/fixdep.c               |  2 +-
>>>>  scripts/kconfig/conf.c               |  6 +++---
>>>>  scripts/kconfig/confdata.c           |  9 +++++----
>>>>  scripts/kconfig/expr.c               |  3 ++-
>>>>  scripts/kconfig/lxdialog/checklist.c |  3 ++-
>>>>  scripts/kconfig/lxdialog/inputbox.c  |  3 ++-
>>>>  scripts/kconfig/lxdialog/menubox.c   | 11 +++++++----
>>>>  scripts/kconfig/lxdialog/util.c      |  5 +++--
>>>>  scripts/kconfig/menu.c               |  4 ++--
>>>>  scripts/kconfig/nconf.c              |  3 ++-
>>>>  scripts/kconfig/nconf.gui.c          |  3 ++-
>>>>  scripts/kconfig/symbol.c             |  8 ++++----
>>>>  12 files changed, 35 insertions(+), 25 deletions(-)
>=20
>=20



--E9ohursximgfekXebdDUj2MmrpQTHhVJs--

--Q8CmlUlVrO3vfiIR1WQpwrMD69s6irvtJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZHEyRAAoJEEuzCOmwLnZsJNwP/jECV/il3egmZ2DyfGVSQGPS
9kpmnjS2C8iPOQhsyO5bUXlIp+LD5kUFTmc6d4a4Rq1dTy2X6jYrggZErgx+mdF2
FFp/IZ3nSw4hqWi0AyC04+DvjeMMY29nJjptK6OQEfYzz2TejMFTmHp7PnOQtzdj
io4d7KEXvgtbgXIFtkxaYAgcZ0oghK0z1bE0Q0fM7GeWOquLbvHOza6aPKVN70UW
JfYSBzbVwYQWRwcFEqvv+K4nqJT0V4RHFbj3ncSmHB5pmW0NJ10WYw3vAfBpmIb/
EztYkohO2X9zW9GbM/fuDvbGyty9lxlYF2FaxgZAaMxPnrJXiJx4hgZOnzkYdorU
9mPzS71Jh8vp9AzBxCFRAu+MTRbdyKFq6wqPvu0wER9BUo7RkcntiDsDH+z+/08U
H6PRUGrjt9IepqsKydpIQjzd0tGz2/t5h8ZfJjzTWn2g1cWe3NKcCOiWds4MId3h
J3hpeGF6gNozRQk8sql647FmaHfzRpW4Wc/UOGZCBwzaPDvg6xAjZb66cXG2xFlZ
Lualn4ojZwTDqoy8IvvptLpx/l/HAdFdby3cGqbqBTvGx0VEftYmZttNx9uzTtP6
a8Pw48rdzzgi55ha5njGjvvJpAlwdBOH+CVIEIXB7Hw4oZBk90xX+caJIeh64Rx/
JHZYKpofqmPOvt8GPeFS
=m3IQ
-----END PGP SIGNATURE-----

--Q8CmlUlVrO3vfiIR1WQpwrMD69s6irvtJ--
