Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:44210 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1756196AbcKBS1U (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 2 Nov 2016 14:27:20 -0400
MIME-Version: 1.0
In-Reply-To: <0fcf5fb3-ff4a-a003-7814-51a6ab5ad988@users.sourceforge.net>
References: <72e07814-56e9-505a-d660-91ff20b6efea@users.sourceforge.net>
 <44402655-ef0d-1e2f-0587-f17295a08aa3@users.sourceforge.net>
 <CAK7LNATU4VrN6wCo8vzETMJu6aX+SK+0un03ryzCg7-BW_LxqA@mail.gmail.com> <0fcf5fb3-ff4a-a003-7814-51a6ab5ad988@users.sourceforge.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 3 Nov 2016 03:26:56 +0900
Message-ID: <CAK7LNASJiV0T-ruC6mLMzaHKzUDo2rFp0h1H1dQXjGk+wUzc5Q@mail.gmail.com>
Subject: Re: scripts/basic/bin2c: Complete error handling in main()
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: SF Markus Elfring <elfring@users.sourceforge.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, LKML <linux-kernel@vger.kernel.org>, kernel-janitors@vger.kernel.org

2016-11-03 2:48 GMT+09:00 SF Markus Elfring <elfring@users.sourceforge.net>=
:
>> Is replacing printf("\"\n") with puts("\"") optimization?
>
> Is the difference relevant if an =E2=80=9Cordinary=E2=80=9D string is pas=
sed instead of
> a format string?

I think GCC does the replacement automatically
unless -ffreestanding option is given.


With a quick test, I got the following disassembly

0000000000400440 <main>:
  400440: 48 83 ec 08           sub    $0x8,%rsp
  400444: bf c4 05 40 00       mov    $0x4005c4,%edi
  400449: e8 c2 ff ff ff       callq  400410 <puts@plt>
  40044e: 31 c0                 xor    %eax,%eax
  400450: 48 83 c4 08           add    $0x8,%rsp
  400454: c3                   retq

from the following program:

int main(void)
{
    printf("hello, world\n");
    return 0;
}




>
>> Frankly, the result of this patch seems extremely unreadable code.
>
> Do you care for more complete error detection and corresponding exception=
 handling
> in this source file?


I like the code as is.

Such error checks and magic numbers are messy.



--=20
Best Regards
Masahiro Yamada
