Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f196.google.com ([209.85.214.196]:40379 "EHLO
        mail-pl1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726803AbfKAFLZ (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 1 Nov 2019 01:11:25 -0400
Date: Fri, 1 Nov 2019 10:41:11 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts: prune-kernel:remove old kernels and modules dir
 from system
Message-ID: <20191101051108.GB3141@Gentoo>
References: <20191030095445.912435-1-unixbhaskar@gmail.com>
 <b8a12c03-1e17-61de-2cd9-a09650dc22b1@infradead.org>
 <20191031033722.GA7687@Gentoo>
 <41693d0e-8ff2-bf06-f1a6-e7fb52779f95@infradead.org>
 <20191031045242.GA3130@Gentoo>
 <809aa850-7a22-a7c5-af21-0e88d1c63dd7@infradead.org>
 <20191031071839.GB3130@Gentoo>
 <875a75ec-bbf1-9d80-a3e1-9c759c9c05e1@infradead.org>
 <20191101042337.GA3141@Gentoo>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="OwLcNYc0lM97+oe1"
Content-Disposition: inline
In-Reply-To: <20191101042337.GA3141@Gentoo>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: bfields@fieldses.org, yamada.masahiro@socionext.com, michal.lkml@markovi.net, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org


--OwLcNYc0lM97+oe1
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 09:53 Fri 01 Nov 2019, Bhaskar Chowdhury wrote:
>On 08:06 Thu 31 Oct 2019, Randy Dunlap wrote:
>>On 10/31/19 12:18 AM, Bhaskar Chowdhury wrote:
>>> On 22:27 Wed 30 Oct 2019, Randy Dunlap wrote:
>>>> On 10/30/19 9:52 PM, Bhaskar Chowdhury wrote:
>>>>>>>> That=C2=A0'rm'=C2=A0doesn't=C2=A0remove=C2=A0any=C2=A0files.=C2=A0=
=C2=A0Compare=C2=A0what=C2=A0remove_old_kernel()=C2=A0does.
>>>>>>> No,it=C2=A0is=C2=A0not=C2=A0using=C2=A0that=C2=A0function=C2=A0rath=
er=C2=A0take=C2=A0the=C2=A0parameter=C2=A0from=C2=A0the
>>>>>>> commandline=C2=A0and=C2=A0get=C2=A0into=C2=A0boot=C2=A0dir=C2=A0mat=
ch=C2=A0with=C2=A0it=C2=A0and=C2=A0remove=C2=A0it.
>>>>>>
>>>>>> But=C2=A0it=C2=A0doesn't=C2=A0do=C2=A0that.=C2=A0=C2=A0I=C2=A0tested=
=C2=A0it.=C2=A0=C2=A0It=C2=A0should=C2=A0be=C2=A0more=C2=A0like=C2=A0what
>>>>>> rmeove_old_kernel()=C2=A0does:
>>>>>>
>>>>>> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0rm=C2=A0-If=C2=A0vml=
inuz-$kernel_ver=C2=A0System.map-$kernel_ver=C2=A0config-$kernel_ver
>>>>>>
>>>>>> and=C2=A0if=C2=A0not,=C2=A0please=C2=A0explain=C2=A0why=C2=A0not.
>>>>> Okay,=C2=A0again=C2=A0some=C2=A0uniformity=C2=A0missing=C2=A0in=C2=A0=
the=C2=A0code,=C2=A0I=C2=A0would=C2=A0like=C2=A0to=C2=A0your
>>>>> suggested method,i.e call remove_old_kernel to do the job instead of =
depending=C2=A0on=C2=A0individual=C2=A0kernel.
>>>>
>>>> The simplest thing to do is set kernel_version=3D$kernel_ver
>>>> and then call remove_old_kernel().
>>>> And set modules_version=3D$modules_dir_name and call remove_old_module=
s_dir().
>>>>
>>>> But it would be cleaner to pass a parameter (kernel_version) to the
>>>> remove_old_kernel() function and to pass a parameter (modules_dir) to =
the
>>>> remove_old_modules_dir() function.
>>>=20
>>>>
>>>=20
>>> Thank you...I have just modified the code and call both the function
>>> under remove option. BTW I didn't set the extra variable $kernel_ver na=
me it $kernel_version and instead of $modules_dir_name name it $mo
>>> dules_version.
>>>=20
>>> Capturing command line parameter in $kernel_version and $modules_version
>>>=20
>>> Is that fine? Here is a code snippet:
>>
>>Yes, that should be OK.
>>
>>> -r | --remove)
>>> =C2=A0 if [[ $# -ne 3 ]]; then
>>> =C2=A0=C2=A0 printf "You need to provide kernel version and modules dir=
ectory
>>> =C2=A0=C2=A0 name \n"
>>> =C2=A0=C2=A0 exit 1
>>> =C2=A0=C2=A0 else
>>> =C2=A0=C2=A0 remove_old_kernel
>>> =C2=A0=C2=A0 remove_old_modules_dir
>>> =C2=A0=C2=A0 fi
>>>=20
>>>=20
>>> I have just test it and it works.
>>>=20
>>>=20
>>> And about solitary r option without hypen is ignoring and doing nothing.
>>>=20
>>> Means, if I pass ./scripts/prune-kernel r 5.3.3
>>> it simply ignore and does nothing.Only with the hypen it can work.
>>
>>Is that how it should be?
>>or what would you expect that to do?
>Yes it should be. Any malformed parameter should be discarded,except
>what explicitly given in code form,as help reminder.
>OR
>Do you want me to reminds user that they are missing thing to operate
>correctly??=20
>
>>
>>--=20
>>~Randy
>Bhaskar
>>
Randy,

I think we should show the help message , whenever user put a malformed
parameter, say they put something like this :

=2E/scripts/prune-kernel f 5.3.3

It should show the help message to indicate what exactly need to pass
with the script to get the desired result.

What do you think??

~Bhaskar

>-----BEGIN PGP SIGNATURE-----
>
>iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl27s0EACgkQsjqdtxFL
>KRV81wf/cMmIASLvGNbAxdbZY/7xnsdsaOWLsfH5c4twHsVwm74Zbasdq8s1l5Kn
>z8CZeWxKOKsItEY52g2vXbyDMFkk2La77kHZo4O5hQOmenRMaD9M7wcWqSCOJg59
>EbhMUt7RLpJLDKYTtegoGIyNgVZXfV8PpH6iKIvNscyJPMNBvppgRKkn80MWoG7k
>i0rMI6kvchwilxhVz/LPbJgKrIayhriKIBfTbDracSdX+WtJMQbAjdWRgGk0rmGe
>wS0p8nwJmmqXSc/qrrgZPR9VxsknVNMm/PzKS9CTE+GvELjXS8MeG3iwauQ4hx2K
>B255AW+zobp0IQGwTqH7VwO0u2GzLQ=3D=3D
>=3D3y5/
>-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl27vmQACgkQsjqdtxFL
KRW1OAf7BXoc7ATy7bIAAbQYl43jQKkmmzQryVX2wYjTrxHIOpMiY/2FiT0iU1hM
4lNhBIuj9sJ5WBQcQjldgakehQSnTTESihHRCxM1EBqzE+/RTSl01Ow4cA2YppAK
aDMyb4lHJO0JGDlx3fHXPCI/vhRVv/Qf5jNiROb05fwTevYsobvMPqE2aIhXaWxH
yMWmf1h/XhIYmp/QKqbQOxAP6HH2rF4Jp6WMr6VYOiZyONx26Ukw5uxsU9u/wCGF
ZfF2SfTVVQzYSTj92E9HFdoa+j9Ppp2yeLzG+mAGmzrFLgQ4XtdtYQxqXun12gVv
5J/Uk/gWb0Djqecyn4A/MO5DOw5Guw==
=OER0
-----END PGP SIGNATURE-----

--OwLcNYc0lM97+oe1--
