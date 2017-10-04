Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:49427 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751188AbdJDWiI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 18:38:08 -0400
Received: by mail-wr0-f172.google.com with SMTP id p10so7836099wrc.6
        for <linux-kbuild@vger.kernel.org>; Wed, 04 Oct 2017 15:38:07 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASCy-zMNF1-7gie4NhyKC8xhAtyVHatpQ7JYLUz6UiG0w@mail.gmail.com>
References: <20170926175508.29950-1-dianders@chromium.org> <20170926175508.29950-2-dianders@chromium.org>
 <CAK7LNASCy-zMNF1-7gie4NhyKC8xhAtyVHatpQ7JYLUz6UiG0w@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 4 Oct 2017 15:38:04 -0700
Message-ID: <CAD=FV=XQfLf+5ZPe4Vfqn1kpdom16YT7Nj=mw2Qydk1hmbL=pg@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Add a cache for generated variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Guenter Roeck <groeck@chromium.org>, Brian Norris <briannorris@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

Hi,

On Tue, Oct 3, 2017 at 9:05 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Thanks for the patches.  The idea is interesting.
>
> I am not a Chrome developer, but cc-option could be improved somehow.
>
>
> I examined two approaches to mitigate the pain.
>
> [1] Skip cc-option completely when we run non-build targets
>     such as "make help", "make clean", etc.
>
> [2] Cache the result of cc-option like this patch
>
>
> I wrote some patches for [1]
> https://patchwork.kernel.org/patch/9983825/
> https://patchwork.kernel.org/patch/9983829/
> https://patchwork.kernel.org/patch/9983833/
> https://patchwork.kernel.org/patch/9983827/
>
> Comments are welcome.  :)

OK, I'll take a look at them.  I'm not massively familiar with the
kernel Makefiles, but hopefully I can figure some of it out.  :-P


> [1] does not solve the slowness in the incremental build.
> Instead, it makes non-build targets faster
> from a clean source tree because cc-option is zero cost.
>
>
> [2] solves the issues in the incremental build.
> One funny thing is, it computes cc-option and store the cache file
> even for "make clean", where we know the cache file will be
> immediately deleted.
>
>
> We can apply [1] or [2], or maybe both of them
> because [1] and [2] are trying to solve the different issues.

Yeah, I'm much more interested in [2] than [1].  I run incremental
builds almost constantly and hate the slowness.  :(  I can certainly
appreciate that the inefficient compiler setup in Chrome OS isn't your
problem and that an extra .5 seconds for an incremental build for most
people isn't that huge, though.  ...but I'l probably move forward with
[2] since it still helps me a lot and still should help others.
Solving [1] seems worthwhile too, though...


> The cache approach seemed clever, but I do not like the implementation.
> The code is even more unreadable with lots of escape sequence.
>
>
> Here is my suggestion for simpler implementation (including bike-shed)
>
>
> Implement a new function "shell-cache".  It works like $(shell ...)
>
> The difference is
> $(call shell-cached,...) returns the cached result, or run the command
> if not cached.
>
>
>
> Also, add try-run-cached.  This is a cached variant of try-run.
>
>
> I just played with it, and seems working.
> (I did not have spend much time for testing, more wider test is needed.)
>
>
> The code is like something like this:
>
>
>
> make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if
> $(obj),$(obj)/)).cache.mk
>
> -include $(make-cache)

Thanks, this is much better!  :)


> define __run-and-store
> ifeq ($(origin $(1)),undefined)
>   $$(eval $(1) := $$(shell $$2))
>   $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
> endif
> endef

I like your idea.  Essentially you're saying that we can just defer
the shell command, which was the really essential part that needed to
be deferred.  Nice!  It seems much nicer / cleaner.  Still a tiny bit
of voodoo, but with all of your improvements the voodoo is at least
contained to a very small part of the file.

OK, things seem pretty nice with this and I'll submit out a new patch.
I'm a bit conflicted about whether I should put myself as authorship
or you, since mostly the patch is your code now.  ;-)  For now I'll
leave my authorship but feel free to claim it and change me to just
"Suggested-by".  :-)

