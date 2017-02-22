Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:32808 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932368AbdBVOU1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 22 Feb 2017 09:20:27 -0500
Date: Wed, 22 Feb 2017 22:20:21 +0800
From: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH V2] kbuild: add %/built-in.o target in top Makefile
Message-ID: <20170222142021.GA82048@WeideMacBook-Pro.local>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
 <1478470712-9872-1-git-send-email-richard.weiyang@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="AqsLC8rIMeq19msA"
Content-Disposition: inline
In-Reply-To: <1478470712-9872-1-git-send-email-richard.weiyang@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wei Yang <richard.weiyang@gmail.com>
Cc: mmarek@suse.com, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--AqsLC8rIMeq19msA
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi, haven't get any feedback for a looong time.

Someone would like this change ? :-)

On Sun, Nov 06, 2016 at 10:18:32PM +0000, Wei Yang wrote:
>Current kbuild just supports building built-in.o in second directory level
>individually. There is no rule to build those built-in.o targets below
>third directory level.
>
>Even current kbuild system could achieve this with rule "%/", while this
>not only builds built-in targes but also lib target, extra target and
>module objects.
>
>This patch adds the "%/built-in.o" rule so that each built-in.o in the
>kernel tree could be the build target, which looks more consistent for the
>kbuild system.
>
>Signed-off-by: Wei Yang <richard.weiyang@gmail.com>
>
>---
>v2
>    . add FORCE in prerequest
>
>---
> Makefile | 2 ++
> 1 file changed, 2 insertions(+)
>
>diff --git a/Makefile b/Makefile
>index f97f786..9c65498 100644
>--- a/Makefile
>+++ b/Makefile
>@@ -1638,6 +1638,8 @@ endif
> 	$(Q)$(MAKE) $(build)=3D$(build-dir) $(target-dir)$(notdir $@)
> %.symtypes: %.c prepare scripts FORCE
> 	$(Q)$(MAKE) $(build)=3D$(build-dir) $(target-dir)$(notdir $@)
>+%/built-in.o: prepare scripts FORCE
>+	$(Q)$(MAKE) $(build)=3D$(build-dir) $(target-dir)$(notdir $@)
>=20
> # Modules
> /: prepare scripts FORCE
>--=20
>2.5.0

--=20
Wei Yang
Help you, Help me

--AqsLC8rIMeq19msA
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQIcBAEBCAAGBQJYrZ4lAAoJEKcLNpZP5cTdNmEP/22OxdIOhdvLNnDWLJx84wJ5
EPUBVnHg2DPy7G7dIfr6nrfJYM0jVAPQDNGwzvWWV7mptandv62FrZT9pDuy1eCy
/pCYr5jn6L6XcJsKodQoh+/f/NLuRHXywIAO1W1tO1ssf959q6qCPT/aqY2baZD7
z+dwactFjj/HTS4maRkLiY/19Pk9NbwfWao5UqbT+WGFoWkHA9oP0OibdEKneddV
rXZtY9QgEodcOv0Y/X8H9GTrPWZC9vgZZYCtCljGUI7U1MPu5kAXQ9rS0yFfPHVk
GQtoHWze8TzUHTlZE4MMMC2grZe6fCXNIh4HQL6j0jYaweOHH0C+v1ovqSBrWeFJ
5i1dDgLdnMoLb60d8BmKxXIL5ZkdJF9srjPqBAyQySK4veI1AxPH3u9Qcl0lHfSS
6ghQQQNVlu7gqU1wahEg2PH6ygEhG5HodFc+UJnx5IsBEMy7B/UTbleOOP0RnqxQ
bOhLBrfTK3A3a/Ao0et3q4La5YFNqWebnApMHByJO5vjzW0H+H8KGJFq3AwGoKFE
6OAU+l9wpxTJMfVYMMol4YP7m2e3v1Gg3yOs9E9ChGD2Wtzs+B4Qv5x2U4P02sAW
AMOE3s0v/uzuhDrADdbd9pjoOHtftYVxdSYKna9fgLLEWMIU9PQaTVfn9dhz4Zb8
C/K1cMl8jyYt7YOiMFdq
=g/op
-----END PGP SIGNATURE-----

--AqsLC8rIMeq19msA--
