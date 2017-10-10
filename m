Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:34492 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755424AbdJJAJu (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 9 Oct 2017 20:09:50 -0400
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VKoJs=TEh=ddHLOE4b-p3BC5e30PCcgxtqqyEuy6fMkw@mail.gmail.com>
References: <1507089367-10402-1-git-send-email-yamada.masahiro@socionext.com>
 <1507089367-10402-3-git-send-email-yamada.masahiro@socionext.com> <CAD=FV=VKoJs=TEh=ddHLOE4b-p3BC5e30PCcgxtqqyEuy6fMkw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Tue, 10 Oct 2017 09:08:57 +0900
Message-ID: <CAK7LNAQrLkjQ=PqC43r_eKgddN246=tQm3DKrad0y9+f7wpRng@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: re-order the code to not parse unnecessary variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

2017-10-10 7:03 GMT+09:00 Doug Anderson <dianders@chromium.org>:
> Hi,
>
> On Tue, Oct 3, 2017 at 8:56 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> The top Makefile is divided into some sections such as mixed targets,
>> config targets, build targets, etc.
>>
>> When we build mixed targets, Kbuild just invokes submake to process
>> them one by one.  In this case, compiler-related variables like CC,
>> KBUILD_CFLAGS, etc. are unneeded.
>>
>> Check what kind of targets we are building first, then parse necessary
>> variables for building them.
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  Makefile | 233 ++++++++++++++++++++++++++++++++-------------------------------
>>  1 file changed, 118 insertions(+), 115 deletions(-)
>
> I'm even further outside my comfort zone with this big of a change,
> but I will say that as far as I can tell this seems like a good
> change.  If it were me I'd have probably broken it up into several
> tinier changes that were each massively easy to check/verify, but
> presumably for those who know the Makefile better then rolling them
> together is fine.  ;)
>
> I're spent some time reviewing this (not tons--maybe an hour or so),
> but IMHO I don't know this well enough to add a Reviewed-by tag.
>
>
>> diff --git a/Makefile b/Makefile
>> index 39a7c03..a4fd682 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -186,15 +186,6 @@ ifeq ("$(origin M)", "command line")
>>    KBUILD_EXTMOD := $(M)
>>  endif
>>
>> -# If building an external module we do not care about the all: rule
>> -# but instead _all depend on modules
>> -PHONY += all
>> -ifeq ($(KBUILD_EXTMOD),)
>> -_all: all
>> -else
>> -_all: modules
>> -endif
>> -
>>  ifeq ($(KBUILD_SRC),)
>>          # building in the source tree
>>          srctree := .
>> @@ -206,6 +197,9 @@ else
>>                  srctree := $(KBUILD_SRC)
>>          endif
>>  endif
>> +
>> +export KBUILD_CHECKSRC KBUILD_EXTMOD KBUILD_SRC
>
> The old Makefile also used to export KBUILD_SRC, but I'm not sure why.
> Shouldn't this be implicit because KBUILD_SRC always comes from a
> command line parameter or environment variable?


As the comment line around line 109 says,
"KBUILD_SRC is not intended to be used by the regular user (for now)"


It is set by "sub-make" around line 143:

sub-make:
         $(Q)$(MAKE) -C $(KBUILD_OUTPUT) KBUILD_SRC=$(CURDIR) \
         -f $(CURDIR)/Makefile $(filter-out _all sub-make,$(MAKECMDGOALS))



I'd like to improve it in the future,
but currently KBUILD_SRC works like that.

But, you are right.
I also thought "export KBUILD_SRC" is redundant.
KBUILD_SRC=$(CURDIR) implies exporting it.


I see some more redundant exporting
for variables we know they only come from command line or environment.


I think cleaning-up is OK, but should be
separated to another patch just in case.
(my commit claims I am just changing the code order...)




-- 
Best Regards
Masahiro Yamada
