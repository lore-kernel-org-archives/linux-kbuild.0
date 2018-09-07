Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:33686 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1726237AbeIHCsd (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 7 Sep 2018 22:48:33 -0400
Subject: Re: [RFC PATCH 0/3] kbuild: support syncing .config non-interactively
 and record ARCH in spec file
References: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
From: Jeff Mahoney <jeffm@suse.com>
Message-ID: <130981b1-436c-d3e3-d22b-c1cd8cba374c@suse.com>
Date: Fri, 7 Sep 2018 18:05:23 -0400
MIME-Version: 1.0
In-Reply-To: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="4h8woEc4Tu8MoRajYynmXFCksSXXoY89k"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>, Javier Martinez Canillas <javierm@redhat.com>, Laura Abbott <labbott@redhat.com>, Jiri Kosina <jkosina@suse.cz>, Ben Hutchings <ben.hutchings@codethink.co.uk>, =?UTF-8?B?TWljaGFsIFN1Y2jvv73vv73vv71uZWs=?= <msuchanek@suse.de>, Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--4h8woEc4Tu8MoRajYynmXFCksSXXoY89k
Content-Type: multipart/mixed; boundary="7D1l3XnUHvhPuSEN52aaqgGqHVU9MDQZ9";
 protected-headers="v1"
From: Jeff Mahoney <jeffm@suse.com>
To: Masahiro Yamada <yamada.masahiro@socionext.com>,
 linux-kbuild@vger.kernel.org
Cc: Sam Ravnborg <sam@ravnborg.org>,
 Javier Martinez Canillas <javierm@redhat.com>,
 Laura Abbott <labbott@redhat.com>, Jiri Kosina <jkosina@suse.cz>,
 Ben Hutchings <ben.hutchings@codethink.co.uk>,
 =?UTF-8?B?TWljaGFsIFN1Y2jvv73vv73vv71uZWs=?= <msuchanek@suse.de>,
 Takashi Iwai <tiwai@suse.de>, linux-doc@vger.kernel.org,
 linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Michal Marek <michal.lkml@markovi.net>
Message-ID: <130981b1-436c-d3e3-d22b-c1cd8cba374c@suse.com>
Subject: Re: [RFC PATCH 0/3] kbuild: support syncing .config non-interactively
 and record ARCH in spec file
References: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>
In-Reply-To: <1535968916-9159-1-git-send-email-yamada.masahiro@socionext.com>

--7D1l3XnUHvhPuSEN52aaqgGqHVU9MDQZ9
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

On 9/3/18 6:01 AM, Masahiro Yamada wrote:
> This work was prompted by the criticism about the recent Kconfig change=
:
> https://lkml.org/lkml/2018/6/27/254
>=20
> I may not fully understand his concern, though.

I don't think you do.

Here's the use case for us and, I expect, most distro kernel maintainers
out there.  We build kernels on 8 architectures, with 3 or more configs
for each architecture.  Each product release uses a different build
environment.  Between SLE and openSUSE we have 6 build environments at
the moment.  Our update process for configs is to run a script that adds
the change to every affected config and then run a script that does a
'make oldconfig' on every architecture/config combination to sync them
up and ensure options that may have been enabled by the change are
synced up.  Those changes are also automatically propagated to other
configs.  The config updates can be done on pretty much any linux system
capable of building a kernel.  This is a process that has worked for us
for at least 15 years.  It doesn't now with the GCC_VERSION changes.
Today, I went to do a simple config change: disable an option on every
arch/config combination for a single branch (that wasn't the one that
matched the build environment of the running system) and instead of it
running more or less silently as it has for years, it wanted to change
all the compiler options.  Of course, those changes shouldn't be pushed
to the repository because they'll be wrong for the build environment.
In this simple example it was easy to just modify the option in-place,
but it would've been painful if I was enabling an option that guarded
other new options instead.

Lastly, we fail our builds if there are unresolved config options.  A
build that silently ignored them and accepted defaults isn't something
we'd use.  Otherwise, we could start our builds with yes '' | make
oldconfig and be done with it.

Requiring the config to be generated using the same environment that
will ultimately build the kernel is a huge usability regression for us
and, I would assume, others.

-Jeff
--=20
Jeff Mahoney
SUSE Labs



--7D1l3XnUHvhPuSEN52aaqgGqHVU9MDQZ9--

--4h8woEc4Tu8MoRajYynmXFCksSXXoY89k
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEE8wzgbmZ74SnKPwtDHntLYyF55bIFAluS9iMACgkQHntLYyF5
5bKU1A//RDi1hqWJ+0cqtWsJhWYxz2UV1tKAQWy/O5lMHfzuoVF7Su75+nAJuZSn
E+qRRGpBIs94reX716zt+9eKEsOAH2DZ0bvGEuL+/TdnBuqMxT3BehFVHEXdW6pt
wwirNm5L0wX9jPC0XXOxBr9z+wCw4uAizNTaqcQD/6BPOSIEKtlxTctnOip5F7BP
OECzZj854Aiu48uRU84aLFrSYKcDbfA8yzDRHcdb31SBzhtYxYMs/+AwXqlJQTrj
PTdB4LeZcnx/Y/8TR0t8j8wYsPYjHcx+u2k78mkn+zNN17sCFiHE9h6hHtVQIf6Q
XoTEPWUOXOccekz/u4+7x6BgJRznNIBkd5FryeRrriALHKfAK0Lw9ROxItRlZdYC
EZ3xwGFyr7mlr+dov6++4rj1kqwxfdzO+mUfGsD6G6DO3GojA0HciKT831cVJpE3
pOExlQOWFwtMGzOG9W3Im0g6jxGG68acpjuZme8E8uFh7nnxwE6ZjoM6ND18m4vo
YOKP9nkPX7xT0nPksPouFpQ6zPcjzwlIxJ9iUWy+rle4iPeHHCd+DmyJpnb+z4Pg
iGMAxV5Ml/i+rRfL9CV37crM0grRJUH3MPVhgIIUZJHpz5B3GbFAtPmUORAr6lOR
JCXsqb+2b5VNcQc+r7Zt6aTsYLcA3Fgj49GW3YMoLVOm6tezo78=
=rG0d
-----END PGP SIGNATURE-----

--4h8woEc4Tu8MoRajYynmXFCksSXXoY89k--
