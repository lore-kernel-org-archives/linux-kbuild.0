Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:33312 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752526AbeC0PY2 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 27 Mar 2018 11:24:28 -0400
Received: from mail-vk0-f47.google.com (mail-vk0-f47.google.com [209.85.213.47]) (authenticated)
        by conssluserg-04.nifty.com with ESMTP id w2RFOHES030212
        for <linux-kbuild@vger.kernel.org>; Wed, 28 Mar 2018 00:24:17 +0900
Received: by mail-vk0-f47.google.com with SMTP id y127so13459332vky.9
        for <linux-kbuild@vger.kernel.org>; Tue, 27 Mar 2018 08:24:17 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAAqcGHmeYqe81zG=PvoCtzhKhAU=27LT_K8OVhTykyBZGdML4A@mail.gmail.com>
References: <20180221101032.27263-1-riku.voipio@linaro.org>
 <CAK7LNAQ+evMKMMcqQ8KX2aFGthsx=20o2X4EiQ7qu9y50ZvZjw@mail.gmail.com>
 <CAAqcGHkvKssjFmG0ebz5uBeO_PGeov5_C6MutW65ONp5riFwRg@mail.gmail.com> <CAAqcGHmeYqe81zG=PvoCtzhKhAU=27LT_K8OVhTykyBZGdML4A@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 28 Mar 2018 00:23:36 +0900
Message-ID: <CAK7LNASuGcv0rhX+NZ4q7D_hkq7=HqeZ2j5hOiW=F1VXeenwYA@mail.gmail.com>
Subject: Re: [PATCH v4] scripts/package/builddeb: split generating packaging
 and build
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Riku Voipio <riku.voipio@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, debian-kernel <debian-kernel@lists.debian.org>

Riku,

2018-03-27 22:28 GMT+09:00 Riku Voipio <riku.voipio@linaro.org>:

>> If I use GNU Make 4.2
>>
>> $ cat deb_pkg_log.txt
>> MAKEFLAGS for deb-pkg: rR -I/home/masahiro/ref/linux -j8
>> --jobserver-auth=3,4 --no-print-directory -- obj=scripts/package
>> MAKEFLAGS for mkdebian internal: rR -I/home/masahiro/ref/linux -j
>> --jobserver-fds=5,6 --no-print-directory -- obj=scripts/package
>
> I'll make a wild guess, and "outside" make is your 4.2 build while the
> intdeb-pkg ends up calling the make 4.0 that comes with your ubuntu?
> observe the --jobserver-auth vs ---jobsserver-fds arguments.
>

Ah, you are right!


Probably this

>
> -if [ "x$1" = "xdeb-pkg" ]
> -then
> -    cat <<EOF > debian/rules
> -#!/usr/bin/make -f
> -
> -build:
> -       \$(MAKE)



I installed Make 4.2 into /home/masahiro/bin/,
but /usr/bin/make is still distro-bundled older Make.

/home/masahiro/bin is listed before /usr/bin in my PATH environment,

So, if I type "make" from the command line, /home/masahiro/bin/make is chosen.
Then, the outer Makefile is executed by Make 4.2.

But, due to the shebang '#!/usr/bin/make -f'
debian/rules is executed by older Make.


Due to the incompatibility of MAKEFLAGS, Make went insane.

Hmm, do you have an idea for solution?

I would be possible to forcibly overwrite MAKEFLAGS, but
IMHO, it is kind of strange to run dpkg-buildpackage
from Makefile.




-- 
Best Regards
Masahiro Yamada
