Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ua0-f176.google.com ([209.85.217.176]:53331 "EHLO
        mail-ua0-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1757426AbdJKQUE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 11 Oct 2017 12:20:04 -0400
Received: by mail-ua0-f176.google.com with SMTP id s41so1404693uab.10
        for <linux-kbuild@vger.kernel.org>; Wed, 11 Oct 2017 09:20:04 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CAK7LNASpq06uCB+gTLUesLhAyWcctdNRn=BYGoZHkHmOjq8vkw@mail.gmail.com>
References: <20171004223717.3010-1-dianders@chromium.org> <20171004223717.3010-2-dianders@chromium.org>
 <CAK7LNASpq06uCB+gTLUesLhAyWcctdNRn=BYGoZHkHmOjq8vkw@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Wed, 11 Oct 2017 09:20:01 -0700
Message-ID: <CAD=FV=X5bSMXaTwWvngU2vOLUQqmGY-uX3=e-kcVBt6gQshqSA@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] kbuild: Add a cache for generated variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Guenter Roeck <groeck@chromium.org>, Simon Glass <sjg@chromium.org>, Brian Norris <briannorris@chromium.org>, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Cao jin <caoj.fnst@cn.fujitsu.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, James Hogan <james.hogan@imgtec.com>, Josh Poimboeuf <jpoimboe@redhat.com>, Ingo Molnar <mingo@kernel.org>

Hi,

On Tue, Oct 10, 2017 at 8:59 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
> Hi Douglas,
>
>
> 2017-10-05 7:37 GMT+09:00 Douglas Anderson <dianders@chromium.org>:
>> While timing a "no-op" build of the kernel (incrementally building the
>> kernel even though nothing changed) in the Chrome OS build system I
>> found that it was much slower than I expected.
>>
>> Digging into things a bit, I found that quite a bit of the time was
>> spent invoking the C compiler even though we weren't actually building
>> anything.  Currently in the Chrome OS build system the C compiler is
>> called through a number of wrappers (one of which is written in
>> python!) and can take upwards of 100 ms to invoke even if we're not
>> doing anything difficult, so these invocations of the compiler were
>> taking a lot of time.  Worse the invocations couldn't seem to take
>> advantage of the multiple cores on my system.
>>
>> Certainly it seems like we could make the compiler invocations in the
>> Chrome OS build system faster, but only to a point.  Inherently
>> invoking a program as big as a C compiler is a fairly heavy
>> operation.  Thus even if we can speed the compiler calls it made sense
>> to track down what was happening.
>>
>> It turned out that all the compiler invocations were coming from
>> usages like this in the kernel's Makefile:
>>
>> KBUILD_CFLAGS += $(call cc-option,-fno-delete-null-pointer-checks,)
>>
>> Due to the way cc-option and similar statements work the above
>> contains an implicit call to the C compiler.  ...and due to the fact
>> that we're storing the result in KBUILD_CFLAGS, a simply expanded
>> variable, the call will happen every time the Makefile is parsed, even
>> if there are no users of KBUILD_CFLAGS.
>>
>> Rather than redoing this computation every time, it makes a lot of
>> sense to cache the result of all of the Makefile's compiler calls just
>> like we do when we compile a ".c" file to a ".o" file.  Conceptually
>> this is quite a simple idea.  ...and since the calls to invoke the
>> compiler and similar tools are centrally located in the Kbuild.include
>> file this doesn't even need to be super invasive.
>>
>> Implementing the cache in a simple-to-use and efficient way is not
>> quite as simple as it first sounds, though.  To get maximum speed we
>> really want the cache in a format that make can natively understand
>> and make doesn't really have an ability to load/parse files. ...but
>> make _can_ import other Makefiles, so the solution is to store the
>> cache in Makefile format.  This requires coming up with a valid/unique
>> Makefile variable name for each value to be cached, but that's
>> solvable with some cleverness.
>>
>> After this change, we'll automatically create a ".cache.mk" file that
>> will contain our cached variables.  We'll load this on each invocation
>> of make and will avoid recomputing anything that's already in our
>> cache.  The cache is stored in a format that it shouldn't need any
>> invalidation since anything that might change should affect the "key"
>> and any old cached value won't be used.
>>
>> Signed-off-by: Douglas Anderson <dianders@chromium.org>
>
>
> I reviewed and tested this patch more closely.
>
> V2 is almost good, but
> I see some problem and things that should be improved.
> (including bike-shed)
>
>
> [1]
>
> If you apply this patch and run "make clean"
> on a machine without "sphinx-build" installed,
> you will see a mysterious error message like follows:
>
>
> $ make clean
> Documentation/Makefile:24: The 'sphinx-build' command was not found.
> Make sure you have Sphinx installed and in PATH, or set the
> SPHINXBUILD make variable to point to the full path of the
> 'sphinx-build' executable.
>
> Detected OS: Ubuntu 16.04.2 LTS.
> Warning: better to also install "dot".
> Warning: better to also install "rsvg-convert".
> ERROR: please install "virtualenv", otherwise, build won't work.
> You should run:
>
> sudo apt-get install graphviz librsvg2-bin virtualenv
> virtualenv sphinx_1.4
> . sphinx_1.4/bin/activate
> pip install -r Documentation/sphinx/requirements.txt
>
> Can't build as 2 mandatory dependencies are missing at
> ./scripts/sphinx-pre-install line 566.
>
>
>
> This comes from the ".DEFAULT" target
> when "make clean" descends into Documentation/ directory.
>
>
> You can fix it by adding
>
> $(make-cache): ;
>
> to scripts/Kbuild.include
>
>
> This will prevent Make from searching
> a target that would generate $(make-cache).
>
>
> (Of course, we can fix Documentation/Makefile
> to not use '.DEFAULT',
> but canceling $(make-cache) rule is a good thing.)
>
>
> You will need this
> https://patchwork.kernel.org/patch/9998651/
>
> before adding the target to Kbuild.include

