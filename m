Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:22656 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750779AbdJDEGY (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 4 Oct 2017 00:06:24 -0400
MIME-Version: 1.0
In-Reply-To: <20170926175508.29950-2-dianders@chromium.org>
References: <20170926175508.29950-1-dianders@chromium.org> <20170926175508.29950-2-dianders@chromium.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Wed, 4 Oct 2017 13:05:31 +0900
Message-ID: <CAK7LNASCy-zMNF1-7gie4NhyKC8xhAtyVHatpQ7JYLUz6UiG0w@mail.gmail.com>
Subject: Re: [RFC PATCH 1/2] kbuild: Add a cache for generated variables
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Douglas Anderson <dianders@chromium.org>
Cc: Michal Marek <mmarek@suse.com>, groeck@chromium.org, briannorris@chromium.org, Marcin Nowakowski <marcin.nowakowski@imgtec.com>, Matthias Kaehlcke <mka@chromium.org>, Behan Webster <behanw@converseincode.com>, Arnd Bergmann <arnd@arndb.de>, Mark Charlebois <charlebm@gmail.com>, Cao jin <caoj.fnst@cn.fujitsu.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>, Jonathan Corbet <corbet@lwn.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@kernel.org>

Hi Douglas,


2017-09-27 2:55 GMT+09:00 Douglas Anderson <dianders@chromium.org>:
> While timing a "no-op" build of the kernel (incrementally building the
> kernel even though nothing changed) in the Chrome OS build system I
> found that it was much slower than I expected.
>
> Digging into things a bit, I found that quite a bit of the time was
> spent invoking the C compiler even though we weren't actually building
> anything.  Currently in the Chrome OS build system the C compiler is
> called through a number of wrappers (one of which is written in
> python!) and can take upwards of 100 ms to invoke even if we're not
> doing anything difficult, so these invocations of the compiler were
> taking a lot of time.  Worse the invocations couldn't seem to take
> advantage of the multiple cores on my system.
>
> Certainly it seems like we could make the compiler invocations in the
> Chrome OS build system faster, but only to a point.  Inherently
> invoking a program as big as a C compiler is a fairly heavy
> operation.  Thus even if we can speed the compiler calls it made sense
> to track down what was happening.
>
> It turned out that all the compiler invocations were coming from
> usages like this in the kernel's Makefile:
>
> KBUILD_CFLAGS += $(call cc-option,-fno-delete-null-pointer-checks,)
>
> Due to the way cc-option and similar statements work the above
> contains an implicit call to the C compiler.  ...and due to the fact
> that we're storing the result in KBUILD_CFLAGS, a simply expanded
> variable, the call will happen every time the Makefile is parsed, even
> if there are no users of KBUILD_CFLAGS.
>
> Rather than redoing this computation every time, it makes a lot of
> sense to cache the result of all of the Makefile's compiler calls just
> like we do when we compile a ".c" file to a ".o" file.  Conceptually
> this is quite a simple idea.  ...and since the calls to invoke the
> compiler and similar tools are centrally located in the Kbuild.include
> file this doesn't even need to be super invasive.
>
> Implementing the cache in a simple-to-use and efficient way is not
> quite as simple as it first sounds, though.  To get maximum speed we
> really want the cache in a format that make can natively understand
> and make doesn't really have an ability to load/parse files. ...but
> make _can_ import other Makefiles, so the solution is to store the
> cache in Makefile format.  This requires coming up with a valid/unique
> Makefile variable name for each value to be cached, but that's
> solvable with some cleverness.
>
> After this change, we'll automatically create a "Makefile-cache.o"
> file that will contain our cached variables.  We'll load this on each
> invocation of make and will avoid recomputing anything that's already
> in our cache.  The cache is stored in a format that it shouldn't need
> any invalidation since anything that might change should affect the
> "key" and any old cached value won't be used.  The cache will be
> cleaned by virtue of the ".o" suffix by a "make clean".
>
> Signed-off-by: Douglas Anderson <dianders@chromium.org>



Thanks for the patches.  The idea is interesting.

I am not a Chrome developer, but cc-option could be improved somehow.


I examined two approaches to mitigate the pain.

[1] Skip cc-option completely when we run non-build targets
    such as "make help", "make clean", etc.

[2] Cache the result of cc-option like this patch


I wrote some patches for [1]
https://patchwork.kernel.org/patch/9983825/
https://patchwork.kernel.org/patch/9983829/
https://patchwork.kernel.org/patch/9983833/
https://patchwork.kernel.org/patch/9983827/

Comments are welcome.  :)


