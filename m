Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f51.google.com ([209.85.213.51]:52707 "EHLO
        mail-vk0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752625AbdKJRek (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Nov 2017 12:34:40 -0500
Received: by mail-vk0-f51.google.com with SMTP id i133so6549336vke.9
        for <linux-kbuild@vger.kernel.org>; Fri, 10 Nov 2017 09:34:40 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAK7LNATxOq+_a3GdiJFu2HWrs5oykzPr3LsXNAoDYHR_uaeNYA@mail.gmail.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
 <1510242077-8122-2-git-send-email-yamada.masahiro@socionext.com>
 <CAD=FV=VQ2YoWd0ARSk6z03zFzKmem6VbJ4r5T0aoGh7kGhwaDw@mail.gmail.com> <CAK7LNATxOq+_a3GdiJFu2HWrs5oykzPr3LsXNAoDYHR_uaeNYA@mail.gmail.com>
From: Doug Anderson <dianders@chromium.org>
Date: Fri, 10 Nov 2017 09:34:38 -0800
Message-ID: <CAD=FV=VrNhPHYycU0onm01y8Rv0tHscHYdExH_5VK2OquBjc0g@mail.gmail.com>
Subject: Re: [PATCH 1/4] kbuild: create directory for make cache only when necessary
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>

Hi,

On Thu, Nov 9, 2017 at 8:12 PM, Masahiro Yamada
<yamada.masahiro@socionext.com> wrote:
>>> +cache-dir := $(if $(KBUILD_SRC),$(if $(cache-data),,$(dir $(make-cache))))
>>
>> It wouldn't hurt to add a comment that cache-dir will be blank if we
>> don't need to make the cache dir and will contain a directory path
>> only if the dir doesn't exist.  Without a comment it could take
>> someone quite a while to realize that...
>
>
> You are right. This is confusing.
>
>
> Another idea is use a boolean flag.
>
>
> For example, like follows:
>
>
> create-cache-dir := $(if $(KBUILD_SRC),$(if $(cache-data),,1)))
>
>
>  define __run-and-store
>  ifeq ($(origin $(1)),undefined)
>    $$(eval $(1) := $$(shell $$(2)))
>  ifeq ($(create-cache-dir),1)
>   $$(shell mkdir -p $(dir $(make-cache)))
>   $$(eval create-cache-dir :=)
>  endif
>    $$(shell echo '$(1) := $$($(1))' >> $(make-cache))
>  endif
>  endef
>
>
>
> Perhaps, this is clearer and self-documenting.

Yes, that would be self-documenting enough for me.


>>> +
>>>  # Usage: $(call __sanitize-opt,Hello=Hola$(comma)Goodbye Adios)
>>>  #
>>>  # Convert all '$', ')', '(', '\', '=', ' ', ',', ':' to '_'
>>> @@ -136,6 +137,10 @@ __sanitize-opt = $(subst $$,_,$(subst $(right_paren),_,$(subst $(left_paren),_,$
>>>  define __run-and-store
>>>  ifeq ($(origin $(1)),undefined)
>>>    $$(eval $(1) := $$(shell $$(2)))
>>> +ifneq ($(cache-dir),)
>>> +  $$(shell mkdir -p $(cache-dir))
>>
>> I _think_ you want some single quotes in there.  AKA:
>>
>> $$(shell mkdir -p '$(cache-dir)')
>>
>> That at least matches what the "old" code used to do.  Specifically if
>> 'cache-dir' happens to have a space in it then it won't work right
>> without the single quotes.  There may be other symbols that your shell
>> might interpret in interesting ways, too.
>
>
> Kbuild always runs in the output directory.
>
> So, 'cache-dir' is always a relative path from the top of kernel directory
> whether O= option is given or not.
>
>
> For kernel source, I do not see any file path containing spaces.
>
> Just in case, I renamed a directory and tested, but
> something strange happened in silentoldconfig, it would not work.
>
>
> Insane people may want to use a file path with spaces
> for external modules.
>
> I tested,
>
>      obj-m  := fo o/
>
> but, this would not work either.
>
>
> It will be difficult to make it work
> because $(sort ...) is used in several places
> in core makefiles.
>
>
> So, my conclusion is, it does not work.

OK.  This doesn't surprise me, but I'd never though through all the
cases.  Thanks for checking!

Even so, if it's all the same to you I'd get a warm fuzzy if the
single quotes were there.  It shouldn't hurt to have them and it seems
like it lessens the chances of problems in the future.  ...but I won't
make a big stink about it and I'll leave it to your discretion.


-Doug
