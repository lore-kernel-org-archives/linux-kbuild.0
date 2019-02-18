Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from shadbolt.e.decadent.org.uk ([88.96.1.126]:42214 "EHLO
        shadbolt.e.decadent.org.uk" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S2391567AbfBRRyL (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 18 Feb 2019 12:54:11 -0500
Message-ID: <ab49b0582ef12b14b1a68877263b81813e2492a2.camel@decadent.org.uk>
Subject: Re: [PATCH v2] deb-pkg: generate correct build dependencies
From: Ben Hutchings <ben@decadent.org.uk>
Date: Mon, 18 Feb 2019 17:54:04 +0000
In-Reply-To: <CAK7LNASiyMiCB2Ko0_aWOhB_3t6FEVhQ1xpnn-NQ=yV0X11SMg@mail.gmail.com>
References: <20190102092304.27262-1-riku.voipio@linaro.org>
         <CAK7LNARFAth+L_b7i4aR4mPtVTSfDgq2zvvMJah4WR0s97Ny2A@mail.gmail.com>
         <CAK7LNASOqwrJqHLDKwT4xRU6jrFchavvWFjxqcPd_ZSmiEtsQQ@mail.gmail.com>
         <CAK7LNASiyMiCB2Ko0_aWOhB_3t6FEVhQ1xpnn-NQ=yV0X11SMg@mail.gmail.com>
Content-Type: multipart/signed; micalg="pgp-sha512";
        protocol="application/pgp-signature"; boundary="=-QoJvm68+ISfU7vMMtbo7"
MIME-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>, Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>, debian-kernel <debian-kernel@lists.debian.org>


--=-QoJvm68+ISfU7vMMtbo7
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, 2019-02-19 at 02:05 +0900, Masahiro Yamada wrote:
[...]
> "make allnoconfig; make bindeb-pkg"
> failed on Ubuntu 16.04, but succeeded on Ubuntu 18.04
>=20
> I am puzzled...
[...]
> dpkg-buildpackage: host architecture i386
>  dpkg-source --before-build linux
> dpkg-checkbuilddeps: error: Unmet build dependencies: flex
> dpkg-buildpackage: warning: build dependencies/conflicts unsatisfied; abo=
rting
> dpkg-buildpackage: warning: (Use -d flag to override.)
> scripts/package/Makefile:78: recipe for target 'bindeb-pkg' failed
> make[1]: *** [bindeb-pkg] Error 3
> Makefile:1390: recipe for target 'bindeb-pkg' failed
> make: *** [bindeb-pkg] Error 2
>=20
>=20
> The docker file I used is below.
>=20
> If I change "FROM ubuntu:16.04" to "FROM ubuntu:18.04",
> it goes well.
[...]

For a cross-build, some build-dependencies may need to belong to the
host architecture (what the package will run on) while others do not.=20
In general, they must do one of:

(a) Belong to the host architecture
(b) Belong to any architecture, and include "Multi-Arch: foreign" in
    their own metadata
(c) Belong to an architecture specified in the Build-Depends field

We normally want (b) for tools like flex.  But flex is (I assume)
missing the Multi-Arch field in Ubuntu 16.04, as it used to in Debian.

The way we dealt with this in Debian before flex was fixed was (c): use
"flex:native".  But for reasons I don't understand that *isn't*
compatible with (b), so to be compatible with both old and new versions
of flex you should build-depend on:

   flex | flex:native

Ben.

--=20
Ben Hutchings
The obvious mathematical breakthrough [to break modern encryption]
would be development of an easy way to factor large prime numbers.
                                                           - Bill Gates



--=-QoJvm68+ISfU7vMMtbo7
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEErCspvTSmr92z9o8157/I7JWGEQkFAlxq8TwACgkQ57/I7JWG
EQkaKQ/+MzR1EJWAVoi2fJdWRPlz+/CJVUmcBjZvQa/bM4P0UnXPuH40Cgbqe9CQ
A0y8RreFqjafspo6OAhPN17x+XQGwjgawtaLkoNhEWp7xYbA1ZOlxVX+4t2hnAQM
oVdzcNC7GlnAUJPZf4ctqJDAoUrgWrU4PUJgAojNSP69cQVNo6epFIg+1f9JZcEw
ivACPJzb4qx2rLqI9qv9NnThooPSD+J9Pyhu4bqDbTHQ4S0wqczdCDSc/7bSd1h2
h1VNqff+pp1j9Mc8ybreLv2Nj58X4u2hKnVGRn5JNcvxjEDxRI5SEPFTscTsdoZa
Js+GN62XpiaKzdosj89cRydD0k6Yp9MuIoimsiqeuJ4Y4A2mGOMN+RQu7T5BNCeO
KbtjVAOZSFJ+JhgX3mdFbhkmPVNaoGNqLbSgrczIb1wiWMg1xpBzSxUrvOY0dgKv
SNhFlMOv6iy4bj9up3VjKiJUlbW47zGWoY4iOCX/8OTXArL9J4xbrb51bJrkmBun
qgvgSacBQyCT5J9ShoSE5LKLEzPPinGmepJeQW7iS1JvHsxYJou8sJECleU24dqp
7fdEUHHvgzJM0uVh/VDT1WPjnZPn2Vc3ayX4kmH4/eLJcPg15k9D8qgwMhqpCbBL
C3DH7uad179SHdNYpArT1AJFCGdkZZbLLbkIleciPNmU+peutkY=
=oW7I
-----END PGP SIGNATURE-----

--=-QoJvm68+ISfU7vMMtbo7--
