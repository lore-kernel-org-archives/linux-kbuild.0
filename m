Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-lb0-f178.google.com ([209.85.217.178]:36187 "EHLO
	mail-lb0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752554AbcAQVOj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Jan 2016 16:14:39 -0500
Received: by mail-lb0-f178.google.com with SMTP id oh2so338291784lbb.3
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Jan 2016 13:14:38 -0800 (PST)
Subject: Re: [U-Boot] Kconfig bug (optional choice deselected by following
 option)
References: <569B7D5D.1030904@gmail.com>
 <CAK7LNAT9oiuQ81Ms-Piw2=OwX3mr+VzCQk2buy1T7yqRLKU40Q@mail.gmail.com>
From: Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
Message-ID: <569C043B.7030301@gmail.com>
Date: Sun, 17 Jan 2016 22:14:35 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNAT9oiuQ81Ms-Piw2=OwX3mr+VzCQk2buy1T7yqRLKU40Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

-----BEGIN PGP SIGNED MESSAGE-----
Hash: SHA256

Hi All,

Just a small update from my side;

I used bisect-foo and offending commit (@Linux) seems to be:

commit 5d09598d488f081e3be23f885ed65cbbe2d073b5
Author: Arnaud Lacombe <lacombar@gmail.com>
Date:   Mon Jan 23 17:29:05 2012 -0500

    kconfig: fix new choices being skipped upon config update



Best Regards,
Mateusz

On 17.01.2016 21:29, Masahiro Yamada wrote:
> Hi Mateusz,
> (CCing linux-kbuild, which I think the best place to discuss this topic)
> 
> 
> I think "default n" in the choice entry is weird
> because the choice is not boolean.
> 
> Without it, the weird thing you saw did not happen on my box.
> 
> 
> Anyway, I'd like Kconfig to say something if it is really a syntax error.
> 
> 
> I hope comments from Kconfig experts.
> 
> 
> 
> 
> 2016-01-17 20:39 GMT+09:00 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>:
> Hi all,
> 
> I have found weird feature of Kconfig.
> If I misused something, please let me know - I found at least one place
> where the same error occurs.
> 
> Let's consider the following Kconfig (you can put it anywhere in the source tree):
> <-------------- copy ----------------->
> menu "Testmenu"
> choice
>         prompt "Problem to solve"
>         optional
>         default n
>         help
>           Solve one of great world problems
> 
> config SOLVE_HUNGER
>         bool "Hunger"
> 
> config SOLVE_WARS
>         bool "Wars"
> 
> config CURE_CANCER
>         bool "Cancer"
> 
> endchoice
> 
> config TREES
>         default n
>         bool "Plant trees in garden"
> endmenu
> 
> config BLAH
>         default n
>         bool "Totally unrelated option"
> 
> <------------- paste ------------------->
> 
> Now, select HUNGER important problem to solve; Warning - select it with space, _not_ enter + selection from list;
> Then select either TREES or BLAH.
> 
> Weird thing is - SOLVE_HUNGER is unselected.
> 
> It doesn't happen when you select (anything) by entering selection menu (i.e. enter).
> Even if you deselect option and then select it with space.
> 
> It happens both in menuconfig and nconfig.
> 
> It happens both in recent U-Boot b57843e6 and Linux kernel ece62678.
> 
> Unfortunately my knowledge of Kconfig is very limited so your help would be appreciated.
> 
> Best Regards,
> Mateusz
>> _______________________________________________
>> U-Boot mailing list
>> U-Boot@lists.denx.de
>> http://lists.denx.de/mailman/listinfo/u-boot
> 
> 
> 

-----BEGIN PGP SIGNATURE-----
Version: GnuPG v2

iQEcBAEBCAAGBQJWnAQpAAoJELvtohmVtQzBqrwH/1joRyZ2wuuTEtaJG9due3IM
Wf0sHphYkTWdfi4kxRPZRwH57bvdLjtb3BWxDKtze+luoYB6M5dFUFk5SUzcDREI
/+bddYKcLwkSDc73t/HiA/4U3hqma9jXIo1bLoP9vtlvcIQpaITcqnOxB4tS2kBm
7qOOuLOoa3qQhh5ZhBH3eE4sx+C2sFnYnHKzkTrMO0CkE3YfEt0ZQXJYrIPyaWea
UDtK6W7rRoq/7RXGw2Xw8gblk2P60wGK1lBOrEWGY46zufHfyUP4MUzYe2vbwW2i
mThLtcySF5+ty6NGBs/gIatrSGfgdomBgm6MzJlgQ4EabaGj4ugsY8yFtNJKFPI=
=idim
-----END PGP SIGNATURE-----