Thanks!  I will do that.


> [2] Please clean up .cache.mk
>
> Adding .cache.mk pattern around line 1540 will be good.

Done.


> A few more comments below.
>
>
>
>> +--- 3.14 $(LD) support function cache
>> +
>> +One thing to realize about all the calls to the above support functions
>> +is that each use of them requires a full invocation of an external tool, like
>> +the C compiler, assembler, or linker.  If nothing else that invocation will
>> +cause a fork/exec/shared library link.  In some build environments, however, it
>> +could also involve traversing thorough one or more wrappers.  To put some
>> +numbers on it, I've measured compiler invocations of as fast as 4ms or
>> +as slow as 150ms.
>> +
>> +Many of the above support functions are used in places where they are
>> +evaluated on each invocation of Make before anything else can run.  Even on
>> +a simple command like "make help" we need to evaluate every single one of the
>> +variables.
>> +
>> +To avoid this slow overhead we can cache the result of these invocations.
>> +If we store this cache in a way that's easy for Make to use (like in Makefile
>> +format) then it will be very quick and we'll save a lot of time with each
>> +invocation of make.
>> +
>> +
>
>
> The section number should be 3.13 instead of 3.14
> but is this explanation necessary?
>
>
> If you read the "2 Who does what" section of
> Documentation/kbuild/makefile.txt
> this file is mostly written for
> "normal developers" and "arch developers".
>
> It focuses on how to write Linux makefiles.
>
> It does not explain how Kbuild works.
>
>
> Knowing what cool things happening behind the scene is great.
> But, it is probably out of scope of this file.
>
> You added very nice explanation
> in scripts/Kbuild.include and git-log.
>
> Those who are interested in this feature
> will be able to find enough information.

Deleted the doc change.


>>  === 4 Host Program support
>>
>>  Kbuild supports building executables on the host for use during the
>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> index 9ffd3dda3889..c539c709a00c 100644
>> --- a/scripts/Kbuild.include
>> +++ b/scripts/Kbuild.include
>> @@ -8,6 +8,8 @@ squote  := '
>>  empty   :=
>>  space   := $(empty) $(empty)
>>  space_escape := _-_SPACE_-_
>> +right_paren := )
>> +left_paren := (
>>
>>  ###
>>  # Name of target with a '.' as filename prefix. foo/bar.o => foo/.bar.o
>> @@ -69,6 +71,56 @@ endef
>>  # gcc support functions
>>  # See documentation in Documentation/kbuild/makefiles.txt
>>
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
>> +make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if $(obj),$(obj)/)).cache.mk
>> +-include $(make-cache)
>> +
>> +# Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
>> +#
>> +# Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
>> +__sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$(subst \,_,$(subst =,_,$(subst $(space),_,$(subst $(comma),_,$(subst :,_,$(1)))))))))
>> +
>> +# Usage:   $(call shell-cached,shell_command)
>> +# Example: $(call shell-cached,md5sum /usr/bin/gcc)
>> +#
>> +# If we've already seen a call to this exact shell command (even in a
>> +# previous invocation of make!) we'll return the value.  If not, we'll
>> +# compute it and store the result for future runs.
>> +#
>> +# This is a bit of voodoo, but basic explanation is that if the variable
>> +# was undefined then we'll evaluate the shell command and store the result
>> +# into the variable.  We'll then store that value in the cache and finally
>> +# output the value.
>> +#
>> +# NOTE: The $$(2) here isn't actually a parameter to __run-and-store.  We
>> +# happen to know that the caller will have their shell command in $(2) so the
>> +# result of "call"ing this will produce a reference to that $(2).  The reason
>> +# for this strangeness is to avoid an extra level of eval (and escaping) of
>> +# $(2).
>> +define __run-and-store
>> +ifeq ($(origin $(1)),undefined)
>> +  $$(eval $(1) := $$(shell $$(2)))
>> +  $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
>> +endif
>> +endef
>> +__shell-cached = $(eval $(call __run-and-store,$(1)))$($(1))
>> +shell-cached = $(call __shell-cached,__cached_$(call __sanitize-opt,$(1)),$(1))
>> +
>
> Bike shed:
>
> Could you insert this hunk
> below cc-cross-prefix?
>
> cc-cross-prefix is unrelated thing here.
>
> So, I want to shell-cache and try-run things
> come closer.

Done.  I still left it above TMPOUT


>>  # cc-cross-prefix
>>  # Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
>>  # Return first prefix where a prefix$(CC) is found in PATH.
>> @@ -87,30 +139,40 @@ TMPOUT := $(if $(KBUILD_EXTMOD),$(firstword $(KBUILD_EXTMOD))/)
>>  # Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
>>  # Exit code chooses option. "$$TMP" serves as a temporary file and is
>>  # automatically cleaned up.
>> -try-run = $(shell set -e;              \
>> +__try-run = set -e;                    \
>>         TMP="$(TMPOUT).$$$$.tmp";       \
>>         TMPO="$(TMPOUT).$$$$.o";        \
>>         if ($(1)) >/dev/null 2>&1;      \
>>         then echo "$(2)";               \
>>         else echo "$(3)";               \
>>         fi;                             \
>> -       rm -f "$$TMP" "$$TMPO")
>> +       rm -f "$$TMP" "$$TMPO"
>> +
>> +# try-run
>
>
>
>> +# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
>> +# Exit code chooses option. "$$TMP" serves as a temporary file and is
>> +# automatically cleaned up.
>> +try-run = $(shell $(__try-run))
>
> This is unnecessary.  It is completely the same as a few lines above.

Oops, thanks.


OK, just posted v3...
