Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from asavdk3.altibox.net ([109.247.116.14]:34157 "EHLO
        asavdk3.altibox.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965081AbeALTjC (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 12 Jan 2018 14:39:02 -0500
Date: Fri, 12 Jan 2018 20:38:57 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kconfig: Sync zconf.y with zconf.tab.c_shipped
Message-ID: <20180112193857.GA426@ravnborg.org>
References: <1507172808-12246-1-git-send-email-ulfalizer@gmail.com>
 <CAK7LNAT2_Su7=ADrVUsZ0EgTsyh_3QT=nWZV9E5DyFHFDhegbQ@mail.gmail.com>
 <CAFkk2KSZgjuNxq1keqbJtHsWF_c=opkBmu+_NyVUAnsHcTrM3Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAFkk2KSZgjuNxq1keqbJtHsWF_c=opkBmu+_NyVUAnsHcTrM3Q@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ulf Magnusson <ulfalizer@gmail.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.com>, Arnaud Lacombe <lacombar@gmail.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Ulf, Masahiro

> >
> > BTW, I do not know the historical reason
> > why zconf instead of kconf in the first place...
> 
> I have no idea either. kconfig.{l,y} and kconfig_*() would be a lot
> less confusing.

zconf was the name originally invented by Roman Zippel.
kconfig had the name "lc" in the original submission,
but was later renamed to kconfig.
And if memory serves me correct the original codebase used zconf.

The use of Kconfig for the files was first introduced here:
https://sourceforge.net/p/kbuild/mailman/message/8519479/
This was before lc aka kconfig was included in the kernel.

This was all in a period after the huge CML2 flamewars
which some oldies may remember.

Surfing dwom memory lane was fun - lot of mails.

This was also back when Keith Ownes attempt for a new generation
kbuild was rejected and Kai Germaschewski migrated the
old build system to something that was good and reliable.

Fun times indeed :-)
For some of the involved this was not fun at all - investing a lot
of time and then see it rejected is never fun.

	Sam
