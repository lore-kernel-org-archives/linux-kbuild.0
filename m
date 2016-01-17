Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg002.nifty.com ([202.248.44.40]:31922 "EHLO
	conssluserg002-v.nifty.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1752347AbcAQUaH (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 17 Jan 2016 15:30:07 -0500
Received: from mail-yk0-f181.google.com (mail-yk0-f181.google.com [209.85.160.181]) (authenticated)
	by conssluserg002-v.nifty.com with ESMTP id u0HKTuVf022583
	for <linux-kbuild@vger.kernel.org>; Mon, 18 Jan 2016 05:29:57 +0900
Received: by mail-yk0-f181.google.com with SMTP id x67so595889512ykd.2
        for <linux-kbuild@vger.kernel.org>; Sun, 17 Jan 2016 12:29:57 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <569B7D5D.1030904@gmail.com>
References: <569B7D5D.1030904@gmail.com>
Date: Mon, 18 Jan 2016 05:29:55 +0900
Message-ID: <CAK7LNAT9oiuQ81Ms-Piw2=OwX3mr+VzCQk2buy1T7yqRLKU40Q@mail.gmail.com>
Subject: Re: [U-Boot] Kconfig bug (optional choice deselected by following option)
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mateusz Kulikowski <mateusz.kulikowski@gmail.com>
Cc: "u-boot@lists.denx.de" <u-boot@lists.denx.de>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

Hi Mateusz,
(CCing linux-kbuild, which I think the best place to discuss this topic)


I think "default n" in the choice entry is weird
because the choice is not boolean.

Without it, the weird thing you saw did not happen on my box.


Anyway, I'd like Kconfig to say something if it is really a syntax error.


I hope comments from Kconfig experts.




2016-01-17 20:39 GMT+09:00 Mateusz Kulikowski <mateusz.kulikowski@gmail.com>:
> -----BEGIN PGP SIGNED MESSAGE-----
> Hash: SHA256
>
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
> -----BEGIN PGP SIGNATURE-----
> Version: GnuPG v2
>
> iQEcBAEBCAAGBQJWm31YAAoJELvtohmVtQzB7dEH/0/9BMe6+Oq38UVSUcjmNzaH
> GqUdkK9MN9tYD6euHTcynlT0HZRkDTYCOFmQjG68Lj1Ejx0/Si2KYe6NKexvkysB
> HAshC0+rGkbOgW0fkBByL2HY8PGAxtNbSbcwzC7xnhRMCkiPp2xiMy1pwRSOI7tN
> dDzXEuuTvGxsGHUm8dSuxGE9Wd96MY71BDzO+vQrP+CiCV7IeKYMfiYhngN6FEBz
> Sq5YCljVsSIvsZuBIaJlPuU7vnS64x2RnxkPskln9k4M9gv6GQOAcRb+YZ0PKLOs
> qSdzBTvQsEMBdsJBk2nGgBIXUcFSPbAAQwl1FyepFlgm4d6152Wf9BQxFJBNij4=
> =zry6
> -----END PGP SIGNATURE-----
> _______________________________________________
> U-Boot mailing list
> U-Boot@lists.denx.de
> http://lists.denx.de/mailman/listinfo/u-boot



-- 
Best Regards
Masahiro Yamada