[1] does not solve the slowness in the incremental build.
Instead, it makes non-build targets faster
from a clean source tree because cc-option is zero cost.


[2] solves the issues in the incremental build.
One funny thing is, it computes cc-option and store the cache file
even for "make clean", where we know the cache file will be
immediately deleted.


We can apply [1] or [2], or maybe both of them
because [1] and [2] are trying to solve the different issues.



The cache approach seemed clever, but I do not like the implementation.
The code is even more unreadable with lots of escape sequence.


Here is my suggestion for simpler implementation (including bike-shed)


Implement a new function "shell-cache".  It works like $(shell ...)

The difference is
$(call shell-cached,...) returns the cached result, or run the command
if not cached.



Also, add try-run-cached.  This is a cached variant of try-run.


I just played with it, and seems working.
(I did not have spend much time for testing, more wider test is needed.)


The code is like something like this:



make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if
$(obj),$(obj)/)).cache.mk

-include $(make-cache)

__sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst
$(left_paren),_,$(subst \,_,$(subst =,_,$(subst $(space),_,$(subst
$(comma),_,$(1))))))))

define __run-and-store
ifeq ($(origin $(1)),undefined)
  $$(eval $(1) := $$(shell $$2))
  $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
endif
endef

# $(call,shell-cached,my_command)
# This works like $(shell my_command), but the result is cached
__shell-cached = $(eval $(call __run-and-store,$1))$($1)
shell-cached = $(call __shell-cached,__cached_$(call __sanitize-opt,$(1)),$1)

...


__try-run = set -e; \
     TMP="$(TMPOUT).$$$$.tmp"; \
     TMPO="$(TMPOUT).$$$$.o"; \
     if ($(1)) >/dev/null 2>&1; \
     then echo "$(2)"; \
     else echo "$(3)"; \
     fi; \
     rm -f "$$TMP" "$$TMPO"

# try-run
# Usage: option = $(call try-run, $(CC)...-o "$$TMP",option-ok,otherwise)
# Exit code chooses option. "$$TMP" serves as a temporary file and is
# automatically cleaned up.
try-run = $(shell $(__try-run))

# try-run-cached
# This works like try-run, but the result is cached.
try-run-cached = $(call shell-cached,$(__try-run))