NOTE: one thing I noticed about your example code is that you weren't
always consistent about $(1) vs. $1.  I've changed things to be
consistent at the expense of extra parenthesis.  If you hate it, let
me know.


> # $(call,shell-cached,my_command)
> # This works like $(shell my_command), but the result is cached
> __shell-cached = $(eval $(call __run-and-store,$1))$($1)
> shell-cached = $(call __shell-cached,__cached_$(call __sanitize-opt,$(1)),$1)
>
> ...
>
>
> __try-run = set -e; \
>      TMP="$(TMPOUT).$$$$.tmp"; \
>      TMPO="$(TMPOUT).$$$$.o"; \
>      if ($(1)) >/dev/null 2>&1; \
>      then echo "$(2)"; \
>      else echo "$(3)"; \
>      fi; \
>      rm -f "$$TMP" "$$TMPO"
>
> # try-run
> # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
> # Exit code chooses option. "$$TMP" serves as a temporary file and is
> # automatically cleaned up.
> try-run = $(shell $(__try-run))
>
> # try-run-cached
> # This works like try-run, but the result is cached.
> try-run-cached = $(call shell-cached,$(__try-run))
>
>
>
>
> Then, you can replace
>
>   $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)
>
> with
>
>   $(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh
> $(CC) $(KBUILD_CFLAGS)
>
>
>
>
> replace
>
> __cc-option = $(call try-run,\
>          $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
>
> with
>
> __cc-option = $(call try-run-cached,\
>          $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
>
>
>
>
> What do you think?

Yes, much better!  Due to where you've placed this I now seem to get
by without my $(call __comma,...) calls and also the "$$$$"
conversion.  Yay!

...interestingly I need to add ":" to the "__sanitize-opt" now,
though.  That's for the arm64 line:

  brokengasinst := $(call as-instr,1:\n.inst 0\n.rept . -
1b\n\nnop\n.endr\n,,-DCONFIG_BROKEN_GAS_INST=1)



> A little more comments below.
>
>
>
>
>> +# Tools for caching Makefile variables that are "expensive" to compute.
>> +#
>> +# Here we want to help deal with variables that take a long time to compute
>> +# by making it easy to store these variables in a cache.
>> +#
>> +# The canonical example here is testing for compiler flags.  On a simple system
>> +# each call to the compiler takes 10 ms, but on a system with a compiler that's
>> +# called through various wrappers it can take upwards of 100 ms.  If we have
>> +# 100 calls to the compiler this can take 1 second (on a simple system) or 10
>> +# seconds (on a complicated system).
>> +#
>> +# The "cache" will be in Makefile syntax and can be directly included.
>> +# Any time we try to reference a variable that's not in the cache we'll
>> +# calculate it and store it in the cache for next time.
>> +
>> +# Include values from last time
>> +-include Makefile-cache.o
>
>
> Kbuild.include is included, so is Makefile-cache.o
> every time the build system descend into sub-directories.
>
> It is not efficient to include cached data unneeded in sub-directories.
> I prefixed $(obj)/
>
> Another problem is when building external modules.
> Makefile-cache.o is always created/updated in the kernel build tree.
>
> When we build external modules, the kernel source may be located under
> /usr/src/ , which is generally read-only for normal users.
> So, I prefixed $(KBUILD_EXTMOD) to create the cache file
> in the module tree if KBUILD_EXTMOD is defined.
>
> I do not like the suffix .o
> I prefer file name to be something else
> that starts with . to hide it.

Thanks for all the improvements!


>> +# Usage:   $(call cached-val,variable_name,escaped_expensive_operation)
>> +# Example: $(call cached-val,md5_val,$$(shell md5sum /usr/bin/gcc)
>> +#
>> +# If the variable is already defined we'll just use it.  If it's not, it will
>> +# be calculated and stored in a persistent (disk-based) cache for the next
>> +# invocation of Make.  The call will evaluate to the value of the variable.
>> +#
>> +# This is a bit of voodoo, but basic explanation is that if the variable
>> +# was undefined then we'll evaluate the expensive operation and store it into
>> +# the variable.  We'll then store that value in the cache and finally output
>> +# the value.
>> +define __set-and-store
>> +ifeq ($(origin $(1)),undefined)
>> +  $$(eval $(1) := $$(2))
>> +  $$(shell echo '$(1) := $$($(1))' >> Makefile-cache.o)
>> +endif
>> +endef
>> +cached-val = $(eval $(call __set-and-store,__cached_$(1)))$(__cached_$(1))
>
>
> This seems working, but I do not understand this trick.
>
>
> __set-and-store takes two arguments,
> but here, it is called with one argument __cached_$(1)
>
> Probably, $$(try-run, ...) will be passed as $2,
> but I do not know why this works.

Whew!  It's not just me that's confused by all this...  ;-)  It looks
like you continued to use this in your suggestion, so I guess you
thought it was useful, at least...  Yeah, it's a bit of magic.  The
goal was to have one less set of evaluating and passing going around.

So really '__set-and-store' takes _1_ argument.  It outputs a string
where it uses this argument.  Also part of the output string is a
reference to $(2).  This will refer to the caller's second variable.

===

Maybe a "simpler" example?

define example
$$(eval $(1) := $$(2))
endef

ex_usage = $(eval $(call example,$(1)))$($(1))

.PHONY: ex
ex:
  @echo $(call ex_usage,myvar,myval)
  @echo $(myvar)

If you do "make ex" you'll see "myval" printed twice.

--

Walking through that, let's first remove the "call" which we can do in
this case pretty easily because there are no "ifdefs", unlike the real
code.  Since the first argument to "example" is $(1), the above is the
same as:

ex_usage = $(eval $$(eval $(1) := $$(2)))$($(1))

...now we need to resolve that recursively where $(1) is 'myvar' and
$(2) is 'myval'.  So we get:

1. $(eval $$(eval $(1) := $$(2)))$($(1))
2. $(eval $$(eval myvar := $$(2)))$(myvar)
3. $(eval myvar := $(2))$(myvar)
4. $(eval myvar := myval)$(myvar)

--

An alternate version of my "simpler" example that doesn't use this magic:

define example
$$(eval $(1) := $(2))
endef

ex_usage = $(eval $(call example,$(1),$(2)))$($(1))

.PHONY: ex
ex:
  @echo $(call ex_usage,myvar,myval)
  @echo $(myvar)

...that works OK for the simple example case but you get into weird
esoteric issues because of the extra eval.  You'll find that the two
definitions behave differently for:

  @echo $(call ex_usage,myvar,my$$$$(cat /proc/cmdline)val)

...in that example the "intention" is that bash should be passed the
string: echo my$(cat /proc/cmdline)val, so it escapes the "$" once to
"defer" it and twice because it wants the "$" to go through to bash.

--

...and yes, I already punched myself in the face for the complexity of
all of the above.  ;-)

It's certainly possible that there's some way to get rid of an eval in
the above.  If you have a suggestion that would reduce the number
needed that'd be interesting.


>> +# Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
>> +#
>> +# Convert all '$', ')', '(', '\', '=', ' ', ',' to '_'
>> +__sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$(subst \,_,$(subst =,_,$(subst $(space),_,$(subst $(comma),_,$(1))))))))
>> +
>> +# Usage = $(call __comma,something_with_comma)
>> +#
>> +# Convert ',' to '$(comma)' which can help it getting interpreted by eval.
>> +__comma = $(subst $(comma),$$(comma),$(1))
>> +
>>  # cc-cross-prefix
>>  # Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
>>  # Return first prefix where a prefix$(CC) is found in PATH.
>> @@ -99,19 +148,34 @@ try-run = $(shell set -e;          \
>>  # as-option
>>  # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
>>
>> -as-option = $(call try-run,\
>> -       $(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
>> +as-option = \
>> +       $(call cached-val,$(call __sanitize-opt,\
>> +               as_opt_$(CC)_$(KBUILD_CFLAGS)_$(1)_$(2)),\
>> +       $$(call try-run,\
>> +       $(CC) $(call __comma,$(KBUILD_CFLAGS)) $(call __comma,$(1)) \
>> +       -c -x assembler /dev/null \
>> +       -o "$$$$TMP",$(call __comma,$(1)),$(call __comma,$(2))))
>>
>>  # as-instr
>>  # Usage: cflags-y += $(call as-instr,instr,option1,option2)
>>
>> -as-instr = $(call try-run,\
>> -       printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
>> +as-instr = \
>> +       $(call cached-val,$(call __sanitize-opt,\
>> +               as_instr_$(CC)_$(KBUILD_AFLAGS)_$(1)_$(2)_$(3)),\
>> +       $$(call try-run,\
>> +       printf "%b\n" "$(call __comma,$(1))" | \
>> +       $(CC) $(call __comma,$(KBUILD_AFLAGS)) -c -x assembler \
>> +       -o "$$$$TMP" -,$(call __comma,$(2)),$(call __comma,$(3))))
>>
>>  # __cc-option
>>  # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
>> -__cc-option = $(call try-run,\
>> -       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
>> +__cc-option = \
>> +       $(call cached-val,$(call __sanitize-opt,__cc_opt_$(1)_$(2)_$(3)_$(4)),\
>> +       $$(call try-run,\
>> +       $(call __comma,$(1)) -Werror \
>> +       $(call __comma,$(2)) \
>> +       $(call __comma,$(3)) -c -x c /dev/null \
>> +       -o "$$$$TMP",$(call __comma,$(strip $(3))),$(call __comma,$(strip $(4)))))
>
>
> I did not follow how this was working here...

Hoo boy.  Let's see...  Which part were you curious about?  I can try
to explain the bits and you can tell me if I got them all.  Note that
many of these aren't super important anymore since they're not needed
with your improvements:


* $(call __sanitize-opt,__cc_opt_$(1)_$(2)_$(3)_$(4)):

Tries to make a variable name that will be different if you have any
different parameters.


* $$(call try-run

The "$$" around this call is because it's deferred and a general
concept for "cached-val".  If (and only if) we decide that we need to
recompute this value then we'll run this through an "eval".  By having
the $$ then this action won't be taken unless the string is eval-ed.
Note that plenty of stuff _will_ still happen right away, though.  All
of the $(call __comma,$(1)) are _not_ deferred.  That's fine since
that doesn't lead to a fork-exec and thus isn't "expensive".


*  $(call __comma,$(1))

I'll admit that I didn't dig all the way into this.  I found at least
one case where "make" was incorrectly mixing up arguments due to the
"eval" and the "__comma" fixed it.  I decided it was important to do
this for all arguments.  Possibly other things might need to be
escaped too, but I didn't find any cases that needed it...  ...but no
longer needed with your improvements...


* $$$$TMP

An extra level of escaping is needed since it goes through an extra
"eval".  This means $$ => $$$$


* $(strip $(3))

This was important because otherwise the cache otherwise wasn't
completely "stable".  If you ran "make" the first time you'd get a
cache, then running "make" the 2nd time would give you extra entries
in the cache.  After the 3rd time you were OK, but it seemed nice to
make it stable faster.

To understand this, first understand that some people call __cc_option
with a space after the ','.  Make treats this as important, thus these
two are different:

val := $(call cc-option, -opt1, -opt2)
val := $(call cc-option,-opt1,-opt2)

In one case val would be " -opt1" or " -opt2".  In the other case
"-opt1" or "-opt2".

However, when we cache things the space suddenly becomes irrelevant.
That's because we've end up with something like:

  __cached_result :=  -opt1

...and even though there are two spaces after the ":=" make throws that away.

The result of all of that is that we'd get slightly different numbers
of spaces after the cache was populated.  That could probably be
ignored except that some flags are additive and previous flags are
passed as arguments to later calls to __cc-option.  That means that
previous flags are passed to __sanitize-opt.  ...and in __sanitize-opt
spaces are significant.  ...so you'd come up with a slightly different
variable name on the first run and the subsequent runs...

Probably waaaay more than you expected for a simple $(strip) call, huh?

In any case this doesn't seem to matter anymore with your improvements
(I didn't dig into why), though I have noticed that the cache does
still return slightly different spacing for some of the results...

---

OK, v2 coming right up!  Thanks again for all your help on this!


-Doug
