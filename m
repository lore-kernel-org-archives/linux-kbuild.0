Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.gmx.net ([212.227.17.22]:64094 "EHLO mout.gmx.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754080AbdERBMm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2017 21:12:42 -0400
From: Kamil Rytarowski <n54@gmx.com>
Subject: Re: [RESEND][PATCH v2] Fix ctype(3) usage in the kconfig code on
 NetBSD
References: <35570f77-5439-2760-a098-7aa4a60aad03@gmx.com>
 <20170517133353.2644-1-n54@gmx.com>
 <20170517142410.f3eae6733cad60fc06a21bd3@linux-foundation.org>
Message-ID: <278ece24-15c7-afa3-13d9-0cdeb528fd74@gmx.com>
Date: Thu, 18 May 2017 03:03:53 +0200
MIME-Version: 1.0
In-Reply-To: <20170517142410.f3eae6733cad60fc06a21bd3@linux-foundation.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="E9a9E2cPDaTFjNvkJTEF8cNFW1VfIaoxf"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: rdunlap@infradead.org, linux-kbuild@vger.kernel.org, yann.morin.1998@free.fr, yamada.masahiro@socionext.com, richard@nod.at

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--E9a9E2cPDaTFjNvkJTEF8cNFW1VfIaoxf
Content-Type: multipart/mixed; boundary="0sEAb53C5pPscUweMm8C0KcDSVNIavRDw";
 protected-headers="v1"
From: Kamil Rytarowski <n54@gmx.com>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: rdunlap@infradead.org, linux-kbuild@vger.kernel.org,
 yann.morin.1998@free.fr, yamada.masahiro@socionext.com, richard@nod.at
Message-ID: <278ece24-15c7-afa3-13d9-0cdeb528fd74@gmx.com>
Subject: Re: [RESEND][PATCH v2] Fix ctype(3) usage in the kconfig code on
 NetBSD
References: <35570f77-5439-2760-a098-7aa4a60aad03@gmx.com>
 <20170517133353.2644-1-n54@gmx.com>
 <20170517142410.f3eae6733cad60fc06a21bd3@linux-foundation.org>
In-Reply-To: <20170517142410.f3eae6733cad60fc06a21bd3@linux-foundation.org>

--0sEAb53C5pPscUweMm8C0KcDSVNIavRDw
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 17.05.2017 23:24, Andrew Morton wrote:
> On Wed, 17 May 2017 15:33:53 +0200 Kamil Rytarowski <n54@gmx.com> wrote=
:
>=20
>> The current code produces set of warnings on NetBSD-7.99.25 (GCC 4.8.5=
):
>>
>> In file included from scripts/kconfig/zconf.tab.c:2576:0:
>> scripts/kconfig/confdata.c: In function 'conf_expand_value':
>> scripts/kconfig/confdata.c:97:3:
>> warning: array subscript has type 'char' [-Wchar-subscripts]
>>    while (isalnum(*src) || *src =3D=3D '_')
>>    ^
>> scripts/kconfig/confdata.c: In function 'conf_set_sym_val':
>> scripts/kconfig/confdata.c:155:4:
>> warning: array subscript has type 'char' [-Wchar-subscripts]
>>     for (p2 =3D p; *p2 && !isspace(*p2); p2++)
>>     ^
>> scripts/kconfig/confdata.c: In function 'tristate_print_symbol':
>> scripts/kconfig/confdata.c:617:3:
>> warning: array subscript has type 'char' [-Wchar-subscripts]
>>    fprintf(fp, "%s%s=3D%c\n", CONFIG_, sym->name, (char)toupper(*value=
));
>>    ^
>>
>> Fix this portability issue by explicit casting to unsigned char.
>>
>> ...
>>
>>  scripts/basic/fixdep.c               |  2 +-
>>  scripts/kconfig/conf.c               |  6 +++---
>>  scripts/kconfig/confdata.c           |  9 +++++----
>>  scripts/kconfig/expr.c               |  3 ++-
>>  scripts/kconfig/lxdialog/checklist.c |  3 ++-
>>  scripts/kconfig/lxdialog/inputbox.c  |  3 ++-
>>  scripts/kconfig/lxdialog/menubox.c   | 11 +++++++----
>>  scripts/kconfig/lxdialog/util.c      |  5 +++--
>>  scripts/kconfig/menu.c               |  4 ++--
>>  scripts/kconfig/nconf.c              |  3 ++-
>>  scripts/kconfig/nconf.gui.c          |  3 ++-
>>  scripts/kconfig/symbol.c             |  8 ++++----
>>  12 files changed, 35 insertions(+), 25 deletions(-)
>=20
> This patch is irritating :(  The Linux manpage says
>=20
> "These functions check whether c, which must have the value of an
> unsigned char or EOF..."
>=20
> so it's legit enough.
>=20
> Apart from being ugly, it isn't very maintainable: people on Linux
> systems will add new instances while not including the typecasts.
>=20

I proposed this casting as it's a common idiom in portable software
using ctype(3) in C.

Examples in GNU software (I used "grep -r 'unsigned char'" and randomly
picked some sequential lines):

gpl2/gmake/dist/glob/fnmatch.c:             if ((STREQ (str, "alnum") &&
ISALNUM ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "alpha")
&& ISALPHA ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "blank")
&& ISBLANK ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "cntrl")
&& ISCNTRL ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "digit")
&& ISDIGIT ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "graph")
&& ISGRAPH ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "lower")
&& ISLOWER ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "print")
&& ISPRINT ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "punct")
&& ISPUNCT ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "space")
&& ISSPACE ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str, "upper")
&& ISUPPER ((unsigned char) *n))
gpl2/gmake/dist/glob/fnmatch.c:                 || (STREQ (str,
"xdigit") && ISXDIGIT ((unsigned char) *n)))

