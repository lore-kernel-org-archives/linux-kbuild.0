Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f68.google.com ([74.125.83.68]:34574 "EHLO
        mail-pg0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932410AbdCLL4I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 12 Mar 2017 07:56:08 -0400
Date: Sun, 12 Mar 2017 19:56:03 +0800
From: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH] kbuild: strip the last slash in KBUILD_EXTMOD
Message-ID: <20170312115603.GA10470@WeideMacBook-Pro.local>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <20170222150833.83149-1-richard.weiyang@gmail.com>
 <CAK7LNATuG=RqghbmGrx99E95fFAbx9U8DUPp0XQtEO+fbBr-mA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="82I3+IH0IqGh5yIs"
Content-Disposition: inline
In-Reply-To: <CAK7LNATuG=RqghbmGrx99E95fFAbx9U8DUPp0XQtEO+fbBr-mA@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--82I3+IH0IqGh5yIs
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Mar 11, 2017 at 10:34:50PM +0900, Masahiro Yamada wrote:
>Hi Wei,
>
>
>2017-02-23 0:08 GMT+09:00 Wei Yang <richard.weiyang@gmail.com>:
>> Current kbuild will build the target again if we run "make M=3Ddir" and =
"make
>> M=3Ddir/" by turns, since if_changed will see the prerequisite is change=
d.
>> The behavior may confuse the user a little, since actually we are buildi=
ng
>> the same target and no difference.
>>
>> According to current implementation in scripts/Makefile.build, the obj
>> passed to next level is a directory name with last slash stripped. This
>> patch strips the last slash in KBUILD_EXTMOD which is assigned from "M=
=3D".
>>
>> Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>> ---
>>  Makefile | 6 ++++--
>>  1 file changed, 4 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index b1037774e8e8..db6ed60928ab 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -184,13 +184,15 @@ endif
>>  # Old syntax make ... SUBDIRS=3D$PWD is still supported
>>  # Setting the environment variable KBUILD_EXTMOD take precedence
>>  ifdef SUBDIRS
>> -  KBUILD_EXTMOD ?=3D $(SUBDIRS)
>> +  __KBUILD_EXTMOD ?=3D $(SUBDIRS)
>>  endif
>>
>>  ifeq ("$(origin M)", "command line")
>> -  KBUILD_EXTMOD :=3D $(M)
>> +  __KBUILD_EXTMOD :=3D $(M)
>>  endif
>>
>> +KBUILD_EXTMOD =3D $(patsubst %/,%,$(__KBUILD_EXTMOD))
>> +
>>  # If building an external module we do not care about the all: rule
>>  # but instead _all depend on modules
>>  PHONY +=3D all
>
>This patch would break a use-case
>where KBUILD_EXTMOD is given as an environment.
>

Hi, Masahiro=20

Thanks for your comment.

Got your point, you are right.

>
>
>Maybe adding the following should be enough?
>
>KBUILD_EXTMOD :=3D $(patsubst %/,%,$(KBUILD_EXTMOD))
>

Yep, it looks good.

BTW, I found another interesting thing.

     make M=3Ddir////=20

is also a valid target in kbuild.

Even this is a very rare case, I plan to use this to handle it.

KBUILD_EXTMOD :=3D $(subst $(CURDIR)/,,$(KBUILD_EXTMOD))

This also works for an out tree build.

I would send out v2 soon, hope you like this.

>
>--=20
>Best Regards
>Masahiro Yamada

--=20
Wei Yang
Help you, Help me

--82I3+IH0IqGh5yIs
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYxTdTAAoJEKcLNpZP5cTdcZ0P+wcvKjut/hP1AKVP7JCWpok+
NQca7i4EkSt8446k7cHS7El7ebKFikyDt1LozQ58SFF25PH5H+uM/SOFIy7zm/H2
qf7ectrlel/9mCwMYjY1UVp9KGPP/abIXpkWBLofq1Urng9YfNtEZ/TOvN97vQyw
YtoH2kE8GhLJamCa1TweH/3vMauveGbXKf0zbohjA8qeNf+1R4soGANSS41s2qiF
oOxPW727erR9QZyWoN94uYvTa6fFKdynO7WmCwEC75nTj54S+mRf/si8jSeBpgIT
3wxnB7wfoANKbTgzlvBL+wGPEOtAMuHqXLuqEt3KN28HuX/p4PtTWVQUx25DaLQ3
Ox85LwdeEcTNiU0uqi3yPP4eIhNbHHrqs6hilNkknPQlsxLKqJf/cJDuNEY5HXsW
Ct9smxoUVaZu/xXbGBU6wO93YuQsnfuKBRlucYn1akQjOXyXgaGIXG+VpXcl+tlw
01oKvtNhUeRvWzvarsppyEHl6Ax7DVA0W4nOKXV8kjavsb7B/YuVxUHGpsCMtyOi
hOV8rMl4b2MIgnXrg8hTYoVdCV2E5ll2Vha0L2Hy+D/rwnmV5XWMfjAbREnYW5xC
Z5ewPomJGuCBpUOAafzplXHSOiADlaonNVlw7GQ77iFbZGi2KTnQTD4etGdwj9wM
ye4NghXpDGiAEf6pktaq
=iS2Q
-----END PGP SIGNATURE-----

--82I3+IH0IqGh5yIs--
