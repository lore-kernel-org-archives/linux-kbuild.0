Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:9982 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755902Ab3FEOGj (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 5 Jun 2013 10:06:39 -0400
Message-ID: <51AF45EB.7030003@redhat.com>
Date: Wed, 05 Jun 2013 10:06:35 -0400
From: Doug Ledford <dledford@redhat.com>
MIME-Version: 1.0
Subject: Re: [RFC PATCH v3] kbuild: fix error when building from src rpm
References: <32E1700B9017364D9B60AED9960492BC2114956E@FMSMSX107.amr.corp.intel.com> <51AF0AA6.8010008@suse.cz> <32E1700B9017364D9B60AED9960492BC21149807@FMSMSX107.amr.corp.intel.com>
In-Reply-To: <32E1700B9017364D9B60AED9960492BC21149807@FMSMSX107.amr.corp.intel.com>
Content-Type: multipart/signed; micalg=pgp-sha1;
 protocol="application/pgp-signature";
 boundary="----enig2VMQSDDREBOGHHKQUJDOK"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Marciniszyn, Mike" <mike.marciniszyn@intel.com>
Cc: Michal Marek <mmarek@suse.cz>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
------enig2VMQSDDREBOGHHKQUJDOK
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On 6/5/2013 6:17 AM, Marciniszyn, Mike wrote:
> I sent a different version today that used %defines for each arch,

I didn't look through the original patch (especially since you said you
are sending a new one).  However, please keep in mind that we need to
either put firmware in a kernel version specific directory or split it
off to a separate patch.  Otherwise you can't install more than one
kernel package at a time.

> but this idea is better and doesn't create a maintenance issue.  The
> scope would be kbuild wide so I assume that the cc list needs to
> expand?
>=20
> Also, I will also want to add a new package to create a kernel-devel
> package and will be submitting patch for that shortly.
>=20
> Thanks, Mike
>=20
>=20
>> -----Original Message----- From: Michal Marek
>> [mailto:mmarek@suse.cz] Sent: Wednesday, June 05, 2013 5:54 AM To:
>> Marciniszyn, Mike Cc: linux-kbuild@vger.kernel.org; Doug Ledford=20
>> Subject: Re: [RFC PATCH v3] kbuild: fix error when building from
>> src rpm
>>=20
>> On 4.6.2013 22:12, Marciniszyn, Mike wrote:
>>> Sorry for the confusion with the patch.
>>>=20
>>> The latest version I've changed to an RFC because of some
>>> testing issues I've encountered.
>>>=20
>>> The /sbin/installkernel doesn't behave very nicely when
>>> INSTALL_PATH is modified on RH6.4.
>> [snip]
>>> I'm seeing when spec file tries to do its own install...
>>>=20
>>> I'm open to suggestions for making this part of the spec file
>>> portable and the src RPM usable.
>>=20
>> You could introduce a new Makefile target, say image_name, that
>> would simply print the image name after including the arch
>> Makefile. Then in the spec file, you would simply do
>>=20
>> KBUILD_IMAGE=3D$(make -s image_name)
>>=20
>> I think that this target would be a useful addition to the already
>> existing kernelversion and kernelrelease targets. And BTW, we could
>> use make -s kernelrelease in the specfile as well, instead of
>> hardcoding the value there.
>>=20
>> Michal



------enig2VMQSDDREBOGHHKQUJDOK
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2.0.17 (MingW32)
Comment: Using GnuPG with Thunderbird - http://www.enigmail.net/

iQIcBAEBAgAGBQJRr0XrAAoJELgmozMOVy/d238P/3tJgBvlSMAslA+IKg/QlL1D
hWJ70YuPvePYaCB41mz4llUovGZYmjzf9humM1vOo2KXzy/ap8wXbD3/11UpEP+L
v8JutPC1c5gE7LoIi6k/GC7DWJhKLU06LV7SgiJfDCiE4+ml3vJcmDQmANor1bfu
YYUDsY6l7ZcM28JTznC0ECj3TA78xsEoIVYrE9eNLeP/uAwTBb0rNFZXVVzm/hi/
6fOwgSlWzOk0NIf2X2gsV58ca3VQ6aFUwGiQ4JQSQXMZHIHQmiPsrHP03/f6bB2L
NpuZoYz09tcvqEtZ3MZ55SyESREds7dsCxwxY9Uz9DVlRHT8AH81udlYqrvKccf/
bvtxcG3IMvo6rfVtsx2eGI3yr/N+4BUkb9fbuko3KAWW22UCz3+jMhpKh9J9p+Bu
PyVch//bOeEzkGyTKxPSOYJiRkdP2RCaMqKOjVtzElt1LTKM5WQaYdTyX4fTtzYB
UHsM0GxOJOh7ABPhLSbIwwEL/e4OzRGwASk2DQOQofvd70+YH8C4S5G8w8KR9jDI
zlHkQMKpDEMyH2OW/sOT8iT+kVQkwHD8BtSWZS0uzji6jXy9eSxptLj0b6PXYyZM
LOeLxH0wd57mJ6FYFx/gDZEjsaMv2zuxOdbBIfrsAMMjhS3myaldi7q860I9Zfjx
tfqIua6UEOdACzOmNcAg
=x1Qw
-----END PGP SIGNATURE-----

------enig2VMQSDDREBOGHHKQUJDOK--
