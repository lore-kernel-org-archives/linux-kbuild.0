Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:23278 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751301AbdKTPzK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 20 Nov 2017 10:55:10 -0500
MIME-Version: 1.0
In-Reply-To: <20171119222703.GA12824@amd>
References: <20171119222703.GA12824@amd>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 21 Nov 2017 00:54:16 +0900
Message-ID: <CAK7LNARWMpxxC9hT8f7rGj5McjdNU1GXfjML9NbWFTCGyQ++dg@mail.gmail.com>
Subject: Re: v4.15-rc0 perl locale warnings
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Pavel Machek <pavel@ucw.cz>
Cc: kernel list <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2017-11-20 7:27 GMT+09:00 Pavel Machek <pavel@ucw.cz>:
> Hi!
>
> I'm getting quite a lot of perl warnings in v4.15-rc0.
>
> Any ideas what is going on there?

Sorry, I have no idea.


What I can tell is, the Kbuild pull requests in this MW
did not touch any perl scripts.



>
>                                                                         Pavel
>
>   CC      arch/arm/boot/compressed/fdt_rw.o
>   perl: warning: Setting locale failed.
>   perl: warning: Please check that your locale settings:
>         LANGUAGE = "en_US:en",
>                  LC_ALL = (unset),
>                         LC_COLLATE = "C",
>                                    LC_NUMERIC = "C",
>                                               LANG = "en_US.UTF-8"
>                                                   are supported and
>   installed on your system.
>   perl: warning: Falling back to the standard locale ("C").
>     CC      arch/arm/boot/compressed/fdt_ro.o
>     perl: warning: Setting locale failed.
>     perl: warning: Please check that your locale settings:
>           LANGUAGE = "en_US:en",
>                    LC_ALL = (unset),
>                           LC_COLLATE = "C",
>                                      LC_NUMERIC = "C",
>                                                 LANG = "en_US.UTF-8"
>                                                     are supported and
>   installed on your system.
>   perl: warning: Falling back to the standard locale ("C").
>     CC      arch/arm/boot/compressed/fdt_wip.o
>     perl: warning: Setting locale failed.
>     perl: warning: Please check that your locale settings:
>           LANGUAGE = "en_US:en",
>                    LC_ALL = (unset),
>                           LC_COLLATE = "C",
>                                      LC_NUMERIC = "C",
>                                                 LANG = "en_US.UTF-8"
>                                                     are supported and
>   installed on your system.
>   perl: warning: Falling back to the standard locale ("C").
>
> --
> (english) http://www.livejournal.com/~pavelmachek
> (cesky, pictures) http://atrey.karlin.mff.cuni.cz/~pavel/picture/horses/blog.html



-- 
Best Regards
Masahiro Yamada
