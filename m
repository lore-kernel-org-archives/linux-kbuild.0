Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-05.nifty.com ([210.131.2.90]:49937 "EHLO
        conssluserg-05.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754172AbdKJENv (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 9 Nov 2017 23:13:51 -0500
MIME-Version: 1.0
In-Reply-To: <CAD=FV=VQ2YoWd0ARSk6z03zFzKmem6VbJ4r5T0aoGh7kGhwaDw@mail.gmail.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
 <1510242077-8122-2-git-send-email-yamada.masahiro@socionext.com> <CAD=FV=VQ2YoWd0ARSk6z03zFzKmem6VbJ4r5T0aoGh7kGhwaDw@mail.gmail.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 Nov 2017 13:12:50 +0900
Message-ID: <CAK7LNATxOq+_a3GdiJFu2HWrs5oykzPr3LsXNAoDYHR_uaeNYA@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: create directory for make cache only when necessary
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Doug Anderson <dianders@chromium.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

Hi Douglas,

Thanks for your review.

2017-11-10 2:59 GMT+09:00 Doug Anderson <dianders@chromium.org>:
> Hi,
>
> On Thu, Nov 9, 2017 at 7:41 AM, Masahiro Yamada
> <yamada.masahiro@socionext.com> wrote:
>> Currently, the existence of $(dir $(make-cache)) is always checked,
>> and created if it is missing.
>>
>> We can avoid unnecessary system calls by some tricks.
>>
>> [1] If KBUILD_SRC is unset, we are building in the source tree.
>>     The output directory checks can be entirely skipped.
>> [2] If at least one cache data is found, it means the cache file
>>     was included.  Obiously its directory exists.  Skip "mkdir -p".
>> [3] If Makefile does not contain any call of __run-and-store, it will
>>     not create a cache file.  No need to create its directory.
>> [4] The "mkdir -p" should be only invoked by the first call of
>>     __run-and-store
>>
>> Signed-off-by: Masahiro Yamada <yamada.masahiro@socionext.com>
>> ---
>>
>>  scripts/Kbuild.include | 13 +++++++++----
>>  1 file changed, 9 insertions(+), 4 deletions(-)
>>
>> diff --git a/scripts/Kbuild.include b/scripts/Kbuild.include
>> index be1c9d6..4fb1be1 100644
>> --- a/scripts/Kbuild.include
>> +++ b/scripts/Kbuild.include
>> @@ -99,18 +99,19 @@ cc-cross-prefix =  \
>>
>>  # Include values from last time
>>  make-cache := $(if $(KBUILD_EXTMOD),$(KBUILD_EXTMOD)/,$(if $(obj),$(obj)/)).cache.mk
>> -ifeq ($(wildcard $(dir $(make-cache))),)
>> -$(shell mkdir -p '$(dir $(make-cache))')
>> -endif
>>  $(make-cache): ;
>>  -include $(make-cache)
>>
>> +cached-data := $(filter __cached_%, $(.VARIABLES))
>> +
>>  # If cache exceeds 1000 lines, shrink it down to 500.
>> -ifneq ($(word 1000,$(filter __cached_%, $(.VARIABLES))),)
>> +ifneq ($(word 1000,$(cached-data)),)
>>  $(shell tail -n 500 $(make-cache) > $(make-cache).tmp; \
>>         mv $(make-cache).tmp $(make-cache))
>>  endif
>>
>> +cache-dir := $(if $(KBUILD_SRC),$(if $(cache-data),,$(dir $(make-cache))))
>
> It wouldn't hurt to add a comment that cache-dir will be blank if we
> don't need to make the cache dir and will contain a directory path
> only if the dir doesn't exist.  Without a comment it could take
> someone quite a while to realize that...


You are right. This is confusing.


Another idea is use a boolean flag.


For example, like follows:


create-cache-dir := $(if $(KBUILD_SRC),$(if $(cache-data),,1)))


 define __run-and-store
 ifeq ($(origin $(1)),undefined)
   $$(eval $(1) := $$(shell $$(2)))
 ifeq ($(create-cache-dir),1)
  $$(shell mkdir -p $(dir $(make-cache)))
  $$(eval create-cache-dir :=)
 endif
   $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
 endif
 endef



Perhaps, this is clearer and self-documenting.



>> +
>>  # Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
>>  #
>>  # Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
>> @@ -136,6 +137,10 @@ __sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$
>>  define __run-and-store
>>  ifeq ($(origin $(1)),undefined)
>>    $$(eval $(1) := $$(shell $$(2)))
>> +ifneq ($(cache-dir),)
>> +  $$(shell mkdir -p $(cache-dir))
>
> I _think_ you want some single quotes in there.  AKA:
>
> $$(shell mkdir -p '$(cache-dir)')
>
> That at least matches what the "old" code used to do.  Specifically if
> 'cache-dir' happens to have a space in it then it won't work right
> without the single quotes.  There may be other symbols that your shell
> might interpret in interesting ways, too.


Kbuild always runs in the output directory.

So, 'cache-dir' is always a relative path from the top of kernel directory
whether O= option is given or not.


For kernel source, I do not see any file path containing spaces.

Just in case, I renamed a directory and tested, but
something strange happened in silentoldconfig, it would not work.


Insane people may want to use a file path with spaces
for external modules.

I tested,

     obj-m  := fo o/

but, this would not work either.


It will be difficult to make it work
because $(sort ...) is used in several places
in core makefiles.


So, my conclusion is, it does not work.


> NOTE: I have no idea if the kernel Makefiles work if paths like
> KBUILD_SRC have spaces in them to begin with, but it seems wise to add
> the quotes here anyway.

I have not tested this case.

Probably, this will be less difficult
if we want to allow spaces in KBUILD_SRC.


> ALSO NOTE: I think you could still confuse the kernel Makefiles if
> somehow you had a single quote in your path somehow.  I assume we
> don't care?

Hmm, I do not think this is worth efforts.

Probably, the most reasonable solution is
please do not use special characters in file paths.



>
>> +  $$(eval cache-dir :=)
>> +endif
>>    $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
>>  endif
>>  endef
>
> Other than the single quote problem and the suggested comment, this
> seems like a sane optimization to me.  Feel free to add my Reviewed-by
> once those fixes are in place.
>
> -Doug
> --
> To unsubscribe from this list: send the line "unsubscribe linux-kbuild" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html



-- 
Best Regards
Masahiro Yamada
