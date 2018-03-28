Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lf0-f49.google.com ([209.85.215.49]:39468 "EHLO
        mail-lf0-f49.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752447AbeC1I66 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 28 Mar 2018 04:58:58 -0400
Received: by mail-lf0-f49.google.com with SMTP id p142-v6so2364765lfd.6
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 01:58:57 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASuGcv0rhX+NZ4q7D_hkq7=HqeZ2j5hOiW=F1VXeenwYA@mail.gmail.com>
References: <20180221101032.27263-1-riku.voipio@linaro.org>
 <CAK7LNAQ+evMKMMcqQ8KX2aFGthsx=20o2X4EiQ7qu9y50ZvZjw@mail.gmail.com>
 <CAAqcGHkvKssjFmG0ebz5uBeO_PGeov5_C6MutW65ONp5riFwRg@mail.gmail.com>
 <CAAqcGHmeYqe81zG=PvoCtzhKhAU=27LT_K8OVhTykyBZGdML4A@mail.gmail.com> <CAK7LNASuGcv0rhX+NZ4q7D_hkq7=HqeZ2j5hOiW=F1VXeenwYA@mail.gmail.com>
From: Riku Voipio <riku.voipio@linaro.org>
Date: Wed, 28 Mar 2018 11:58:56 +0300
Message-ID: <CAAqcGHn6mHHMGmcBFfRdwNSJwPaOfmnidw_T_hRKS66V47aryg@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

On 27 March 2018 at 18:23, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Riku,
>
> 2018-03-27 22:28 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:
>
>>> If I use GNU Make 4.2
>>>
>>> $ cat deb_pkg_log.txt
>>> MAKEFLAGS for deb-pkg: rR -I/home/masahiro/ref/linux -j8
>>> --jobserver-auth=3,4 --no-print-directory -- obj=scripts/package
>>> MAKEFLAGS for mkdebian internal: rR -I/home/masahiro/ref/linux -j
>>> --jobserver-fds=5,6 --no-print-directory -- obj=scripts/package
>>
>> I'll make a wild guess, and "outside" make is your 4.2 build while the
>> intdeb-pkg ends up calling the make 4.0 that comes with your ubuntu?
>> observe the --jobserver-auth vs ---jobsserver-fds arguments.
>>
>
> Ah, you are right!
>
>
> Probably this
>
>>
>> -if [ "x$1" = "xdeb-pkg" ]
>> -then
>> -    cat <<EOF > debian/rules
>> -#!/usr/bin/make -f

This is actually mandated in Debian policy:

https://www.debian.org/doc/debian-policy/#main-building-script-debian-rules

> So, if I type "make" from the command line, /home/masahiro/bin/make is chosen.
> Then, the outer Makefile is executed by Make 4.2.
>
> But, due to the shebang '#!/usr/bin/make -f'
> debian/rules is executed by older Make.
>
> Due to the incompatibility of MAKEFLAGS, Make went insane.
>
> Hmm, do you have an idea for solution?

One option:

+++ b/scripts/package/mkdebian
cat <<EOF > debian/rules
-#!/usr/bin/make -f
#!$(which $MAKE)  -f

This will let people build with whatever make they please, with the
price that the resulting source package will not build elsewhere.

Option 2 is to error out if "which $MAKE" != /usr/bin/make

> I would be possible to forcibly overwrite MAKEFLAGS

I think one goal is to keep deb-pkg simple, and fudging MAKEFLAGS
would go against that goal.

Riku
