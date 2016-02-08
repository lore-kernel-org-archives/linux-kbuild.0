Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-yw0-f182.google.com ([209.85.161.182]:32977 "EHLO
	mail-yw0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754404AbcBHPcx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 10:32:53 -0500
Received: by mail-yw0-f182.google.com with SMTP id u200so25768979ywf.0
        for <linux-kbuild@vger.kernel.org>; Mon, 08 Feb 2016 07:32:52 -0800 (PST)
Subject: Re: [Xen-devel] Adding Xen to the kbuild bot?
References: <CALCETrUh1jq7Di0gTO0R3wN51x=vmd5wU4ODmE0kXK13MhQDnA@mail.gmail.com>
 <20160205031116.GB30154@wfg-t540p.sh.intel.com>
 <CALCETrVssJ2oCqT9eKzoXQ0VWz1O1XB=Gt97djrgPYTfZYt_ug@mail.gmail.com>
From: Doug Goldstein <cardoe@cardoe.com>
Message-ID: <56B8B347.40800@cardoe.com>
Date: Mon, 8 Feb 2016 09:24:55 -0600
MIME-Version: 1.0
In-Reply-To: <CALCETrVssJ2oCqT9eKzoXQ0VWz1O1XB=Gt97djrgPYTfZYt_ug@mail.gmail.com>
Content-Type: multipart/signed; micalg=pgp-sha512;
 protocol="application/pgp-signature";
 boundary="s24fcaIp714R5FA6IEgK54hwchn7BrmG0"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andy Lutomirski <luto@amacapital.net>, Fengguang Wu <fengguang.wu@intel.com>
Cc: Ian Campbell <ian.campbell@citrix.com>, "linux-kbuild@vger.kernel.org" <linux-kbuild@vger.kernel.org>, Ian Jackson <Ian.Jackson@eu.citrix.com>, "Hu, Robert" <robert.hu@intel.com>, "xen-devel@lists.xenproject.org" <xen-devel@lists.xenproject.org>, LKP <lkp@01.org>

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--s24fcaIp714R5FA6IEgK54hwchn7BrmG0
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: quoted-printable

On 2/5/16 2:10 PM, Andy Lutomirski wrote:
> On Feb 4, 2016 7:11 PM, "Fengguang Wu" <fengguang.wu@intel.com> wrote:
>>
>> Hi Andy,
>>
>> CC more people on Xen testing -- in case OSStest already (or plans to)=

>> cover such test case.
>>
>> On Tue, Feb 02, 2016 at 07:31:30PM -0800, Andy Lutomirski wrote:
>>> Hi all-
>>>
>>> Would it make sense to add some basic Xen PV testing to the kbuild bo=
t?
>>
>> Do you mean to run basic Xen testing on the various kernel trees that
>> 0day robot covers? That is, to catch kernel regressions when running
>> under Xen.
>>
>=20
> Yes, exactly.  I've personally broken Linux as a Xen guest at least twi=
ce.
>=20
>> If the intention is to catch Xen regressions, the OSStest
>> infrastructure may be a better option:
>>
>>         git://xenbits.xen.org/osstest.git
>=20
> No, I think that 0day should pick one Xen version and stick with it
> for a while rather than trying to track the latest version.
>=20
>>
>>> qemu can boot Xen like this:
>>>
>>> qemu-system-x86_64 -kernel path/to/xen-4.5.2 -initrd 'path/to/bzImage=

>>> kernelarg otherkernelarg=3Dvalue" -append 'xenarg other_xen_arg'
>>>
>>> This should work with any kernel image for x86 or x86_64 with CONFIG_=
XEN=3Dy.
>>
>> Got it. If you have simple working test scripts to illustrate test
>> details, it'd be a great help for integrating into OSStest or 0day.
>=20
> I have a script that will boot to a command prompt, but I don't know
> if that's the right way to do it.  I'm not really sure how 0day works
> under the hood, but treating Xen as a different configuration or arch
> instead of treating it as a different test case might make more sense.
>=20
> --Andy
>=20

Andy,

I'd be curious to see the script you use.


Thanks.
--=20
Doug Goldstein


--s24fcaIp714R5FA6IEgK54hwchn7BrmG0
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG/MacGPG2 v2.0

iQJ8BAEBCgBmBQJWuLNLXxSAAAAAAC4AKGlzc3Vlci1mcHJAbm90YXRpb25zLm9w
ZW5wZ3AuZmlmdGhob3JzZW1hbi5uZXRBNTM5MEQ2RTNFMTkyNzlCNzVDMzIwOTVB
MkJDMDNEQzg3RUQxQkQ0AAoJEKK8A9yH7RvUvf8P/j/N2GYYYo386W/nLQfYayEa
1WjU72alqfr0vAviJ0sihkSuAGb133bjGYeh7dGSL0KhP5/PvH7BFov9hgDYs6tS
J5rlH43lnbwm5+Gts1fyOgpg8pugT6dKxBzz0yUQFsn1WCSQfBiQfEHHX2PD/6i5
Tyu3a8lqFvOMBMK5wro3XSkIudGTPh4XxZsv4D8D7h5edMRU9NSA+Q1HOwdmySng
nxF2FXZbcBGIjpeve2I+Cx/0hgjcY+iGTccW7ahlfzRCT9XaK3vrBu2j8F9INyQC
lii97F2UfqL8NNU0buxOYHVLGpS9I6plBcd7dkh1apgijjFAP18J6h58uyq+61Bg
YZlDYGtaN/mNi8qrXIYojmzOUxTWwJIt2EMscJR/Jmo+BGDvw1D1zoWVSlPl9hgU
SOAo99mtxCvtB6ZAPhuy3bjWPP7kgAzDIr2DS1OJJP28d7SvscDDoB34jxw8Ju25
G+8P9Sy1EURkUEaTOJDupJi2235C5dE7TrvPjCd1SLCGDvEywdV0J+1zjnFlwB3R
PmgRL7zKpQQOlItWtkl8II3Cjnw7cnAc+w/IZjyrEtt5AWm6svb9Oin7OoGrPkD/
haa2t4eNXoQOJVyFoxb8nI2JNtKkxzTN8w1A6wn5RRyPP2KGeTJOuaF4g5aViEh5
SAijnmaFCAatu5qwp2f0
=iLl6
-----END PGP SIGNATURE-----

--s24fcaIp714R5FA6IEgK54hwchn7BrmG0--
