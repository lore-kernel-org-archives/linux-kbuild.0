Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:32572 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752145AbdCNPsE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 14 Mar 2017 11:48:04 -0400
Message-Id: <75cdc7$20652e@orsmga004.jf.intel.com>
Date: Tue, 14 Mar 2017 08:47:50 -0700
From: Joe Konno <joe.konno@linux.intel.com>
Subject: Re: [PATCH] scripts: package: KDEB_SOURCENAME in .deb names
In-Reply-To: <CAAqcGHntEudc=q4au_ewtaQuZLNs-0Z8OVcy5kzHq7OsqPo7Mg@mail.gmail.com>
References: <1489443666-29808-1-git-send-email-joe.konno@linux.intel.com>
        <CAAqcGHntEudc=q4au_ewtaQuZLNs-0Z8OVcy5kzHq7OsqPo7Mg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/A/x=E/BPNc1=Eg0.QGnJWJD"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

--Sig_/A/x=E/BPNc1=Eg0.QGnJWJD
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 14 Mar 2017 10:49:55 +0200
Riku Voipio <riku.voipio@linaro.org> wrote:

> On 14 March 2017 at 00:21, Joe Konno <joe.konno@linux.intel.com>
> wrote:
> > From: Joe Konno <joe.konno@intel.com>
> >
> > Currently, the KDEB_SOURCENAME make variable only controls the name
> > of the packaged source tarball, and does not impact the .deb
> > package names output by bindeb-pkg and deb-pkg. Presently, these
> > files are more rigidly named, as the user may only control the
> > names of .deb outputs by setting KDEB_PKGVERSION in their
> > environment.
> >
> > This patch modifies the builddeb script to use KDEB_SOURCENAME when
> > naming the image, firmware-image, headers, and libc-dev .deb output
> > files. This would allow folks who build-- for instance-- mainline,
> > stable, and next kernel packages more control over how their .deb
> > outputs are named.
> >
> > This patch also changes the default value of KDEB_SOURCENAME so as
> > not to change default .deb output file names. However, this does
> > have the side effect of renaming the source tarball generated
> > for .deb source packages.
> >
> > For example:
> >   $ KDEB_SOURCENAME=3D"linux-mainline" make bindeb-pkg
> >
> > Would output .deb files that begin with
> >   ../linux-mainline-{image,firmware-image,headers,libc-dev} =20
>=20
> I'm not sure this a really useful. Next, mainline, stable etc are all
> different versions of linux, so version seems the correct place to
> describe them?

Thanks for the feedback. You make a good point.

I took this approach for the following problem as well (which I did
not mention in my initial submission, silly me):

  - Build and package the same kernel commit, but with different kernel
    configurations

If I were building and packaging different kernel commits on the same
tree, I could live without my patch. The bulleted edge case, and my
original commit message's case, do something interesting for target
installations. With some KDEB_PKGVERSION finesse, I could make multiple
versions of 'linux-configA-image' and 'linux-configB-image' available
to the target. At least for my usage, this patch can be useful.

Granted, LOCALVERSION hacking could accomplish the same thing. Maybe
it's the pedant in me, but "4.11.0-rc2$LOCALVERSION" seems ideal for
describing a named package, be it 'linux-image', 'linux-configA-image',
or '$KDEB_SOURCENAME-image'.

