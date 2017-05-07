Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.15.19]:57914 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752506AbdEGV5Q (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 17:57:16 -0400
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
References: <20170507145609.4395-1-n54@gmx.com>
 <1494176499.31950.34.camel@perches.com>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com>
Date: Sun, 7 May 2017 22:14:23 +0200
MIME-Version: 1.0
In-Reply-To: <1494176499.31950.34.camel@perches.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="b4CE7JVnrmgmQwtuga9T5tpTLTjJAtxgS"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>, linux-kbuild@vger.kernel.org
Cc: apw@canonical.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--b4CE7JVnrmgmQwtuga9T5tpTLTjJAtxgS
Content-Type: multipart/mixed; boundary="lsu4VicIpsmsACwlP5PXCaMpJkM7Vdoqs";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Joe Perches <joe@perches.com>, linux-kbuild@vger.kernel.org
Cc: apw@canonical.com
Message-ID: <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com>
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
References: <20170507145609.4395-1-n54@gmx.com>
 <1494176499.31950.34.camel@perches.com>
In-Reply-To: <1494176499.31950.34.camel@perches.com>

--lsu4VicIpsmsACwlP5PXCaMpJkM7Vdoqs
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 07.05.2017 19:01, Joe Perches wrote:
> On Sun, 2017-05-07 at 16:56 +0200, Kamil Rytarowski wrote:
>> The default NetBSD package manager is pkgsrc and it installs Perl
>> along other third party programs under custom and configurable prefix.=

>> The default prefix for binary prebuilt packages is /usr/pkg, and the
>> Perl executable lands in /usr/pkg/bin/perl.
>>
>> This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it's
>> the most portable solution that should work for almost everybody.
>> Perl's executable is detected automatically.
>>
>> This change switches -w option passed to the executable with more
>> modern "use warnings;" approach. There is no functional change to the
>> default behavior.
>=20
> Functionality would then depend on user $PATH.

Yes.

> Better?  <shrug>

Correct.

In pkgsrc we have automatic scripts to adjust shebangs for scripting
languages (Perl, Python, Bash etc). But in this case I build the Linux
kernel out of the pkgsrc context on my NetBSD workstation.

Exactly the same change has been accepted in qemu, currently it's
waiting to be merged with master. from the "-trival" branch.

In my case I won't be enforced to keep fixing it manually every time I
sync with HEAD. Another point is that the Linux version of this script
is model and projects fork it, and we need to keep adjusting it downstrea=
m.

>=20
> For the perl "-w", adding "use warnings;" instead of
> "-w" seems sensible enough.  Is any build environment
> using a perl version below 5.6?
>=20

5.6 was released in 2003.

Out of context of this patch, scripts/namespace.pl ships with "require
5" (year 1994?) - removal of this line could be evaluated.


--lsu4VicIpsmsACwlP5PXCaMpJkM7Vdoqs--

--b4CE7JVnrmgmQwtuga9T5tpTLTjJAtxgS
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZD4AuAAoJEEuzCOmwLnZs3UYP/2ZnxM8NnWayYUQTiilS4oOt
/lqhEXw2cEm1YnS2oVSMqTGtUlpPoCJrV0HDGfyg7fj42gYPTTUuPHYvkjzGtz86
Nxt8eAl+5DNZKCGXGWQftjJhh+wv15udSmhdD36V1jdzaC/nmwjwnBG+LZcrSSA0
SbrfWPCPlvA6KofzBgwoFwCTNChv1V2RrsnFPu9jW5Zjc9kCimI3TQI0dXpl8GX8
ou81Jiu8sldlzLqyy/Cjr5YJSUtLNYSNw2K5tmjyU4dQ0twy1JJSM789ChDSwe7x
2t3aKc1/yeMg0aZ5zFaCHe6hzJTu/7joWcB6llMWJ+in+XNtTLrW1MsToJrBOwRz
tRKrhwJcITKE1gFuq8yqEasBiBGyvKySuh0+jvANyn8iPClw5mbSrYzNTmvYIPey
1GSyI01oCH6ZtynB0XcCypH42fAvepkj5ZvRWRSOIBcl2hBQDXBpOpyRKOAJ7bou
W/ngI1CKDu+PTavn0LfTBa+nbuplRhWWKfXAFbqwXI538AEKbvLBvj7Z/TLLOcyc
+uegiKRKxwHG5yoKK5SK/rvC0Z7MCQSBS/YOUegVf9uG4AogklGVAzFIR5JXTR9n
LFh2BgZs9bN1GwE/mJ+0FoaACwBSCs/etRfwY6jKJSsCr12ToMX9QD/CzUdXqP2Q
qSskdQa93TupsktZwX6v
=o3kw
-----END PGP SIGNATURE-----

--b4CE7JVnrmgmQwtuga9T5tpTLTjJAtxgS--
