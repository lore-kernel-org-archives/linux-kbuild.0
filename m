Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f193.google.com ([209.85.214.193]:42111 "EHLO
        mail-pl1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726772AbfKFHBi (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 6 Nov 2019 02:01:38 -0500
Date: Wed, 6 Nov 2019 12:31:23 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts:patch-kernel:bash syntax replace,correct one
Message-ID: <20191106070120.GB18076@Gentoo>
References: <20191025080544.7209-1-unixbhaskar@gmail.com>
 <CAK7LNAT1=e36tLgPcHUOxKUSCH7MW3egYuJMtY+OfZWvHRxfGA@mail.gmail.com>
 <20191106042049.GC20442@Gentoo>
 <CAK7LNARdxhr1Ab1bkUqRjz4LGuH6mUg9kmp_4U0sYcK8uWzRyw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="rS8CxjVDS/+yyDmU"
Content-Disposition: inline
In-Reply-To: <CAK7LNARdxhr1Ab1bkUqRjz4LGuH6mUg9kmp_4U0sYcK8uWzRyw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linus Torvalds <torvalds@linux-foundation.org>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--rS8CxjVDS/+yyDmU
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 15:25 Wed 06 Nov 2019, Masahiro Yamada wrote:
>On Wed, Nov 6, 2019 at 1:21 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> w=
rote:
>>
>> On 13:15 Wed 06 Nov 2019, Masahiro Yamada wrote:
>> >On Fri, Oct 25, 2019 at 5:06 PM Bhaskar Chowdhury <unixbhaskar@gmail.co=
m> wrote:
>> >>
>> >> This patch will replace backquote to dollar parenthesis syntax
>> >> for better readability.Corrected one.
>> >
>> >Talking about the commit subject,
>> >which part is 'bash syntax' ?
>> >
>> >One more thing,
>> >"correct one" is not the correct way to send
>> >a new patch version.
>> >See the patch submission from other people.
>> >The version number is enclosed in the square brackets.
>> >
>> >[PATCH v2]
>> >
>> >
>> >The commit subject should describe what it does
>> >in imperative mood.
>> >
>> >https://patchwork.kernel.org/patch/11205593/
>> You are right ..my mistake ..shouldn't have included the
>> "correct one" ...and you are absolutely right..."bash syntax"
>> is as vague and confusing .
>>
>> Again , Would you mind if I send you the correct one with
>> proper subject line and explained what changed.
>
>
>I will pick up the patch with the subject corrected
>but you do not need to send similar patches any more.
>
>`...` is the correct syntax.
>Even if $(...) is more readable,
>the added value is quite small.
>
Okay , noted.
>
>
>
>--=20
>Best Regards
>Masahiro Yamada

--rS8CxjVDS/+yyDmU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3Cb7wACgkQsjqdtxFL
KRWlBwgAj6yVqeQEReDZGWZ7OHnr0GRoGU13xPVK27xr0ibe2N7SJq1fwDeno/Fw
edI7d8aufFlP+vvpzZVdjdLvbMkWv/mOW3kxnURxXcq3X95nkGDoceE5Fyh7tZ+i
hxLrYMYOYFwlJikJJnI4S5HTGQ7A4B884zGRMqcC8bpAWAe6BNPDUZbmNaCZ02sW
C/3olrDvpffviu4APEtLN1lAeuKVegz4k8Mybf+5dR1wH/G9FCp1/Q/oOSCUcLpt
g7JZXEsw0xfXWtBmbI3Uwq9gEGoQ/PXDi6MC7+lRiL3LW+JBmDtlik/zKwk6DRM+
Uhm8I6PssRajlg8Pu41UBQT0VVXBMw==
=9wMq
-----END PGP SIGNATURE-----

--rS8CxjVDS/+yyDmU--
