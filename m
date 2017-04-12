Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:17256 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755471AbdDLUjS (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 12 Apr 2017 16:39:18 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQmR374j_+9_yxwsuVoZ+KOHcDq83_R2VC7WEcpqmn1hA@mail.gmail.com>
References: <20170328011909.150513-1-mka@chromium.org> <CAK7LNATU+JNx2eZCTuqyws=CQL3Z2p6QJ7Oa0DNMvxbNJNH4Jg@mail.gmail.com>
 <20170330164106.GA2130@google.com> <CAK7LNARe61sBVL=zs7kb4BT5UgkBCYdKWa+esWZnT=j3idDdNw@mail.gmail.com>
 <20170410180804.GA28657@google.com> <CAK7LNAQmR374j_+9_yxwsuVoZ+KOHcDq83_R2VC7WEcpqmn1hA@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 13 Apr 2017 05:39:13 +0900
Message-ID: <CAK7LNARtG6NmDkR+gB8TrOXnRibgXoomdp7JpdfH5Kj2vKVhaw@mail.gmail.com>
Subject: Re: [PATCH] kbuild: use -Oz instead of -Os when using clang
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Matthias Kaehlcke <mka@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Behan Webster <behanw@converseincode.com>, Greg Hackmann <ghackmann@google.com>, Grant Grundler <grundler@chromium.org>, Michael Davidson <md@google.com>, Peter Foley <pefoley2@pefoley.com>

2017-04-12 12:38 GMT+09:00 Masahiro Yamada <yamada.masahiro@socionext.com>:
> Hi Matthias,
>
>
> 2017-04-11 3:08 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
>> Hi Masahiro,
>>
>> El Fri, Mar 31, 2017 at 02:57:43AM +0900 Masahiro Yamada ha dit:
>>
>>> 2017-03-31 1:41 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
>>> > El Fri, Mar 31, 2017 at 01:03:02AM +0900 Masahiro Yamada ha dit:
>>> >
>>> >> 2017-03-28 10:19 GMT+09:00 Matthias Kaehlcke <mka@chromium.org>:
>>> >> > This generates smaller resulting object code when compiled with clang.
>>> >> >
>>> >> > Signed-off-by: Matthias Kaehlcke <mka@chromium.org>
>>> >> > ---
>>> >> >  Makefile | 3 ++-
>>> >> >  1 file changed, 2 insertions(+), 1 deletion(-)
>>> >> >
>>> >> > diff --git a/Makefile b/Makefile
>>> >> > index b2faa9319372..66bcdbf58371 100644
>>> >> > --- a/Makefile
>>> >> > +++ b/Makefile
>>> >> > @@ -638,7 +638,8 @@ KBUILD_CFLAGS       += $(call cc-option,-fdata-sections,)
>>> >> >  endif
>>> >> >
>>> >> >  ifdef CONFIG_CC_OPTIMIZE_FOR_SIZE
>>> >> > -KBUILD_CFLAGS  += -Os $(call cc-disable-warning,maybe-uninitialized,)
>>> >> > +KBUILD_CFLAGS  += $(call cc-option,-Oz,-Os)
>>> >> > +KBUILD_CFLAGS  += $(call cc-disable-warning,maybe-uninitialized,)
>>> >> >  else
>>> >> >  ifdef CONFIG_PROFILE_ALL_BRANCHES
>>> >> >  KBUILD_CFLAGS  += -O2 $(call cc-disable-warning,maybe-uninitialized,)
>>> >> >
>>> >>
>>> >>
>>> >>
>>> >> This is the same as the following commit in LLVMLinux
>>> >> except Author/Signed-off-by.
>>> >>
>>> >> Who should the authorship really belong to?
>>> >
>>> > (this time without html, sorry for the noise)
>>> >
>>> > It should belong to Behan, I missed to add a 'From' tag, sorry about
>>> > that. Should I resend with the tag or can you fix it when applying the
>>> > patch?
>>>
>>>
>>> No need to re-send it.  I can fixup it manually.
>>
>> I couldn't locate this patch in your tree, has it been picked up?
>>
>
>
> I will pick this up shortly.  Sorry for the delay.
>


Applied to linux-kbuild/kbuild.  Thanks!



-- 
Best Regards
Masahiro Yamada
