Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga02.intel.com ([134.134.136.20]:57500 "EHLO mga02.intel.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S933600AbdCURCu (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 21 Mar 2017 13:02:50 -0400
Message-Id: <e624e2$113a1gh@orsmga001.jf.intel.com>
Date: Tue, 21 Mar 2017 10:01:37 -0700
From: Joe Konno <joe.konno@linux.intel.com>
Subject: Re: [PATCH] scripts: package: KDEB_SOURCENAME in .deb names
In-Reply-To: <CAAqcGHkCo_1z=a4bAW9GwoisVGHhyX=-xjr4BopHHwz-4b=6gQ@mail.gmail.com>
References: <1489443666-29808-1-git-send-email-joe.konno@linux.intel.com>
        <CAAqcGHntEudc=q4au_ewtaQuZLNs-0Z8OVcy5kzHq7OsqPo7Mg@mail.gmail.com>
        <75cdc7$20652e@orsmga004.jf.intel.com>
        <CAAqcGHkCo_1z=a4bAW9GwoisVGHhyX=-xjr4BopHHwz-4b=6gQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
 boundary="Sig_/m0SrYFUnuXkLW_WhLYn1e2k"; protocol="application/pgp-signature"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>

--Sig_/m0SrYFUnuXkLW_WhLYn1e2k
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 21 Mar 2017 10:34:36 +0200
Riku Voipio <riku.voipio@linaro.org> wrote:

> On 14 March 2017 at 17:47, Joe Konno <joe.konno@linux.intel.com>
> wrote:
> > I took this approach for the following problem as well (which I did
> > not mention in my initial submission, silly me):
> >
> >   - Build and package the same kernel commit, but with different
> > kernel configurations =20
>=20
> Semi-related - you probably want to use bindeb-pkg (or my proposed
> fastdeb-pkg) as with deb-pkg target you will generate many huge
> source tarballs with identical content.
>=20
> > If I were building and packaging different kernel commits on the
> > same tree, I could live without my patch. The bulleted edge case,
> > and my original commit message's case, do something interesting for
> > target installations. With some KDEB_PKGVERSION finesse, I could
> > make multiple versions of 'linux-configA-image' and
> > 'linux-configB-image' available to the target. At least for my
> > usage, this patch can be useful. =20
>=20
> > Granted, LOCALVERSION hacking could accomplish the same thing. Maybe
> > it's the pedant in me, but "4.11.0-rc2$LOCALVERSION" seems ideal for
> > describing a named package, be it 'linux-image',
> > 'linux-configA-image', or '$KDEB_SOURCENAME-image'. =20
>=20
> It is idiomatic for Debian to have the configuration also in the
> version string:
>=20
> $ apt-cache search ^linux-image
> linux-image-4.9.0-2-686-pae-unsigned - Linux 4.9 for modern PCs
> linux-image-4.9.0-2-686-unsigned - Linux 4.9 for older PCs
> linux-image-4.9.0-2-amd64-unsigned - Linux 4.9 for 64-bit PCs
> linux-image-4.9.0-2-rt-686-pae-unsigned - Linux 4.9 for modern PCs,
> PREEMPT_RT
> linux-image-4.9.0-2-rt-amd64-unsigned - Linux 4.9 for 64-bit PCs,
> PREEMPT_RT
>=20
> It is a bit of bikeshedding matter, but your users might be expecting
> the above command to tell what kernels are available and "dpkg -l
> linux-image*" to tell what kernels are installed.

Feedback appreciated as always. It's hard to argue for changing
builddeb when it already follows Debian's long-standing kernel
naming/versioning scheme.

I haven't any further arguments for my patch at this point. It seems
I'm up against long-standing Debian packaging norms, so I would need to
start a discussion within that community. So, I'll orphan my patch (and
current approach) here. I'll be sure to share any future
enhancements/fixes here.

Thanks again, Riku, for the review and feedback.

>=20
> Also I wouldn't be surprised if various scripts (dkms?) expected the
> kernel packages to
> start with "linux-image-".
>=20
> Riku
> --
> To unsubscribe from this list: send the line "unsubscribe
> linux-kbuild" in the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html


--Sig_/m0SrYFUnuXkLW_WhLYn1e2k
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEkQ//qyfF7ERwiWhKjYhH1S9KqmYFAljRXHEACgkQjYhH1S9K
qmYuMRAAiJsKreHAD5NZSYn1LRUD54TIhgXNgDbib9DPdvGbc0jDsrKuuOw/hQJu
a2wKoNQkkxrTjp8+ncRaaH9oeJN9misNzcWDZ6grrXxksdNHtGhYmPSvHIcvmTxO
kAYFmdTNIxuaNskxO9Ym5Y7YBENa4OmyTHyGZvKJ9ejKSZ7BwP+pU4aFa+fnxOBA
ZHbN7XrCca3CQXLGXdvB4SsKlqwTLuWfi62yR4tVbot038HUCPgRSGsOEbT2w/Oi
LfLu8adMJ7jqNHPbNRBrASJIaXcZXT1jxhgNZanASdnLouRbLn4fm6Zd138wqm6R
aax9TlHGLx9LMvOng3Y0ZwDex52LXxiiV8SNs6ZN2dP6zxa1L5Vw4VsfuBT22rig
wJk9OsnilcJZV59O5YHyZz7AGjn0D4qb40i7AwdIz+t0mrOtF2/nOa1fpgIlC7ru
3k4Yk0lK8ml4cneos/PEo55TKSNzvU6qgymbsNN0DBVVV9A+8oLsWA6td9iQkpaA
WcHmr8TNk92Op37AW5HvdYTDuzdLXZEnhXCG/BW9y/U+tgNoJvuXX7haiFoHFVZl
g7mDJ/8M3Hsg6hUxW1yc5dpuwXrhHWF1KMduZ0QwnPe0pccxJtGq0oLtd+h1ZiaC
L9pnP2q4h6BwyO1ekpGbC2GcfjWqy67KIBav1UgDuSbLU7qxHs0=
=Nico
-----END PGP SIGNATURE-----

--Sig_/m0SrYFUnuXkLW_WhLYn1e2k--
