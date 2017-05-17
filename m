Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-oi0-f66.google.com ([209.85.218.66]:32950 "EHLO
        mail-oi0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751676AbdEQHf6 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 17 May 2017 03:35:58 -0400
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XENNp3rcD5OK1d2WmccbqaT9=bjsayvbnA2Th8zmOAwg@mail.gmail.com>
References: <20170421213931.155210-1-mka@chromium.org> <20170421213931.155210-3-mka@chromium.org>
 <CAD=FV=XENNp3rcD5OK1d2WmccbqaT9=bjsayvbnA2Th8zmOAwg@mail.gmail.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Wed, 17 May 2017 09:35:57 +0200
Message-ID: <CAK8P3a1y0MoxhMNr2v=R7-CANaATfFy58FM8heyOP78g-JZwHA@mail.gmail.com>
Subject: Re: [PATCH 2/2] kbuild: clang: Disable the 'duplicate-decl-specifier' warning
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Matthias Kaehlcke <mka@chromium.org>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, Grant Grundler <grundler@chromium.org>, Greg Hackmann <ghackmann@google.com>, Michael Davidson <md@google.com>

On Tue, May 16, 2017 at 11:41 PM, Doug Anderson <dianders@chromium.org> wrote:
> Hi
>
> On Fri, Apr 21, 2017 at 2:39 PM, Matthias Kaehlcke <mka@chromium.org> wrote:
>> clang generates plenty of these warnings in different parts of the code.
>> They are mostly caused by container_of() and other macros which declare
>> a "const <type> *" variable for their internal use which triggers a
>> "duplicate 'const' specifier" warning if the <type> is already const
>> qualified.
>>
>> Wording-mostly-from: Michael Davidson <md@google.com>
>> Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>> ---
>>  Makefile | 1 +
>>  1 file changed, 1 insertion(+)
>>
>> diff --git a/Makefile b/Makefile
>> index df5abf346354..6cd6d428db43 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -704,6 +704,7 @@ KBUILD_CFLAGS += $(call cc-disable-warning, unused-variable)
>>  KBUILD_CFLAGS += $(call cc-disable-warning, format-invalid-specifier)
>>  KBUILD_CFLAGS += $(call cc-disable-warning, gnu)
>>  KBUILD_CFLAGS += $(call cc-disable-warning, address-of-packed-member)
>> +KBUILD_CFLAGS += $(call cc-disable-warning, duplicate-decl-specifier)
>>  # Quiet clang warning: comparison of unsigned expression < 0 is always false
>>  KBUILD_CFLAGS += $(call cc-disable-warning, tautological-compare)
>>  # CLANG uses a _MergedGlobals as optimization, but this breaks modpost, as the
>
> It seems like gcc 7 may have the same warning.  Specifically I saw a
> patch fly by from Arnd, which you can find in Mark Brown's tree now:
>
> https://git.kernel.org/pub/scm/linux/kernel/git/broonie/sound.git/commit/?h=topic/rt5614&id=03ba791df98d15d07ea74075122af71e35c7611c
>
>
> +Arnd since he may be trying to solve the same issues?

gcc-7 has a warning option with the same name, and I think I have
fixed all the occurrences we got in mainline (some patches my still
be in flight). However, it seems that only clang warns about
'const typeof(type)' with 'type' being already const.

I have not looked at clang warnings in a while, how many of these do
we get overall (aside from container_of)? We might be able
to turn off this particular warning by sprinkling in
'_Pragma("clang diagnostic push") _Pragma("clang diagnostic
ignored \"-Wduplicate-decl-specifier\"")' inside of the macro
(not sure if clang allows it there, gcc-4.4 and earlier I think did
not).

It might also be useful to open a bug against clang so they can
change it in future releases, as the gcc behavior seems more
sensible in this instance.

       Arnd
