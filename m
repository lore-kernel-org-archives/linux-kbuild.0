Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:52124 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750757AbeDEEiX (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Apr 2018 00:38:23 -0400
Received: from mail-ua0-f179.google.com (mail-ua0-f179.google.com [209.85.217.179]) (authenticated)
        by conssluserg-03.nifty.com with ESMTP id w354cBH7022866
        for <linux-kbuild@vger.kernel.org>; Thu, 5 Apr 2018 13:38:12 +0900
Received: by mail-ua0-f179.google.com with SMTP id n20so14671698ual.7
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Apr 2018 21:38:11 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHn6mHHMGmcBFfRdwNSJwPaOfmnidw_T_hRKS66V47aryg@mail.gmail.com>
References: <20180221101032.27263-1-riku.voipio@linaro.org>
 <CAK7LNAQ+evMKMMcqQ8KX2aFGthsx=20o2X4EiQ7qu9y50ZvZjw@mail.gmail.com>
 <CAAqcGHkvKssjFmG0ebz5uBeO_PGeov5_C6MutW65ONp5riFwRg@mail.gmail.com>
 <CAAqcGHmeYqe81zG=PvoCtzhKhAU=27LT_K8OVhTykyBZGdML4A@mail.gmail.com>
 <CAK7LNASuGcv0rhX+NZ4q7D_hkq7=HqeZ2j5hOiW=F1VXeenwYA@mail.gmail.com> <CAAqcGHn6mHHMGmcBFfRdwNSJwPaOfmnidw_T_hRKS66V47aryg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Apr 2018 13:37:30 +0900
Message-ID: <CAK7LNAT82c+g96i9TQwe+N7UfsmKFkW43fEg1Xd5DwGkZV4mJw@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

2018-03-28 17:58 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
> On 27 March 2018 at 18:23, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Riku,
>>
>> 2018-03-27 22:28 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
>>
>>>> If I use GNU Make 4.2
>>>>
>>>> $ cat deb_pkg_log.txt
>>>> MAKEFLAGS for deb-pkg: rR -I/home/masahiro/ref/linux -j8
>>>> --jobserver-auth=3D3,4 --no-print-directory -- obj=3Dscripts/package
>>>> MAKEFLAGS for mkdebian internal: rR -I/home/masahiro/ref/linux -j
>>>> --jobserver-fds=3D5,6 --no-print-directory -- obj=3Dscripts/package
>>>
>>> I'll make a wild guess, and "outside" make is your 4.2 build while the
>>> intdeb-pkg ends up calling the make 4.0 that comes with your ubuntu?
>>> observe the --jobserver-auth vs ---jobsserver-fds arguments.
>>>
>>
>> Ah, you are right!
>>
>>
>> Probably this
>>
>>>
>>> -if [ "x$1" =3D "xdeb-pkg" ]
>>> -then
>>> -    cat <<EOF > debian/rules
>>> -#!/usr/bin/make -f
>
> This is actually mandated in Debian policy:
>
> https://www.debian.org/doc/debian-policy/#main-building-script-debian-rul=
es
>
>> So, if I type "make" from the command line, /home/masahiro/bin/make is c=
hosen.
>> Then, the outer Makefile is executed by Make 4.2.
>>
>> But, due to the shebang '#!/usr/bin/make -f'
>> debian/rules is executed by older Make.
>>
>> Due to the incompatibility of MAKEFLAGS, Make went insane.
>>
>> Hmm, do you have an idea for solution?
>
> One option:
>
> +++ b/scripts/package/mkdebian
> cat <<EOF > debian/rules
> -#!/usr/bin/make -f
> #!$(which $MAKE)  -f
>
> This will let people build with whatever make they please, with the
> price that the resulting source package will not build elsewhere.


I prefer this idea.


Just a nit:

Maybe is 'command -v' more portable than 'which'?

Bj=C3=B8rn Forsman stated so in the following:
https://lkml.org/lkml/2018/3/11/196



Now the parallel building works nicely.
So, I think '-j1' for dpkg-buildpackage is unnecessary.



> Option 2 is to error out if "which $MAKE" !=3D /usr/bin/make
>
>> I would be possible to forcibly overwrite MAKEFLAGS
>
> I think one goal is to keep deb-pkg simple, and fudging MAKEFLAGS
> would go against that goal.

I agree.
Please forget my comment.





--=20
Best Regards
Masahiro Yamada