Then, you can replace

  $(shell $(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh $(CC) $(KBUILD_CFLAGS)

with

  $(call shell-cached,$(CONFIG_SHELL) $(srctree)/scripts/gcc-goto.sh
$(CC) $(KBUILD_CFLAGS)




replace

__cc-option = $(call try-run,\
         $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))

with

__cc-option = $(call try-run-cached,\
         $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))




What do you think?

A little more comments below.




> +# Tools for caching Makefile variables that are "expensive" to compute.
> +#
> +# Here we want to help deal with variables that take a long time to compute
> +# by making it easy to store these variables in a cache.
> +#
> +# The canonical example here is testing for compiler flags.  On a simple system
> +# each call to the compiler takes 10 ms, but on a system with a compiler that's
> +# called through various wrappers it can take upwards of 100 ms.  If we have
> +# 100 calls to the compiler this can take 1 second (on a simple system) or 10
> +# seconds (on a complicated system).
> +#
> +# The "cache" will be in Makefile syntax and can be directly included.
> +# Any time we try to reference a variable that's not in the cache we'll
> +# calculate it and store it in the cache for next time.
> +
> +# Include values from last time
> +-include Makefile-cache.o


Kbuild.include is included, so is Makefile-cache.o
every time the build system descend into sub-directories.

It is not efficient to include cached data unneeded in sub-directories.
I prefixed $(obj)/

Another problem is when building external modules.
Makefile-cache.o is always created/updated in the kernel build tree.

When we build external modules, the kernel source may be located under
/usr/src/ , which is generally read-only for normal users.
So, I prefixed $(KBUILD_EXTMOD) to create the cache file
in the module tree if KBUILD_EXTMOD is defined.

I do not like the suffix .o
I prefer file name to be something else
that starts with . to hide it.








> +# Usage:   $(call cached-val,variable_name,escaped_expensive_operation)
> +# Example: $(call cached-val,md5_val,$$(shell md5sum /usr/bin/gcc)
> +#
> +# If the variable is already defined we'll just use it.  If it's not, it will
> +# be calculated and stored in a persistent (disk-based) cache for the next
> +# invocation of Make.  The call will evaluate to the value of the variable.
> +#
> +# This is a bit of voodoo, but basic explanation is that if the variable
> +# was undefined then we'll evaluate the expensive operation and store it into
> +# the variable.  We'll then store that value in the cache and finally output
> +# the value.
> +define __set-and-store
> +ifeq ($(origin $(1)),undefined)
> +  $$(eval $(1) := $$(2))
> +  $$(shell echo '$(1) := $$($(1))' >> Makefile-cache.o)
> +endif
> +endef
> +cached-val = $(eval $(call __set-and-store,__cached_$(1)))$(__cached_$(1))


This seems working, but I do not understand this trick.


__set-and-store takes two arguments,
but here, it is called with one argument __cached_$(1)

Probably, $$(try-run, ...) will be passed as $2,
but I do not know why this works.




> +# Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
> +#
> +# Convert all '$', ')', '(', '\', '=', ' ', ',' to '_'
> +__sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$(subst \,_,$(subst =,_,$(subst $(space),_,$(subst $(comma),_,$(1))))))))
> +
> +# Usage = $(call __comma,something_with_comma)
> +#
> +# Convert ',' to '$(comma)' which can help it getting interpreted by eval.
> +__comma = $(subst $(comma),$$(comma),$(1))
> +
>  # cc-cross-prefix
>  # Usage: CROSS_COMPILE := $(call cc-cross-prefix, m68k-linux-gnu- m68k-linux-)
>  # Return first prefix where a prefix$(CC) is found in PATH.
> @@ -99,19 +148,34 @@ try-run = $(shell set -e;          \
>  # as-option
>  # Usage: cflags-y += $(call as-option,-Wa$(comma)-isa=foo,)
>
> -as-option = $(call try-run,\
> -       $(CC) $(KBUILD_CFLAGS) $(1) -c -x assembler /dev/null -o "$$TMP",$(1),$(2))
> +as-option = \
> +       $(call cached-val,$(call __sanitize-opt,\
> +               as_opt_$(CC)_$(KBUILD_CFLAGS)_$(1)_$(2)),\
> +       $$(call try-run,\
> +       $(CC) $(call __comma,$(KBUILD_CFLAGS)) $(call __comma,$(1)) \
> +       -c -x assembler /dev/null \
> +       -o "$$$$TMP",$(call __comma,$(1)),$(call __comma,$(2))))
>
>  # as-instr
>  # Usage: cflags-y += $(call as-instr,instr,option1,option2)
>
> -as-instr = $(call try-run,\
> -       printf "%b\n" "$(1)" | $(CC) $(KBUILD_AFLAGS) -c -x assembler -o "$$TMP" -,$(2),$(3))
> +as-instr = \
> +       $(call cached-val,$(call __sanitize-opt,\
> +               as_instr_$(CC)_$(KBUILD_AFLAGS)_$(1)_$(2)_$(3)),\
> +       $$(call try-run,\
> +       printf "%b\n" "$(call __comma,$(1))" | \
> +       $(CC) $(call __comma,$(KBUILD_AFLAGS)) -c -x assembler \
> +       -o "$$$$TMP" -,$(call __comma,$(2)),$(call __comma,$(3))))
>
>  # __cc-option
>  # Usage: MY_CFLAGS += $(call __cc-option,$(CC),$(MY_CFLAGS),-march=winchip-c6,-march=i586)
> -__cc-option = $(call try-run,\
> -       $(1) -Werror $(2) $(3) -c -x c /dev/null -o "$$TMP",$(3),$(4))
> +__cc-option = \
> +       $(call cached-val,$(call __sanitize-opt,__cc_opt_$(1)_$(2)_$(3)_$(4)),\
> +       $$(call try-run,\
> +       $(call __comma,$(1)) -Werror \
> +       $(call __comma,$(2)) \
> +       $(call __comma,$(3)) -c -x c /dev/null \
> +       -o "$$$$TMP",$(call __comma,$(strip $(3))),$(call __comma,$(strip $(4)))))


I did not follow how this was working here...




-- 
Best Regards
Masahiro Yamada
