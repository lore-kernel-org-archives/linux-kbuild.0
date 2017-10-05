Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:31152 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751209AbdJEH1i (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 5 Oct 2017 03:27:38 -0400
MIME-Version: 1.0
In-Reply-To: <CAD=FV=XQfLf+5ZPe4Vfqn1kpdom16YT7Nj=mw2Qydk1hmbL=pg@mail.gmail.com>
References: <20170926175508.29950-1-dianders@chromium.org> <20170926175508.29950-2-dianders@chromium.org>
 <CAK7LNASCy-zMNF1-7gie4NhyKC8xhAtyVHatpQ7JYLUz6UiG0w@mail.gmail.com> <CAD=FV=XQfLf+5ZPe4Vfqn1kpdom16YT7Nj=mw2Qydk1hmbL=pg@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 5 Oct 2017 16:26:51 +0900
Message-ID: <CAK7LNATdp47x3_gyi6pB+NLfoczECULPMkfx2N=eGOWm2DwqdQ@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Add a cache for generated variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

Hi Douglas,


2017-10-05 7:38 GMT+09:00 Doug Anderson <dianders@chromium.org>:
> Hi,
>
> On Tue, Oct 3, 2017 at 9:05 PM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Thanks for the patches.  The idea is interesting.
>>
>> I am not a Chrome developer, but cc-option could be improved somehow.
>>
>>
>> I examined two approaches to mitigate the pain.
>>
>> [1] Skip cc-option completely when we run non-build targets
>>     such as "make help", "make clean", etc.
>>
>> [2] Cache the result of cc-option like this patch
>>
>>
>> I wrote some patches for [1]
>> https://patchwork.kernel.org/patch/9983825/
>> https://patchwork.kernel.org/patch/9983829/
>> https://patchwork.kernel.org/patch/9983833/
>> https://patchwork.kernel.org/patch/9983827/
>>
>> Comments are welcome.  :)
>
> OK, I'll take a look at them.  I'm not massively familiar with the
> kernel Makefiles, but hopefully I can figure some of it out.  :-P
>
>
>> [1] does not solve the slowness in the incremental build.
>> Instead, it makes non-build targets faster
>> from a clean source tree because cc-option is zero cost.
>>
>>
>> [2] solves the issues in the incremental build.
>> One funny thing is, it computes cc-option and store the cache file
>> even for "make clean", where we know the cache file will be
>> immediately deleted.
>>
>>
>> We can apply [1] or [2], or maybe both of them
>> because [1] and [2] are trying to solve the different issues.
>
> Yeah, I'm much more interested in [2] than [1].  I run incremental
> builds almost constantly and hate the slowness.  :(  I can certainly
> appreciate that the inefficient compiler setup in Chrome OS isn't your
> problem and that an extra .5 seconds for an incremental build for most
> people isn't that huge, though.  ...but I'l probably move forward with
> [2] since it still helps me a lot and still should help others.
> Solving [1] seems worthwhile too, though...


I agree.

[2] is more helpful because developers spend most of time
for the incremental build.

[1] can improve it even more, but it just addresses some minor issues.



>
>> The cache approach seemed clever, but I do not like the implementation.
>> The code is even more unreadable with lots of escape sequence.
>>
>>
>> Here is my suggestion for simpler implementation (including bike-shed)
>>
>>
>> Implement a new function "shell-cache".  It works like $(shell ...)
>>
>> The difference is
>> $(call shell-cached,...) returns the cached result, or run the command
>> if not cached.
>>
>>
>>
>> Also, add try-run-cached.  This is a cached variant of try-run.
>>
>>
>> I just played with it, and seems working.
>> (I did not have spend much time for testing, more wider test is needed.)
>>
>>
>> The code is like something like this:
>>
>>
>>
>> make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if
>> $(obj),$(obj)/)).cache.mk
>>
>> -include $(make-cache)
>
> Thanks, this is much better!  :)
>
>
>> define __run-and-store
>> ifeq ($(origin $(1)),undefined)
>>   $$(eval $(1) := $$(shell $$2))
>>   $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
>> endif
>> endef
>
> I like your idea.  Essentially you're saying that we can just defer
> the shell command, which was the really essential part that needed to
> be deferred.  Nice!  It seems much nicer / cleaner.  Still a tiny bit
> of voodoo, but with all of your improvements the voodoo is at least
> contained to a very small part of the file.
>
> OK, things seem pretty nice with this and I'll submit out a new patch.
> I'm a bit conflicted about whether I should put myself as authorship
> or you, since mostly the patch is your code now.  ;-)  For now I'll
> leave my authorship but feel free to claim it and change me to just
> "Suggested-by".  :-)


