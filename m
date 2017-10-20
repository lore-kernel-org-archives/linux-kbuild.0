Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f178.google.com ([209.85.217.178]:50003 "EHLO
        mail-ua0-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751070AbdJTFGx (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 20 Oct 2017 01:06:53 -0400
Received: by mail-ua0-f178.google.com with SMTP id h34so7550180uaa.6
        for <linux-kbuild@vger.kernel.org>; Thu, 19 Oct 2017 22:06:52 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQ4Y1FR=YEjb1Tf6AT=qBne9+s-_-qwmijq75Z9OZWJZw@mail.gmail.com>
References: <20171013180243.25849-1-dianders@chromium.org> <CAK7LNAQ4Y1FR=YEjb1Tf6AT=qBne9+s-_-qwmijq75Z9OZWJZw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Thu, 19 Oct 2017 22:06:51 -0700
Message-ID: <CAD=FV=U5OdrTMzb4niWDkjDUrf8-rV1NXcVR-XYXmKp=D5qkKw@mail.gmail.com>
Subject: Re: [RFC PATCH] kbuild: Allow specifying some base host CFLAGS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Guenter Roeck <groeck@chromium.org>, Mike Frysinger <vapier@chromium.org>, Matthias Kaehlcke <mka@chromium.org>, Dmitry Torokhov <dtor@chromium.org>, =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= <u.kleine-koenig@pengutronix.de>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Michal Marek <michal.lkml@markovi.net>

Hi,

On Wed, Oct 18, 2017 at 9:45 AM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> 2017-10-14 3:02 GMT+09:00 Douglas Anderson <dianders@chromium.org>:
>> Right now there is a way to add some CFLAGS that affect target builds,
>> but no way to add CFLAGS that affect host builds.  Let's add a way.
>> We'll document two environment variables: CFLAGS_HOST and
>> CXXFLAGS_HOST.
>>
>> We'll document that these variables get appended to by the kernel to
>> make the final CFLAGS.  That means that, though the environment can
>> specify some flags, if there is a conflict the kernel can override and
>> win.  This works differently than KCFLAGS which is appended (and thus
>> can override) the kernel specified CFLAGS.
>>
>> Why would I make KCFLAGS and CFLAGS_HOST work differently in this way?
>> My argument is that it's about expected usage.  Typically the build
>> system invoking the kernel has some idea about some basic CFLAGS that
>> it wants to use to build things for the host and things for the
>> target.  In general the build system would expect that its flags can
>> be overridden if necessary (perhaps we need to turn off a warning when
>> compiling a certain file, for instance).  So, all other things being
>> equal, the way I'm making CFLAGS_HOST is the way I'd expect things to
>> work.
>>
>> So, if it's expected that the build system can pass in a base set of
>> flags, why didn't we make KCFLAGS work that way?  The short answer is:
>> when building for the target the kernel is just "special".  The build
>> system's "target" CFLAGS are likely intended for userspace programs
>> and likely make very little sense to use as a basis.  This was talked
>> about in the seminal commit 69ee0b352242 ("kbuild: do not pick up
>> CFLAGS from the environment").  Basically: if the build system REALLY
>> knows what it's doing then it can pass in flags that the kernel will
>> use, but otherwise it should butt out.  Presumably this build system
>> that really knows what it's doing knows better than the kernel so
>> KCFLAGS comes after the kernel's normal flags.
>>
>> One last note: I chose to add new variables rather than just having
>> the build system try to pass HOSTCFLAGS in somehow (either through the
>> environment or the command line) to avoid weird interactions with
>> recursive invocations of make.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>> ---
>
> I'd like to know for-instance cases where this is useful.

I'm not sure I have any exact use cases.  I know vapier@ (CCed) was
pushing for making sure that these flags get passed from the portage
ebuild into the kernel build, so maybe he has some cases?  Right now
we have the "-pipe" flag that ought to be passed in to the host
compiler but we're dropping it on the floor, but that doesn't seem
terribly critical.

...but in general the Linux kernel doesn't have all the details about
the host system.  That means it can't necessarily build the tools
quite as optimally (it can't pass "-mtune, right?).  I could also
imagine that there could be ABI flags that need to be specified?  Like
if we had floating point math in a host tool it would be important
that the build system could tell the kernel what to use for
"-mfloat-abi".

...so basically: it's all theoretical at this point in time from my
point of view, but I can definitely understand how it could be
necessary in the right environment.


-Doug
