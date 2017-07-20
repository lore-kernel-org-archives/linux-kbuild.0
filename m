Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f67.google.com ([209.85.218.67]:36113 "EHLO
        mail-oi0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934382AbdGTKlq (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 20 Jul 2017 06:41:46 -0400
MIME-Version: 1.0
In-Reply-To: <20170720081712.GA11963@kroah.com>
References: <596fd414.fDkQ2LPtuAl0Zq0f%akpm@linux-foundation.org>
 <CAK8P3a1NXUw9oSb-YB+TGeQYd6-sNMW+S5E5FUV_0TuBGhKV_A@mail.gmail.com> <20170720081712.GA11963@kroah.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Thu, 20 Jul 2017 12:41:45 +0200
Message-ID: <CAK8P3a3qkoWR2b3TARPSthbRFCmBQY5nxYJmBmuQvB263jtW_w@mail.gmail.com>
Subject: Re: + kbuild-disable-wformat-truncation-warnings-by-default.patch
 added to -mm tree
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: gregkh <gregkh@linuxfoundation.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, mm-commits@vger.kernel.org, Linus Torvalds <torvalds@linux-foundation.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, stable <stable@vger.kernel.org>

On Thu, Jul 20, 2017 at 10:17 AM, gregkh <gregkh@linuxfoundation.org> wrote:
> On Thu, Jul 20, 2017 at 09:24:21AM +0200, Arnd Bergmann wrote:
>> On Wed, Jul 19, 2017 at 11:50 PM,  <akpm@linux-foundation.org> wrote:
>> > ------------------------------------------------------
>> > From: Arnd Bergmann <arnd@arndb.de>
>> > Subject: kbuild: disable -Wformat-truncation warnings by default
>> >
>> > With x86 allmodconfig, we currently get 233 -Wformat-truncation warnings,
>> > which makes the entire warnings rather useless.
>> >
>> > This turns off the warning by default, unless we specify W=1 or higher
>> >
>> > Link: http://lkml.kernel.org/r/20170714120720.906842-2-arnd@arndb.de
>> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> > Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
>> > ---
>> >
>> >  scripts/Makefile.extrawarn |    3 +++
>> >  1 file changed, 3 insertions(+)
>> >
>> > diff -puN scripts/Makefile.extrawarn~kbuild-disable-wformat-truncation-warnings-by-default scripts/Makefile.extrawarn
>> > --- a/scripts/Makefile.extrawarn~kbuild-disable-wformat-truncation-warnings-by-default
>> > +++ a/scripts/Makefile.extrawarn
>> > @@ -67,5 +67,8 @@ KBUILD_CFLAGS += $(call cc-disable-warni
>> >  KBUILD_CFLAGS += $(call cc-disable-warning, sign-compare)
>> >  KBUILD_CFLAGS += $(call cc-disable-warning, format-zero-length)
>> >  KBUILD_CFLAGS += $(call cc-disable-warning, uninitialized)
>> > +else
>> > +# noisy gcc-7 warnings
>> > +KBUILD_CFLAGS += $(call cc-option,-Wformat-truncation=0)
>> >  endif
>> >  endif
>>
>> Hi Andrew, Linus, Greg,
>>
>> I noticed that Linus has made a similar patch in 4.13-rc1, commit bd664f6b3e37
>> ("disable new gcc-7.1.1 warnings for now"), and it completely disables three
>> warnings (format-truncation, format-overflow and int-in-bool-context).
>>
>> Obviously there is no point in having both, so let's talk about what we
>> want for 4.13, stable-backports and for future kernels, I'll then send those
>> patches. Here is my first suggestion:
>>
>> - enable all three warnings with "make W=1" in 4.13, but leave them
>>   disabled by default.
>> - backport Linus' patch, plus the follow-up for W=1 to stable kernels,
>>   to allow stable kernels to build cleanly
>
> I don't care which of these, I'll take whatever is in Linus's tree.
>
> And I'll go backport that patch now as I'm getting annoyed by the
> warnings at the moment...

Yes, that's what I meant here, the follow-up obviously has to
be agreed on before that can be backported. Let me know what other
warnings you see on the stable kernels after backporting the
bd664f6b3e37 patch, I can help identify the fixes that went into
mainline to address those if you want.

>> - backport the patches that address any other gcc-7 warnings, as
>>   well as those that are not obvious false-positives to stable kernels
>
> I'll do that as well, as I notice them go by.
>
>> - In 4.14+, use my version above and address all int-in-bool-context
>>   and format-overflow warnings, but only use -Wformat-truncation
>>   with make W=1.
>
> I don't really care about this, as long as we are not forced to do
> "silly things" like some of the patches seemed to do :)

Sure, I understand that from the previous feedback, and for a couple
of patches I found better workarounds (that improve the code
while fixing the warning, rather than adding hacks). I also
reported two of them in gcc bugzilla already, one was decided
to be invalid:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81484

the other one looks valid, but possibly hard to fix:

https://gcc.gnu.org/bugzilla/show_bug.cgi?id=81483

When I go through the remaining patches again, I'll have a
look at what others might be incorrect warnings that should
be fixed in gcc, or which ones can be fixed in a better way.
I just wanted to first make sure that there is no fundamental
objections to enabling the warnings in future kernels (at
whichever W= level) at all.

       Arnd
