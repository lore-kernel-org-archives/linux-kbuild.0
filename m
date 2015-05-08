Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f180.google.com ([209.85.217.180]:33246 "EHLO
	mail-lb0-f180.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751970AbbEHLLc (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 8 May 2015 07:11:32 -0400
From: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Date: Fri, 8 May 2015 14:11:37 +0300
Subject: Re: [PATCH] builddeb: fix stripped module signatures if
 CONFIG_DEBUG_INFO and CONFIG_MODULE_SIG_ALL are set
Message-ID: <20150508111137.GA32730@localhost.localdomain>
References: <1426494054-32138-1-git-send-email-andrej.skvortzov@gmail.com>
 <55365798.4090302@suse.cz>
 <20150422155700.GD32026@gluino>
 <20150504153724.GA26392@nest>
 <554A1774.6080801@suse.cz>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="4Ckj6UjgE2iN1+kY"
Content-Disposition: inline
In-Reply-To: <554A1774.6080801@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: maximilian attems <max@stro.at>, Ben Hutchings <ben@decadent.org.uk>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--4Ckj6UjgE2iN1+kY
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 06 May, Michal Marek wrote:
> On 2015-05-04 17:37, Andrey Skvortsov wrote:
> > On 22 Apr, maximilian attems wrote:
> >> On Tue, Apr 21, 2015 at 03:58:48PM +0200, Michal Marek wrote:
> >>> (added Max to Cc)
> >>>
> >>> On 2015-03-16 09:20, Andrey Skvortsov wrote:
> >>>> If CONFIG_MODULE_SIG_ALL is set, then user expects that all modules =
are
> >>>> automatically signed in the result package, as it's for rpm-pkg, bin=
rpm-pkg,
> >>>> tar, tar-*. For deb-pkg this is correct only if CONFIG_DEBUG_INFO
> >>>> is NOT set. In that case deb-package contains signed modules.
> >>>>
> >>>> But if CONFIG_DEBUG_INFO is set, builddeb creates separate package w=
ith
> >>>> debug information. To do that, debug information from all modules
> >>>> is copied into separate files by objcopy. And loadable kernel module=
s are
> >>>> stripped afterwards. Stripping removes previously (during modules_in=
stall)
> >>>> added signatures from loadable kernel modules. Therefore final deb-p=
ackage
> >>>> contains unsigned modules despite of set option CONFIG_MODULE_SIG_AL=
L.
> >>>>
> >>>> This patch resigns all stripped modules if CONFIG_MODULE_SIG_ALL is =
set
> >>>> to solve this problem.
> >>>>
> >>>> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> >>>
> >>> Max, Ben, are you fine with this patch? It looks OK to me, the
> >>> modules_sign target has been added for this very purpose.
> >>>
> >>
> >> Ben seems busy with the release, so jumping in. The patch looks
> >> perfect to me.
> >>
> >> Acked-by: maximilian attems <max@stro.at>
> >>
> > Maximilian, thanks for the review.
> >=20
> > Michal, are we waiting for Ben's acknowledge too?
>=20
> I applied the patch to kbuild.git#misc now, after fixing the whitespace.
> Andrey, please use tabs for indentation, especially when the surrounding
> code is already using this style.

Thanks, Michal.

Sorry about whitespaces. I checked the patch with
checkpatch.pl before posting and it did not complain. I'll pay more
attention to patches for non-[ch] files.

--=20
Best regards,
Andrey Skvortsov

Secure eMail with gnupg: See http://www.gnupg.org/
PGP Key ID: 0x57A3AEAD

--4Ckj6UjgE2iN1+kY
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: Digital signature

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1.4.12 (GNU/Linux)

iQIcBAEBCAAGBQJVTJnpAAoJEAF8y6L1SLCtSXsQAMS3paRjdD6DJs2UUejsJdMv
cSdwTn2Ua2/pObHRgppmLLWyzR/2U/TIpcxbgU7tWikr87X4z3YrsMzLoXwBBTNU
r1P4mlHiLKPVxIFW0IH/T1bhrvUabvwHZYN9q+9n9Rz2XE2orWRKgcCiU6wWs7D3
dzfco83z3zg16tvqoqHIbxsyiG8ZofLZ7JRIAs3kLupXyqEQ0J5ASi8hbAN4Lukw
kKeN0nKrmP45ZxkXIxNDW4yALrnaclCIreQFaC22rocCQjC/k05ZYp8FXwBx+l/w
yXnzJbWGCLRvD+coIztMEbFHqV+pX2fYqVBfWnxNx2z7cJWCi+3nBFHV+xu2QXyK
TYmkL9hYUTLyns2EYZvT6ZGvqiJEh4MKGlXYgptU1RdC/nqb7CQUxiNyJnj46hPo
W1jNEwtGZ2ctlyfMBr1Cwr7bj/mpoumQiWiqc0m3vYQEwBHZ3sdRyjqbzZbrv0T2
gvOn7LnFDh2YhbJ4gz0eUSHpV6uU0Sc1Ls+zfNJolfvuJfQc5Q9ywSX9IWk9fTX3
RPY0TMpJ/QyCb3MUl9prIa1KWzjIhJV/ASYSTb99qnN68FDnlGPFmf27pug0HAIW
ItTFaGbm12rrLsHmGsuTeUTE3E4934WPoURwmqMXSL9P23CoOLmb7UcotlXljSMa
0nvA/f+TCksUzxgnrOvP
=Ofq2
-----END PGP SIGNATURE-----

--4Ckj6UjgE2iN1+kY--
