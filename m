Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pj1-f67.google.com ([209.85.216.67]:46569 "EHLO
        mail-pj1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726804AbfLDEWX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 3 Dec 2019 23:22:23 -0500
Date: Wed, 4 Dec 2019 09:52:07 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH 1/2] Enlist running kernel modules information
Message-ID: <20191204041543.GA1086470@ArchLinux>
References: <20191203094845.610692-1-unixbhaskar@gmail.com>
 <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="St7VIuEGZ6dlpu13"
Content-Disposition: inline
In-Reply-To: <CAK7LNASyrYv+pufwe4CfiNvd7NtriLw=FRdLOtu7CrbmZDSVHg@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Michal Marek <michal.lkml@markovi.net>, Randy Dunlap <rdunlap@infradead.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--St7VIuEGZ6dlpu13
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 12:10 Wed 04 Dec 2019, Masahiro Yamada wrote:
>On Tue, Dec 3, 2019 at 6:49 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> w=
rote:
>>
>> This is new file to show running kernel modules list.One line bash
>> script.
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/kernel_modules_info.sh | 23 +++++++++++++++++++++++
>>  1 file changed, 23 insertions(+)
>>  create mode 100755 scripts/kernel_modules_info.sh
>>
>> diff --git a/scripts/kernel_modules_info.sh b/scripts/kernel_modules_inf=
o.sh
>> new file mode 100755
>> index 000000000000..f005c47a3aa6
>> --- /dev/null
>> +++ b/scripts/kernel_modules_info.sh
>> @@ -0,0 +1,23 @@
>> +#!/bin/bash -
>> +#SPDX-License-Identifier: GPL-2.0
>> +#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +#
>> +#          FILE: kernel_modules_info.sh
>> +#
>> +#         USAGE: ./kernel_modules_info.sh
>> +#
>> +#   DESCRIPTION:  Running kernel modules information.
>> +#
>> +#       OPTIONS: ---
>> +#  REQUIREMENTS: awk
>> +#          BUGS: ---
>> +#         NOTES: ---
>> +#        AUTHOR: Bhaskar Chowdhury (https://about.me/unixbhaskar), unix=
bhaskar@gmail.com
>> +#  ORGANIZATION: Independent
>> +#       CREATED: 12/03/2019 13:52
>> +#      REVISION:  ---
>> +#=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D
>> +
>> +set -o nounset                              # Treat unset variables as =
an error
>> +
>> +awk '{print $1}' "/proc/modules" | xargs modinfo | awk '/^(filename|des=
c|depends)/'
>
>
>
>I want to see a good reason (e.g. useful for other developers) for upstrea=
ming.
>This script looks like your custom script, which you can maintain locally.

I think the usefulness comes from developers wants to see what are the
modules are using by the running kernel in formatted way.=20

This is very simple way to enlist all the modules with descriptions of
it.So , they can easily parse it with other scripts.

I believe you have already copy and paste the single line on your
terminal to see the output it produces, if not, I have already sent a
mail which includes the out of it.

If and only if, no other tool or mechanism(which might have skips my
eyes and knowledge) to find and display information this way.

Kindly, share me the other way , you can achieve that. This is a generic
script,and expecting stuff in common place, so everybody can use it.No,
special requirement is needed.

Here is little output,if you missed my other mail with it...

filename:/lib/modules/5.4.1-arch1-1ArchLinux-5.4.1/kernel/drivers/usb/host/=
xhci-pci.ko.xz
description:    xHCI PCI Host Controller Driver
depends:        xhci-hcd

These output can be parse by other scripts too(cliche...sorry) ..

Thanks,
Bhaskar

>
>
>--=20
>Best Regards
>Masahiro Yamada

--St7VIuEGZ6dlpu13
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3nNGgACgkQsjqdtxFL
KRUypggAgIbmgqA3OMg2FO8KR1Gn+rCPNkMTaekoI8YBpZyZEEriWb8zKTE6cYKQ
T2SG2dtpKbCu8ZLchEcvhb3ZZtzhFkZvfHEFvn/adauqY6l/O1RqlJZq3Q+SggVz
w42ceTdLu0O8NOdR2EKG0LhuL43g74By7RhmMMV+iR3H52OtCKyw5rV+z9n/K5dL
opmGSpF9iH4NleHChPTy3ePUjJxFNXycOhM8PrtkenQ72Cdr34NkAP38eR7XDQVY
7oZ5BEx+3O6B1KvypOI1e1+hmzypt7DfKwHSN+xifZu6YlvPJG4lV+2bFwhcDKfi
xWbsPT0Rz4frny9krhnKBI2CZ0MQYg==
=3QSx
-----END PGP SIGNATURE-----

--St7VIuEGZ6dlpu13--
