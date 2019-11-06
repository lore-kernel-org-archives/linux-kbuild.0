Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pl1-f194.google.com ([209.85.214.194]:34202 "EHLO
        mail-pl1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730752AbfKFDMD (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 5 Nov 2019 22:12:03 -0500
Date: Wed, 6 Nov 2019 08:41:47 +0530
From: Bhaskar Chowdhury <unixbhaskar@gmail.com>
Subject: Re: [PATCH] scripts: ver_linux:add flex, bison and yacc to the
 checklist
Message-ID: <20191106031144.GB20442@Gentoo>
References: <20191105113100.521-1-unixbhaskar@gmail.com>
 <CAK7LNARqHQwiQEQS_6ZX4GiBuVjo92fECLiVJYN2ixCcJUjU5w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
        protocol="application/pgp-signature"; boundary="tsOsTdHNUZQcU9Ye"
Content-Disposition: inline
In-Reply-To: <CAK7LNARqHQwiQEQS_6ZX4GiBuVjo92fECLiVJYN2ixCcJUjU5w@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Alexander Kapshuk <alexander.kapshuk@gmail.com>, Randy Dunlap <rdunlap@infradead.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>


--tsOsTdHNUZQcU9Ye
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On 11:33 Wed 06 Nov 2019, Masahiro Yamada wrote:
>On Tue, Nov 5, 2019 at 8:31 PM Bhaskar Chowdhury <unixbhaskar@gmail.com> w=
rote:
>>
>> This patch add three ulities explicitly to the checklist,namely
>> flex,bison and yacc.
>>
>> Signed-off-by: Bhaskar Chowdhury <unixbhaskar@gmail.com>
>> ---
>>  scripts/ver_linux | 3 +++
>>  1 file changed, 3 insertions(+)
>>
>> diff --git a/scripts/ver_linux b/scripts/ver_linux
>> index 810e608baa24..397497cf9430 100755
>> --- a/scripts/ver_linux
>> +++ b/scripts/ver_linux
>> @@ -32,6 +32,9 @@ BEGIN {
>>         printversion("PPP", version("pppd --version"))
>>         printversion("Isdn4k-utils", version("isdnctrl"))
>>         printversion("Nfs-utils", version("showmount --version"))
>> +       printversion("Bison", version("bison --version"))
>> +       printversion("Flex", version("flex --version"))
>> +       printversion("Yacc", version("yacc --version"))
>
>I think adding only "Bison" an "Flex" is enough.
>
Will remove yacc from it.
>
>
>>         while (getline <"/proc/self/maps" > 0) {
>>                 if (/libc.*\.so$/) {
>> --
>> 2.23.0
>>
>
>
>--=20
>Best Regards
>Masahiro Yamada

--tsOsTdHNUZQcU9Ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCAAdFiEEnwF+nWawchZUPOuwsjqdtxFLKRUFAl3COfAACgkQsjqdtxFL
KRWtCgf8CouRnUp+HDpl/vEAFahAEY0o4lqamsshO4cdXap+8KbO2PHfLNLcSmQW
59dALcN1hYR4JkW+Cs29frcKV0vqx/nJExRdakrdlqJsYEmVF7LbEU94B8J8YrUm
Qmqk70nWSHeOFrRkwQ13QWCK5XYY6BgbLQ/qeR3/Vfvn99vNKNSqlO0BViYex3CO
uFqsDTweFhC3PW48Po+13aHksNJVgQM+muztCmRcBhF9bj9ySLI+lcPb3rnrWKJi
8nFDLtPwqhA2icvDdJzg+K8M7uIgTSetdpwu1VDXXMehz2yn/eGx7nQlyPrV1I0I
rTj51Xzr2H1KVxhE6Cq2pHngocTdDQ==
=0RrW
-----END PGP SIGNATURE-----

--tsOsTdHNUZQcU9Ye--