>=20
> > Signed-off-by: Joe Konno <joe.konno@intel.com>
> > ---
> >  scripts/package/Makefile | 2 +-
> >  scripts/package/builddeb | 8 ++++----
> >  2 files changed, 5 insertions(+), 5 deletions(-)
> >
> > diff --git a/scripts/package/Makefile b/scripts/package/Makefile
> > index 71b4a8af9d4d..e4280da03991 100644
> > --- a/scripts/package/Makefile
> > +++ b/scripts/package/Makefile
> > @@ -23,7 +23,7 @@
> >
> >  # Remove hyphens since they have special meaning in RPM filenames
> >  KERNELPATH :=3D kernel-$(subst -,_,$(KERNELRELEASE))
> > -KDEB_SOURCENAME ?=3D linux-$(KERNELRELEASE)
> > +KDEB_SOURCENAME ?=3D linux
> >  export KDEB_SOURCENAME
> >  # Include only those top-level files that are needed by make, plus
> > the GPL copy TAR_CONTENT :=3D $(KBUILD_ALLDIRS) .config .scmversion
> > Makefile \ diff --git a/scripts/package/builddeb
> > b/scripts/package/builddeb index 3c575cd07888..50caa143fb13 100755
> > --- a/scripts/package/builddeb
> > +++ b/scripts/package/builddeb
> > @@ -96,10 +96,10 @@ fwdir=3D"$objtree/debian/fwtmp"
> >  kernel_headers_dir=3D"$objtree/debian/hdrtmp"
> >  libc_headers_dir=3D"$objtree/debian/headertmp"
> >  dbg_dir=3D"$objtree/debian/dbgtmp"
> > -packagename=3Dlinux-image-$version
> > -fwpackagename=3Dlinux-firmware-image-$version
> > -kernel_headers_packagename=3Dlinux-headers-$version
> > -libc_headers_packagename=3Dlinux-libc-dev
> > +packagename=3D${sourcename}-image-$version
> > +fwpackagename=3D${sourcename}-firmware-image-$version
> > +kernel_headers_packagename=3D${sourcename}-headers-$version
> > +libc_headers_packagename=3D${sourcename}-libc-dev =20
>=20
> The style here is to use variables without curly braces unless really
> needed.

I noted the prevailing style initially, but I took the (overly)
cautious route for submission. Thanks for the note-- no more curly
braces when expanding shell variables.

>=20
> >  dbg_packagename=3D$packagename-dbg
> >  debarch=3D
> >  forcearch=3D
> > --
> > 2.7.4
> >
> > --
> > To unsubscribe from this list: send the line "unsubscribe
> > linux-kbuild" in the body of a message to majordomo@vger.kernel.org
> > More majordomo info at  http://vger.kernel.org/majordomo-info.html =20
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-kbuild" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--Sig_/A/x=E/BPNc1=Eg0.QGnJWJD
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkQ//qyfF7ERwiWhKjYhH1S9KqmYFAljIEKYACgkQjYhH1S9K
qma85A/9HMxtj+qBNDlwp+dxRgwE2YK8pIcCDJuZWFl6g0tMkuoN91/xPaOIqT4p
cygyxncHcw4/smJStVsD5c9hKwe3M/oZIOPUcLv2p+bcb315egE/yrbcjTs99tEY
tQJSvJQnPAnluEjXtZzQNfnfAhGmOQ2Xw40Zl1FwRd8uzKgEswyGaOxzt6GLQAvB
Nw87ATs747LdPZnX9ZIx9JCrs4fU2g4KPmn35JRC2aatab3ov+FRA1aolRczCFk+
sc9SbqnyC2YWGBImTOX6Ty0HhTZJcfg08kOfG4zUO+YH6DQeWDsWHWld/pIOCIqX
rf7wU6dF1XrgzcV7S2eGtB1LVdia1CdGtxjmA9GY3zr76EWELdQo3NuOvIJc6zSN
gjXtOMRcscoeB8TS7mexAfQJPnYWWHXqZvQFXaR7oX3TK+jBLUbCO21VznbLnLSj
QcapeBgg92nZKyY1xYhjhfr2Nv9iN0j478a5fi1NzCJC9by8j4SyBYhz/6Tj7/Bh
+RrBQVfv3rbKoMDN2DIZvfA+S9eBajZbX6UpAcn7bW3Ubc+OGHqMf0HPt2nAvl8b
pD9VZqXT31DH0yGwerdaJImS12uW851i5CibuIiLC6y4eqcwtzszq2U3gF6QaH38
YVVVV9OxHkJxe4uOpf/MutcNoKd4/NhQ3wziBPLlySbG80URDEI=
=L9Ns
-----END PGP SIGNATURE-----

--Sig_/A/x=E/BPNc1=Eg0.QGnJWJD--
