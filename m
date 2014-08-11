Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.gentoo.org ([140.211.166.183]:50034 "EHLO smtp.gentoo.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754319AbaHKSEs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 11 Aug 2014 14:04:48 -0400
Message-ID: <53E905BC.7040508@gentoo.org>
Date: Mon, 11 Aug 2014 20:04:44 +0200
From: justin <jlec@gentoo.org>
MIME-Version: 1.0
Subject: Re: [RFC] [PATCH] pkg-config default search pathes
References: <cover.1407766447.git.silvio.fricke@gmail.com>	<53E8FC07.1090609@gentoo.org> <CAHUN2TFXiV6o8SnW3TUBg6sVFDFUfQDKS5VhkPJfSJr=wfmKfQ@mail.gmail.com>
In-Reply-To: <CAHUN2TFXiV6o8SnW3TUBg6sVFDFUfQDKS5VhkPJfSJr=wfmKfQ@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="DgNsq27uFwDc29d7q43CThvrsru61kT52"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Silvio Fricke <silvio.fricke@gmail.com>
Cc: "Yann E . MORIN" <yann.morin.1998@free.fr>, linux-kbuild@vger.kernel.org

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--DgNsq27uFwDc29d7q43CThvrsru61kT52
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

On 11/08/14 19:41, Silvio Fricke wrote:
> Hi Justin,
>=20
>=20
> 2014-08-11 19:23 GMT+02:00 justin <jlec@gentoo.org>:
>>
>> On 11/08/14 16:22, Silvio Fricke wrote:
>>> please review this patch.
>>> I'm a little bit unsure if this patch is technicaly state-of-the-art =
because
>>> kbuild does it right. The problem is that some cross-toolchains (on m=
y box is
>>> yocto installed) change the pkg-config search pathes to do some packa=
ge-config
>>> setups for cross compiling.
>>> But the init of the toolchain manipulates PKG_CONFIG_SYSROOT_DIR and
>>> PKG_CONFIG_PATH variables that a pkg-config call searches in the wron=
g place to
>>> find the package and gives back the wrong values which we use to test=
 the
>>> availability of ncurses installation and this break the [x,g,menu]con=
fig.
>>>
>>> Some recommendations for this?
>>
>> What would happen in a real crosscompile case?
>=20
>=20
> In a real crosscompile case we don't have a "crosscompile" [x,g,menu]co=
nfig.
> This step is ever made with the host-toolchain. Or I miss something her=
e?
>=20

You are right, no need for using crosscompile to configure the kernel.
Looks good to me.

Justin



--DgNsq27uFwDc29d7q43CThvrsru61kT52
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJT6QW8XxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXQyQ0JDQjFGMzBDQ0UxMjFGNENDNDgxMDdC
OUQ0RjIzMUJEMTU1OEFCAAoJELnU8jG9FVirkfwP/i/UGMw4p2RBuKaOJGU7clon
+8J0INc3LYNMiWTCzvr0v2JymlAyXIyXLduSU6V8+ExI2DgYRqKih9j3rAN6TFc6
MbTWkCIGveYVfevCC+87ST9jwNJs3aV4Borhj/5920vNQ3D/KaQgfgIfaWi1pBVI
R8loCNvz+CTY6upvOJVzSuKK43AoFfa1kFyrSEcCLufD1bJAeoSa3iVxPPkuZBHA
zzyAHXo1KgB+87sxg05igc8dv6qJMlwzoJR8RpC8fG36MTPyee+sVjrkYnFycrh1
IM5XXkNOEc5jhcxH0X6csJLl7rqgswB2im+0MMgEjqot7qDtUX67YHP2m7Jejwfa
+5j3KT+6cZYzvER/4H75qOXiG/KjoY1XUjAx2z6sfkvfU/YbQE9DcWmyx8v4IBV0
q0RfLfy0Sd4VoOwKpyiASWkMLbJp+ucmaJrpgBa1qm2nKEDecCi4fWfNc+rZ6Ybo
/g3I3xkig9rGDTO6CSZMm5vuxSZJfPkAho82UC6nXjlzs11cCudAmB5SDnsw0bP2
Uj9tYPrhrq/r0ZKQ64pqMPCQmRYypa7cIlUba5naomo+sbgcvYGfMEGRDl6sqG/l
uFRK/PwUUDSxZBLOwnC2iQMxDHmSZ/NymVUCsrZETaHY03lPDH9mlb1G/cTl2HY/
hi5DYh2fHLdIRoe/IatT
=tDg+
-----END PGP SIGNATURE-----

--DgNsq27uFwDc29d7q43CThvrsru61kT52--