No worry.
Without your patches, I would have never come up with this.
The code improvement happened in general review process.



> NOTE: one thing I noticed about your example code is that you weren't
> always consistent about $(1) vs. $1.  I've changed things to be
> consistent at the expense of extra parenthesis.  If you hate it, let
> me know.

I accept your choice.
Keeping the consistent coding style is good.


If we decide to use $1 instead of $(1),
we should convert all instances tree-wide
for consistency.



>>
>> __set-and-store takes two arguments,
>> but here, it is called with one argument __cached_$(1)
>>
>> Probably, $$(try-run, ...) will be passed as $2,
>> but I do not know why this works.
>
> Whew!  It's not just me that's confused by all this...  ;-)  It looks
> like you continued to use this in your suggestion, so I guess you
> thought it was useful, at least...  Yeah, it's a bit of magic.  The
> goal was to have one less set of evaluating and passing going around.
>
> So really '__set-and-store' takes _1_ argument.  It outputs a string
> where it uses this argument.  Also part of the output string is a
> reference to $(2).  This will refer to the caller's second variable.
>
> ===
>
> Maybe a "simpler" example?
>
> define example
> $$(eval $(1) := $$(2))
> endef
>
> ex_usage = $(eval $(call example,$(1)))$($(1))
>
> .PHONY: ex
> ex:
>   @echo $(call ex_usage,myvar,myval)
>   @echo $(myvar)
>
> If you do "make ex" you'll see "myval" printed twice.
>
> --
>
> Walking through that, let's first remove the "call" which we can do in
> this case pretty easily because there are no "ifdefs", unlike the real
> code.  Since the first argument to "example" is $(1), the above is the
> same as:
>
> ex_usage = $(eval $$(eval $(1) := $$(2)))$($(1))
>
> ...now we need to resolve that recursively where $(1) is 'myvar' and
> $(2) is 'myval'.  So we get:
>
> 1. $(eval $$(eval $(1) := $$(2)))$($(1))
> 2. $(eval $$(eval myvar := $$(2)))$(myvar)
> 3. $(eval myvar := $(2))$(myvar)
> 4. $(eval myvar := myval)$(myvar)


This example is very helpful!

Now I understood this.
Thanks for clear explanation!



> --
>
> An alternate version of my "simpler" example that doesn't use this magic:
>
> define example
> $$(eval $(1) := $(2))
> endef
>
> ex_usage = $(eval $(call example,$(1),$(2)))$($(1))
>
> .PHONY: ex
> ex:
>   @echo $(call ex_usage,myvar,myval)
>   @echo $(myvar)
>
> ...that works OK for the simple example case but you get into weird
> esoteric issues because of the extra eval.  You'll find that the two
> definitions behave differently for:
>
>   @echo $(call ex_usage,myvar,my$$$$(cat /proc/cmdline)val)
>
> ...in that example the "intention" is that bash should be passed the
> string: echo my$(cat /proc/cmdline)val, so it escapes the "$" once to
> "defer" it and twice because it wants the "$" to go through to bash.


You are right.

If we want to get the same result by using the alternate version,
we need one more level of escaping, so end up with crazy escaping:

      @echo $(call ex_usage,myvar,my$$$$$$$$(cat /proc/cmdline)val)

So, the magic is unclear, but very helpful.



