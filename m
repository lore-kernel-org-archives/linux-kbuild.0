Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bbox.sascha.silbe.org ([84.201.25.44]:47515 "EHLO
        bbox.sascha.silbe.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755125AbdENQys (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 14 May 2017 12:54:48 -0400
Received: from twin.sascha.silbe.org (twin.sascha.silbe.org [IPv6:2a01:1e8:e100:85ef:922b:34ff:fea4:bab2])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (Client CN "twin.sascha.silbe.org", Issuer "stunnel Pseudo-CA" (verified OK))
        by bbox.sascha.silbe.org (Postfix) with ESMTPS id 7F088C0761
        for <linux-kbuild@vger.kernel.org>; Sun, 14 May 2017 18:54:45 +0200 (CEST)
Subject: Re: [PATCH] kbuild: add ARM support for tar-pkg
In-Reply-To: <CAK7LNASc7NgthfZCWFT=3FhRQxxJuuzDVjT8GHik5A0+zBVxpw@mail.gmail.com>
References: <20170513113126.13281-1-x-linux@infra-silbe.de> <CAK7LNASc7NgthfZCWFT=3FhRQxxJuuzDVjT8GHik5A0+zBVxpw@mail.gmail.com>
Date: Sun, 14 May 2017 18:54:32 +0200
Message-ID: <toe37c7bcqf.fsf@twin.sascha.silbe.org>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="=-=-=";
        micalg=pgp-sha512; protocol="application/pgp-signature"
From: Sascha Silbe <x-linux@infra-silbe.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

--=-=-=
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable

Dear Masahiro (is that right?),

Masahiro Yamada <yamada.masahiro@socionext.com> writes:

> 2017-05-13 20:31 GMT+09:00 Sascha Silbe <x-linux@infra-silbe.de>:
>> The fallback code for "unknown" architectures doesn't work on ARM
>> because for ARM (and a couple of other architectures) KBUILD_IMAGE
>> contains only the file name, not the full path. Having an explicit
>> rule also avoids printing the warning for unknown architectures.
>>
>> Signed-off-by: Sascha Silbe <x-linux@infra-silbe.de>
>> ---
>
> Now KBUILD_IMAGE contains the full path for all architectures.
>
>
> Please check the following commit.
>
> commit 152e6744ebfc8fa6cc9fff4ba36271f5f1ba2821
> Author: Michal Marek <mmarek@suse.com>
> Date:   Tue Nov 22 22:34:30 2016 +0100
>
>     arm: Use full path in KBUILD_IMAGE definition

Figures. I'm sitting on this patch for years and when I finally get
around to write a commit message, somebody fixed it elsewhere and that
patch went in just a few days ago. :)

The second part of the rationale (getting rid of the warning) still
applies, so I'll follow up with a v2.

Sascha
=2D-=20
Softwareentwicklung Sascha Silbe, Niederhofenstra=C3=9Fe 5/1, 71229 Leonberg
https://se-silbe.de/
USt-IdNr.: DE281696641

--=-=-=
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v1

iQIcBAEBCgAGBQJZGIvJAAoJEMGPauiBMO2XMbMQAK7U5JKRg7tcCpdLd+WKscew
SJgT76aZ8ziREutC6+vtXQClFtqbpGPBIzqIWAB3Upc6xXTFvoycgh8/1v9ICyXk
OqUw7Q3K8HH6cxmwWihkRjChEJJqskDAcEGZ3rkxlBwaCWCxvOAHLdfq/YRWKs9s
I8zMJoRvAzG8n9jVlHo534GXEF80Pi7ybJvTMr5ttlTNT3W8+FjnJEFRWk8p5UMN
bQHw6o3377kGZITvxBfA5zN+LC4XJlJNhpFsu8O+RQIzEqLF5Vt4uyDP3JZuZY99
ctPa3eNio3LTWrmepRz3XzXhYXzVp8X7fWrQEvXty2fmNmfQaiCRAQN0E8oKIgpd
IdgpsZymsqWbYGhT1rMhfPF/mxNexYNIHWnMeOaJVIqPi97WrfiD+UpJLYemfks9
gi2ZoVTOGVofo2KTaZuoTHmxFpr+S7qKGhlcuE0gjU43v9gUQ2rHhex2KgBYyNYC
a4yLuhFJeLKDfxGI1e/ClDM+MoY4KUp2ou6mYjqaT+Bvn6b6KXTu+Bl5QzNy3vpm
QRAc7P+55bYm1udC2QavwF8lhw1DFZF9ORx573UlJvkGiz4t5S11JMVfBuguKAto
KclUkvdP5ues+4uQwh0VORY/oF3Ihv+oBGxoWgMFmVeWh6Bj6DW68h2OSzyL+ZJE
B4nSOR30teEmAhmwQyVS
=hitl
-----END PGP SIGNATURE-----
--=-=-=--
