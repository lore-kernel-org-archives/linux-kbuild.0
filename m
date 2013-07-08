Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:13702 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751648Ab3GHQUw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Jul 2013 12:20:52 -0400
Message-ID: <51DAE6CC.2030507@redhat.com>
Date: Mon, 08 Jul 2013 12:20:28 -0400
From: Doug Ledford <dledford@redhat.com>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] kbuild: add generation of kernel-devel
References: <20130624143658.10761.3787.stgit@phlsvslse11.ph.intel.com> <20130624143833.10761.94871.stgit@phlsvslse11.ph.intel.com> <51D5919B.7010208@suse.cz> <32E1700B9017364D9B60AED9960492BC2115DC69@FMSMSX107.amr.corp.intel.com> <51DAACB9.5080103@suse.cz> <32E1700B9017364D9B60AED9960492BC2115DD48@FMSMSX107.amr.corp.intel.com> <51DABF5C.3080502@redhat.com> <32E1700B9017364D9B60AED9960492BC2115DD99@FMSMSX107.amr.corp.intel.com> <51DAD082.7080700@suse.cz>
In-Reply-To: <51DAD082.7080700@suse.cz>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2AKQNSPIFNWQPIXXDGBCW"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, "mmarcini@yahoo.com" <mmarcini@yahoo.com>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2AKQNSPIFNWQPIXXDGBCW
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 7/8/2013 10:45 AM, Michal Marek wrote:
> On 8.7.2013 15:39, Marciniszyn, Mike wrote:
>>>
>>> rpm 4.0.3 is *ancient*.  An %exclude is perfectly acceptable and defi=
nitely
>>> preferable to a broken payload.
>>>
>>
>> The top of the mkspec shell script has this comment:
>> #       Output a simple RPM spec file that uses no fancy features requ=
iring
>> #       RPM v4. This is intended to work with any RPM distro.
>>
>> Are there old distros that still care about this?
>=20
> If it's that old, I don't think we need to care. At least not for
> building the RPM, because the compiler on such old systems is probably
> not going to be able to compile the kernel. I wasn't sure if %exclude
> wasn't added in the last five years or so.

Quick google search confirms that rpm 4.0.3 was released in December of
2001.  I think it's safe to say we can use %exclude and not worry about
anything so ancient it can't support it.



------enig2AKQNSPIFNWQPIXXDGBCW
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJR2ubYAAoJELgmozMOVy/d+z0P/3TGxDrkfZgVYe/Bn8i/vCjI
SKa/6ns9fQdJ1ksstQZoFzbOqCaG+3nkL2TBHDAiLvUiGuLKUw3Tt+Lc5fPaA6sA
FQsdHPz8ea2NHRbQS/BGuIy484CTR8mSQRom6c4Rid3zyBm5IBhgq1fHJUuPsSjm
Mxo1+V2NUX/cwsKvGlacUNO2jGx1SwXDE+U05NgmFXaoo2vCWV7XVUuR54ZLTH3h
DFiFvWYnGj7U/TgnQ2Y4v+Qs/3Iqb/d5X/MfcVLQ6pBt3XRXu511nT2JpBY9Pgh+
dT6c/oRpoSTZFsp4DA25z5hcpcNUOSzgVNJUPmxj3RkKrRkl54awxYzzWwpcaOMq
C+ppO9sBd8Ru7acaGtxeYY1UlBzknZboXa4sHKs6SxoE6piYsEQT52qW/DPir+jS
sqS1aaSCnBwDuZXiuSE+MAPyj5YxLrG4h3LyVGnQ+VLRctGBBupjPktaKJMXWMCL
ATHEtlHM5/6pcKxiz6M2/Of/CAZuQ182Cwn84S6WNIMJuZ9WvDuzHHUb7LTU7sgU
Crkj7aIxCxaZFhIoHsfXf7ZGh7NPrEZxlEkpAwAPqFs/XCJRRchx9VnrypqK5dan
F3OumzdeS9BSnYc1uCwamaiPyBsgTA74aA/QrLGLBeO6SfKHtLdZEAt6NFJ5Pob4
vRGHsSeuHjBX09U2Pryo
=LXqe
-----END PGP SIGNATURE-----

------enig2AKQNSPIFNWQPIXXDGBCW--
