Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:59986 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751192AbdEHCEa (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 7 May 2017 22:04:30 -0400
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
References: <20170507145609.4395-1-n54@gmx.com>
 <1494176499.31950.34.camel@perches.com>
 <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com>
 <1494188521.31950.43.camel@perches.com>
 <98151f28-d7b3-3310-353e-ae4cc80a43ee@gmx.com>
 <CAK7LNAQJCq3DnEXgCMGyT-3J8PoKVXg=fukS9N5xdnke77AwVA@mail.gmail.com>
From: Kamil Rytarowski <n54@gmx.com>
Message-ID: <ea807846-1409-61b7-0821-9df16b83440b@gmx.com>
Date: Mon, 8 May 2017 03:56:12 +0200
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQJCq3DnEXgCMGyT-3J8PoKVXg=fukS9N5xdnke77AwVA@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="79mUa3RAeg7nj5vGtmHQMNnKnpCWx2e8O"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Joe Perches <joe@perches.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, apw@canonical.com

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--79mUa3RAeg7nj5vGtmHQMNnKnpCWx2e8O
Content-Type: multipart/mixed; boundary="O9eaP4sV8owuRaCIFd3UNdcLCevrVhtA7";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Joe Perches <joe@perches.com>,
 Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, apw@canonical.com
Message-ID: <ea807846-1409-61b7-0821-9df16b83440b@gmx.com>
Subject: Re: [PATCH] scripts: Switch to more portable Perl shebang
References: <20170507145609.4395-1-n54@gmx.com>
 <1494176499.31950.34.camel@perches.com>
 <920de41e-0007-90af-1b7b-a6bee48280d2@gmx.com>
 <1494188521.31950.43.camel@perches.com>
 <98151f28-d7b3-3310-353e-ae4cc80a43ee@gmx.com>
 <CAK7LNAQJCq3DnEXgCMGyT-3J8PoKVXg=fukS9N5xdnke77AwVA@mail.gmail.com>
In-Reply-To: <CAK7LNAQJCq3DnEXgCMGyT-3J8PoKVXg=fukS9N5xdnke77AwVA@mail.gmail.com>

--O9eaP4sV8owuRaCIFd3UNdcLCevrVhtA7
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 08.05.2017 00:48, Masahiro Yamada wrote:
> 2017-05-08 5:37 GMT+09:00 Kamil Rytarowski <n54@gmx.com>:
>> On 07.05.2017 22:22, Joe Perches wrote:
>>> On Sun, 2017-05-07 at 22:14 +0200, Kamil Rytarowski wrote:
>>>> On 07.05.2017 19:01, Joe Perches wrote:
>>>>> On Sun, 2017-05-07 at 16:56 +0200, Kamil Rytarowski wrote:
>>>>>> The default NetBSD package manager is pkgsrc and it installs Perl
>>>>>> along other third party programs under custom and configurable pre=
fix.
>>>>>> The default prefix for binary prebuilt packages is /usr/pkg, and t=
he
>>>>>> Perl executable lands in /usr/pkg/bin/perl.
>>>>>>
>>>>>> This change switches "/usr/bin/perl" to "/usr/bin/env perl" as it'=
s
>>>>>> the most portable solution that should work for almost everybody.
>>>>>> Perl's executable is detected automatically.
>>>>>>
>>>>>> This change switches -w option passed to the executable with more
>>>>>> modern "use warnings;" approach. There is no functional change to =
the
>>>>>> default behavior.
>>>>>
>>>>> Functionality would then depend on user $PATH.
>>>>
>>>> Yes.
>>>>
>>>>> Better?  <shrug>
>>>>
>>>> Correct.
>>>>
>>>> In pkgsrc we have automatic scripts to adjust shebangs for scripting=

>>>> languages (Perl, Python, Bash etc). But in this case I build the Lin=
ux
>>>> kernel out of the pkgsrc context on my NetBSD workstation.
>>>>
>>>> Exactly the same change has been accepted in qemu, currently it's
>>>> waiting to be merged with master. from the "-trival" branch.
>>>>
>>>> In my case I won't be enforced to keep fixing it manually every time=
 I
>>>> sync with HEAD. Another point is that the Linux version of this scri=
pt
>>>> is model and projects fork it, and we need to keep adjusting it down=
stream.
>>>>
>>>>>
>>>>> For the perl "-w", adding "use warnings;" instead of
>>>>> "-w" seems sensible enough.  Is any build environment
>>>>> using a perl version below 5.6?
>>>>>
>>>>
>>>> 5.6 was released in 2003.
>>>
>>> I know a person using 5.8 (cough: Andrew Morton), but 5.6
>>> really is quite old.
>>>
>>
>> It was just decided to depend on GNU Make 3.81 (released 2010).
>=20
> I think 3.81 was released in 2006
> and 3.82 in 2010.
>=20

You are right about the dates, I feel corrected.

The original sentence still stands.

I noted that "use warnings;" was already present, just in case someone
would be worried about portability of it:

scripts/headerdep.pl:use warnings;


--O9eaP4sV8owuRaCIFd3UNdcLCevrVhtA7--

--79mUa3RAeg7nj5vGtmHQMNnKnpCWx2e8O
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZD9BJAAoJEEuzCOmwLnZsXXUP/18bgw2PAjiQXSD9d21Bpnn6
GtQO/aVJMNU3qmjJEibwJt4LtnGoBM/9rhaBLqs/5WCNDgm7TKSLhYY9Ouj1e/Qw
CmQDb79yk4bIqWaGo1pcgWGQ2z3wc2dg4RrLfvCcrFXit1OHQlbrRhl1kZpYwTgP
B/Oa1nyseyrLkpUf2QFFm00WM6ZvW0SsLcQuCsG0r3wLQfhifseqyhgBqZnxRenI
oJtX9HgKhmXOL05XFK227fsIgEmHM3j+evXpPXw7zZ/TM1AbzE2Tu7kc8JyYHdQE
zxaVeENCE1k4iPT2cU4HEK89TQv/15Sc98jJiXXv4u8GogmkdeQvjjq7OjsieBPF
QQy/QOFcRM14TQAFFGRQ7A0/SE+0FtrggI0EXwrx7K7TtUNPnqPMze7nZoJhOiAY
ZEn54qRJH/K7g3C8DsfS7CNrc8byXuvTY75N8fnglrbDFLpOoqFrVaBso6okxln1
onW5YAPthd6TEajuoIxNX4Vfyv+JfAXvdsRKHXW6g0nuJIpn+8d4p7LetI3Fjngk
epnmoyIRkicXb5WftNxke1M/GDVRj3DSoSaZQB4qqq3XN8r72QyoGo3II9r5IJpS
BRVwAJ+mySvJq/HE2kCvAIaZicPf3I0mEX5afHVJbHNwwRRgGz8Odz8oDn2s3ZuV
mcBrOYbJvtA+GHxC+gWK
=6kFs
-----END PGP SIGNATURE-----

--79mUa3RAeg7nj5vGtmHQMNnKnpCWx2e8O--