gpl2/groff/dist/src/libs/libgroff/strtol.c:  while (ISASCII((unsigned
char)*str) && isspace((unsigned char)*str))
gpl2/groff/dist/src/libs/libgroff/strtol.c:  p =3D strchr(digits,
(ISASCII((unsigned char)*str)
gpl2/groff/dist/src/libs/libgroff/strtol.c:                   &&
isupper((unsigned char)*str)
gpl2/groff/dist/src/libs/libgroff/strtol.c:                   ?
tolower((unsigned char)*str)

gpl2/gettext/dist/gettext-runtime/intl/l10nflist.c:     if (isalpha
((unsigned char) codeset[cnt]))
gpl2/gettext/dist/gettext-runtime/intl/l10nflist.c:       *wp++ =3D
tolower ((unsigned char) codeset[cnt]);
gpl2/gettext/dist/gettext-runtime/intl/l10nflist.c:     else if (isdigit
((unsigned char) codeset[cnt]))
gpl2/gettext/dist/gettext-runtime/intl/localealias.c:      while
(isspace ((unsigned char) cp[0]))
gpl2/gettext/dist/gettext-runtime/intl/localealias.c:     while (cp[0]
!=3D '\0' && !isspace ((unsigned char) cp[0]))
gpl2/gettext/dist/gettext-runtime/intl/localealias.c:     while (isspace
((unsigned char) cp[0]))

I also noted it already in the Linux kernel related software (the one I
got under hand to grep):

gpl2/dtc/dist/dtc-lexer.l:                      while
(!isdigit((unsigned char)*line))
gpl2/dtc/dist/dtc-lexer.l:                      while
(!isspace((unsigned char)*tmp))


I put aside discussion about prettiness of C.

> I wonder if there's anothing we can do in the Makefiles to suppress
> that warning in scripts/ for netbsd systems?  ie, disable
> -Wchar-subscripts in that case?
>=20

This is another option, to hide warnings.

As of now "menuconfig" does not crash, however I haven't tested it on
signed vs unsigned char type platforms. LIBC implementations on Linux
are generally more tolerant to passing values out of valid range and
hide bugs, that sometimes crash with our native LIBC... and from time to
time some people try to "fix" our compliant implementation:

http://gnats.netbsd.org/34632 "isalpha() and possibly other ctype
functions segfault"


--0sEAb53C5pPscUweMm8C0KcDSVNIavRDw--

--E9a9E2cPDaTFjNvkJTEF8cNFW1VfIaoxf
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJZHPMCAAoJEEuzCOmwLnZsUoQP/3B7+g2WkLXUyEBTI2xLCOwX
k4xbim0T/trYJg90SqVShKyE+MG77oTcGLJVrvFUw7HmzCNyjoSHTNV7IlBhvqrE
6X9T7XwczILNuehAKfDJOMCMnS5b7F8127DffRO8NuXt83Mcl9UsNxJYd/FuCPbE
gor2kqnbz+gXHPJPGGzTZ2BXI2qb0JK0bR4HZp0yvcHBXtHof3RCASYPT9X+H0co
nMQ3P/HYnLTf7LnCruRkeQNFVlXQYHwBBTsep7rJFGqBVWJdUQ5pAFErekuHuQT/
hQTF06LTYEJdgGmd82sJWkC4yFYNOD3TMsmpy1emsugBxQ8+4BLHheeHXKj9f7VA
+LplQ2Mlq0QmhS9T33ZsVcBTSnakzHKYpSNccAkVo2ZFbw8EHisK7EEXw4/uam+8
6HuX/2+IXn2oe6H+Y5/JKWxVAQ8prlN/pYARcwxmjXlM4vak/pUuZvgN9KdgX2bn
YkiWZ1/r81STwI8MdA1/UGv0bTEwpdPrX4kUYu6NAXx8o9Tf1uGeFsY2mI0Qa20x
sk3f1v2nhFNa2hIVK6FR43HU/pzoHjHfsEl2ZZKM8N2vusGyV1piWNh/mSy/7WSK
v+LA2pOQ1XtqwBARgYJvbwQmFjb8gNLJ9KiPHKr1+Qoos/yQ3arz4fnrUmg2rdLd
YWUcmR8y0k0kgkXY2WTM
=H2sw
-----END PGP SIGNATURE-----

--E9a9E2cPDaTFjNvkJTEF8cNFW1VfIaoxf--
