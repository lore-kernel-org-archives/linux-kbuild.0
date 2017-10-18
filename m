Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:18041 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750829AbdJRQqM (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 18 Oct 2017 12:46:12 -0400
MIME-Version: 1.0
In-Reply-To: <20171013180243.25849-1-dianders@chromium.org>
References: <20171013180243.25849-1-dianders@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 19 Oct 2017 01:45:28 +0900
Message-ID: <CAK7LNAQ4Y1FR=YEjb1Tf6AT=qBne9+s-_-qwmijq75Z9OZWJZw@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Allow specifying some base host CFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Guenter Roeck <groeck@chromium.org>, vapier@chromium.org, Matthias Kaehlcke <mka@chromium.org>, dtor@chromium.org, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

2017-10-14 3:02 GMT+09:00 Douglas Anderson <dianders@chromium.org>:
> Right now there is a way to add some CFLAGS that affect target builds,
> but no way to add CFLAGS that affect host builds.  Let's add a way.
> We'll document two environment variables: CFLAGS_HOST and
> CXXFLAGS_HOST.
>
> We'll document that these variables get appended to by the kernel to
> make the final CFLAGS.  That means that, though the environment can
> specify some flags, if there is a conflict the kernel can override and
> win.  This works differently than KCFLAGS which is appended (and thus
> can override) the kernel specified CFLAGS.
>
> Why would I make KCFLAGS and CFLAGS_HOST work differently in this way?
> My argument is that it's about expected usage.  Typically the build
> system invoking the kernel has some idea about some basic CFLAGS that
> it wants to use to build things for the host and things for the
> target.  In general the build system would expect that its flags can
> be overridden if necessary (perhaps we need to turn off a warning when
> compiling a certain file, for instance).  So, all other things being
> equal, the way I'm making CFLAGS_HOST is the way I'd expect things to
> work.
>
> So, if it's expected that the build system can pass in a base set of
> flags, why didn't we make KCFLAGS work that way?  The short answer is:
> when building for the target the kernel is just "special".  The build
> system's "target" CFLAGS are likely intended for userspace programs
> and likely make very little sense to use as a basis.  This was talked
> about in the seminal commit 69ee0b352242 ("kbuild: do not pick up
> CFLAGS from the environment").  Basically: if the build system REALLY
> knows what it's doing then it can pass in flags that the kernel will
> use, but otherwise it should butt out.  Presumably this build system
> that really knows what it's doing knows better than the kernel so
> KCFLAGS comes after the kernel's normal flags.
>
> One last note: I chose to add new variables rather than just having
> the build system try to pass HOSTCFLAGS in somehow (either through the
> environment or the command line) to avoid weird interactions with
> recursive invocations of make.
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---

I'd like to know for-instance cases where this is useful.







-- 
Best Regards
Masahiro Yamada
