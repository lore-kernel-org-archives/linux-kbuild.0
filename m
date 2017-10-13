Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-03.nifty.com ([210.131.2.82]:25689 "EHLO
        conssluserg-03.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753135AbdJMLLR (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Oct 2017 07:11:17 -0400
MIME-Version: 1.0
In-Reply-To: <CAD=FV=Usox2axChyE7eOuMG7fPydC2_=ZrcX=uAzA+9z_Rsa-g@mail.gmail.com>
References: <1507800569-30134-1-git-send-email-yamada.masahiro@socionext.com> <CAD=FV=Usox2axChyE7eOuMG7fPydC2_=ZrcX=uAzA+9z_Rsa-g@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 13 Oct 2017 20:10:33 +0900
Message-ID: <CAK7LNASJErhzDjfBiHRUZOQuqm_k_g1hZ94C0AjfV40QvLontQ@mail.gmail.com>
Subject: Re: [PATCH] kbuild: shrink Makefile cache when it exceeds 1000 lines
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>, =?UTF-8?Q?Jan=2DSimon_M=C3=B6ller?= <dl9pf@gmx.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

2017-10-13 2:13 GMT+09:00 Doug Anderson <dianders@chromium.org>:
> Hi,
>
> On Thu, Oct 12, 2017 at 2:29 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> The cache files are only cleaned away by "make clean".  If you continue
>> incremental builds, the cache files will grow up little by little.
>> It is not a big deal in general use cases because $(call cc-option,...)
>> in not added/deleted quite often.
>>
>> However, if you do build-test for various architectures, compilers, and
>> kernel configurations, you will end up with huge cache files soon.
>>
>> The simple idea is to cut down the cache when it exceeds a certain
>> limit.  I wrote a simple method to check if nr_cache >= 1000.
>> If it is, shrink it by "tail -500".  This is not LRU strategy, but I
>> hope it will work well enough.
>
> The strategy seems sane to me.
>
>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>> If you have a better idea, please suggest it!
>>
>>
>>  scripts/Kbuild.include | 23 ++++++++++++++++++++++-
>>  1 file changed, 22 insertions(+), 1 deletion(-)
>>
>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> index 4203fff..db81df3 100644
>> --- a/scripts/Kbuild.include
>> +++ b/scripts/Kbuild.include
>> @@ -99,9 +99,30 @@ cc-cross-prefix =  \
>>
>>  # Include values from last time
>>  make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if $(obj),$(obj)/)).cache.mk
>> -$(make-cache): ;
>>  -include $(make-cache)
>>
>> +nr_cache := $(words $(filter __cached_%, $(.VARIABLES)))
>> +
>> +# Strip the last digit.  Covert as follows:
>> +#    0   ->
>> +#    123 -> 12
>> +strip_last_digit = $(filter-out $1,$(firstword \
>> +               $(sort $(foreach i,0 1 2 3 4 5 6 7 8 9,$(patsubst %$i,%,$1)))))
>> +
>> +# If cache exceeds 1000 lines, shrink it down to 500.  The Least Recently Added
>> +# lines are deleted. (not Least Recently Used, unfortunately)
>> +#
>> +# Evalucate [ ${nr_cache} -ge 1000 ] without relying on external tools.
>> +# Check if nr_cache is not empty even after the last three digits are stripped.
>> +ifneq ($(call strip_last_digit,$(call strip_last_digit,$(call strip_last_digit,$(nr_cache)))),)
>
> Cute trick.  ...but less work (and more self-documenting) is:
>
> ifdef $(word 1000,$(filter __cached_%, $(.VARIABLES)))
>
> AKA: if variable 1000 is defined then there must be 1000 or more variables.

Cool!
Thanks!


>> +.PHONY: $(make-cache)
>
> I'm not familiar with this use of .PHONY.  This is not really a PHONY
> target in this case since there's a real file, right?

Right.

First, I wanted to do like this:


$(make-cache): FORCE
       ...


FORCE is a Kbuild idion to force the re-build of the target.


If neither .PHONY nor FORCE is specified,
the action does not happen.

As you mentioned, the difference between two is
.PHONY suppressed the restart.

My motivation was make Kbuild.include self-contained
because FORCE is defined outside of Kbuild.include

But, your suggestion is much simpler.

>  Does this do
> something magic like prevent Make from starting all over again even
> though it updated this include?  Is there any documentation on this?
> I'd actually be tempted to _not_ tell "make" that we're changing this
> Makefile.  I'd leave the old "$(make-cache): ;" to be run always, then
> in this "if" statement just do this (untested):
>
> $(shell tail -n 500 $@ > $@.tmp; mv $@.tmp $@)

Yes.  I will do this in v2.
Thanks!


> ...we're already messing with the cache file behind "make"'s back in
> $(shell) calls so this is just another instance.  We really don't need
> "make" to decide that it needs to start all over again if it needs to
> "rebuild" this cache.
>
>> +$(make-cache):
>> +       tail -500 $@ > $@.tmp
>
> nit: "tail -n 500" is preferred, I believe.

Yes.

-- 
Best Regards
Masahiro Yamada
