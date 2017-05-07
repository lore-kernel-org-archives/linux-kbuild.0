Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:60922 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751669AbdEGVma (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 17:42:30 -0400
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
References: <20170507145609.4395-1-n54@gmx.com>
 <1494176499.31950.34.camel@perches.com>
 <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com>
 <1494188521.31950.43.camel@perches.com>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <98151f28-d7b3-3310-353e-ae4cc80a43ee@gmx.com>
Date: Sun, 7 May 2017 22:37:50 +0200
MIME-Version: 1.0
In-Reply-To: <1494188521.31950.43.camel@perches.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="5KufpKRXHAaOnM8gf6Nc7sknivxpLAA1N"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>, linux-kbuild@vger.kernel.org
Cc: apw@canonical.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--5KufpKRXHAaOnM8gf6Nc7sknivxpLAA1N
Content-Type: multipart/mixed; boundary="WPrK5kKRG3hplq6JBEljXSbmBGTb0ORoa";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Joe Perches <joe@perches.com>, linux-kbuild@vger.kernel.org
Cc: apw@canonical.com
Message-ID: <98151f28-d7b3-3310-353e-ae4cc80a43ee@gmx.com>
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
References: <20170507145609.4395-1-n54@gmx.com>
 <1494176499.31950.34.camel@perches.com>
 <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com>
 <1494188521.31950.43.camel@perches.com>
In-Reply-To: <1494188521.31950.43.camel@perches.com>

--WPrK5kKRG3hplq6JBEljXSbmBGTb0ORoa
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07.05.2017 22:22, Joe Perches wrote:
> On Sun, 2017-05-07 at 22:14 +0200, Kamil Rytarowski wrote:
>> On 07.05.2017 19:01, Joe Perches wrote:
>>> On Sun, 2017-05-07 at 16:56 +0200, Kamil Rytarowski wrote:
>>>> The default NetBSD package manager is pkgsrc and it installs Perl
>>>> along other third party programs under custom and configurable prefi=
x.
>>>> The default prefix for binary prebuilt packages is /usr/pkg, and the=

>>>> Perl executable lands in /usr/pkg/bin/perl.
>>>>
>>>> This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it's
>>>> the most portable solution that should work for almost everybody.
>>>> Perl's executable is detected automatically.
>>>>
>>>> This change switches -w option passed to the executable with more
>>>> modern "use warnings;" approach. There is no functional change to th=
e
>>>> default behavior.
>>>
>>> Functionality would then depend on user $PATH.
>>
>> Yes.
>>
>>> Better?  <shrug>
>>
>> Correct.
>>
>> In pkgsrc we have automatic scripts to adjust shebangs for scripting
>> languages (Perl, Python, Bash etc). But in this case I build the Linux=

>> kernel out of the pkgsrc context on my NetBSD workstation.
>>
>> Exactly the same change has been accepted in qemu, currently it's
>> waiting to be merged with master. from the "-trival" branch.
>>
>> In my case I won't be enforced to keep fixing it manually every time I=

>> sync with HEAD. Another point is that the Linux version of this script=

>> is model and projects fork it, and we need to keep adjusting it downst=
ream.
>>
>>>
>>> For the perl "-w", adding "use warnings;" instead of
>>> "-w" seems sensible enough.  Is any build environment
>>> using a perl version below 5.6?
>>>
>>
>> 5.6 was released in 2003.
>=20
> I know a person using 5.8 (cough: Andrew Morton), but 5.6
> really is quite old.
>=20

It was just decided to depend on GNU Make 3.81 (released 2010). Minimal
required GCC bump has been discussed a while ago.. I don't expect to
have people with 2003 setups and functional enough to build the kernel
from HEAD.

>> Out of context of this patch, scripts/namespace.pl ships with "require=

>> 5" (year 1994?) - removal of this line could be evaluated.
>=20
> I'm for removal.
>=20

I will include it in v2.


--WPrK5kKRG3hplq6JBEljXSbmBGTb0ORoa--

--5KufpKRXHAaOnM8gf6Nc7sknivxpLAA1N
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZD4WkAAoJEEuzCOmwLnZsk/YP/2njKfyqmvHjjaYHGt1VbBJO
2on2ij16QDswRlTWyo2dccxYbBwHZMbo79QDYK65uIEgFeEXeeJx2EEXRYm2vQU+
/KWk6bvST8Ln5ruQp7weIDw9HC6U+jvKH79Y+yKRmiYwKnWtNF30KHrzu8IBtDMe
tyoxjBYvPF4GNSFoIj7EsUAsxaqCr/EjDpMMPBVMVyBtv+pz3fZ5rQ7sK/Ck5IXy
+rxH6e+VA7U+T9s61D4xUX6apk1fCSBIVp99WZpCZTm6lLp4p1oc0rxZfuwbUcRS
01aLTJx6tY1L+OnOZdFyauGogYHL2jP+Z4gM5NYmgXOQNSwjdfHLytXVAuzN/OHI
5ig4pwaPOBmK8CbJ79xWVUp+a+xfbSc6OEmLVrJBkabC5tLCK54GSsC+aIVB9KPr
prbNAINjGAI7qDPQviFACww5lSL3/DKBHe1bOFQhjFt/XO9evyBEy9Z6uw+NIDMp
mTTzJFGWTgwKLKxvBJmB8EdtgCH3sLR/IUohcJiI6m9N5baRjUlXYvBm5FWD9A83
B4WAr3oQPcWqq/oYjkvuzZnqHOVLsyTOHBn2aZpW0GpMvR9cKBTX/p54bS0JDkk/
X4tuAmHr2I5/O4saL0cPNO9al87LaRKHf58j+uqQeScNf4Lg254Q/RBcUHptZb3q
YpURQJG7FwPF1WyuYYO6
=A2j8
-----END PGP SIGNATURE-----

--5KufpKRXHAaOnM8gf6Nc7sknivxpLAA1N--