>>>
>>>  # __cc-option
>>>  # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
>>> -__cc-option = $(call try-run,\
>>> -       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
>>> +__cc-option = \
>>> +       $(call cached-val,$(call __sanitize-opt,__cc_opt_$(1)_$(2)_$(3)_$(4)),\
>>> +       $$(call try-run,\
>>> +       $(call __comma,$(1)) -Werror \
>>> +       $(call __comma,$(2)) \
>>> +       $(call __comma,$(3)) -c -x c /dev/null \
>>> +       -o "$$$$TMP",$(call __comma,$(strip $(3))),$(call __comma,$(strip $(4)))))
>>
>>
>> I did not follow how this was working here...
>
> Hoo boy.  Let's see...  Which part were you curious about?  I can try
> to explain the bits and you can tell me if I got them all.  Note that
> many of these aren't super important anymore since they're not needed
> with your improvements:

Right, all of these are not necessary any more.
I did not mean that you should explain all of these.

I did not want read them,
so I started to consider simpler idea that I can understand.

Sorry if you used much time for me,
but this discussion helped me a lot to understand it deeply.

>
>
> * $(call __sanitize-opt,__cc_opt_$(1)_$(2)_$(3)_$(4)):
>
> Tries to make a variable name that will be different if you have any
> different parameters.

Yes, this is an easy part.

>
> * $$(call try-run
>
> The "$$" around this call is because it's deferred and a general
> concept for "cached-val".  If (and only if) we decide that we need to
> recompute this value then we'll run this through an "eval".  By having
> the $$ then this action won't be taken unless the string is eval-ed.
> Note that plenty of stuff _will_ still happen right away, though.  All
> of the $(call __comma,$(1)) are _not_ deferred.  That's fine since
> that doesn't lead to a fork-exec and thus isn't "expensive".

Actually, I could not understand how this worked in v1,
but with the help of your simplified example above,
the intention is clear.  Thanks.



> *  $(call __comma,$(1))
>
> I'll admit that I didn't dig all the way into this.  I found at least
> one case where "make" was incorrectly mixing up arguments due to the
> "eval" and the "__comma" fixed it.  I decided it was important to do
> this for all arguments.  Possibly other things might need to be
> escaped too, but I didn't find any cases that needed it...  ...but no
> longer needed with your improvements...

OK, this is probably for corner cases, not that important part.

>
> * $$$$TMP
>
> An extra level of escaping is needed since it goes through an extra
> "eval".  This means $$ => $$$$

This is now clear to me
with the simplified example and its alternate version.


>
> * $(strip $(3))
>
> This was important because otherwise the cache otherwise wasn't
> completely "stable".  If you ran "make" the first time you'd get a
> cache, then running "make" the 2nd time would give you extra entries
> in the cache.  After the 3rd time you were OK, but it seemed nice to
> make it stable faster.
>
> To understand this, first understand that some people call __cc_option
> with a space after the ','.  Make treats this as important, thus these
> two are different:
>
> val := $(call cc-option, -opt1, -opt2)
> val := $(call cc-option,-opt1,-opt2)
>
> In one case val would be " -opt1" or " -opt2".  In the other case
> "-opt1" or "-opt2".
>
> However, when we cache things the space suddenly becomes irrelevant.
> That's because we've end up with something like:
>
>   __cached_result :=  -opt1
>
> ...and even though there are two spaces after the ":=" make throws that away.
>
> The result of all of that is that we'd get slightly different numbers
> of spaces after the cache was populated.  That could probably be
> ignored except that some flags are additive and previous flags are
> passed as arguments to later calls to __cc-option.  That means that
> previous flags are passed to __sanitize-opt.  ...and in __sanitize-opt
> spaces are significant.  ...so you'd come up with a slightly different
> variable name on the first run and the subsequent runs...
>
> Probably waaaay more than you expected for a simple $(strip) call, huh?

Understood.
The whitespace problem is nasty.


> In any case this doesn't seem to matter anymore with your improvements
> (I didn't dig into why), though I have noticed that the cache does
> still return slightly different spacing for some of the results...
>

As far as I tested, I always see only one space after ":=" in v2.

I did not consider this deeply,
but something is working nicely behind the scene.





-- 
Best Regards
Masahiro Yamada
