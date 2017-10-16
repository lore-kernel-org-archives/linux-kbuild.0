Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:55462 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751411AbdJPK2E (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 16 Oct 2017 06:28:04 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdW8wT4NufHMS-AHGHf92VS-uBSHh=frTKGU60rHHszMrg@mail.gmail.com>
References: <1399639944-20551-1-git-send-email-mmarek@suse.cz>
 <1399639944-20551-4-git-send-email-mmarek@suse.cz> <CAFLxGvyz-aX8rTveo9W3mqsQxPeg8cb7Oq59UiC1kMz4qTiYwg@mail.gmail.com>
 <538EEA3D.1080105@suse.cz> <538F1B41.3060904@suse.cz> <20140605155614.GA18376@sepie.suse.cz>
 <CAMuHMdW8wT4NufHMS-AHGHf92VS-uBSHh=frTKGU60rHHszMrg@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 16 Oct 2017 12:28:02 +0200
Message-ID: <CAMuHMdX4VDsA=k6nypSjwmN75+-BVEnrj=NR12Le8GA2Ya1LTQ@mail.gmail.com>
Subject: Re: [PATCH v2 3/5] kbuild: Use relative path for $(objtree)
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Richard Weinberger <richard.weinberger@gmail.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Sam Ravnborg <sam@ravnborg.org>, Randy Dunlap <rdunlap@infradead.org>

Hi Michal,

(new SuSE address)

On Mon, Oct 16, 2017 at 12:26 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Thu, Jun 5, 2014 at 5:56 PM, Michal Marek <mmarek@suse.cz> wrote:
>> On Wed, Jun 04, 2014 at 03:12:33PM +0200, Michal Marek wrote:
>>> On 2014-06-04 11:43, Michal Marek wrote:
>>> > On 2014-06-04 11:03, Richard Weinberger wrote:
>>> >> To reproduce run:
>>> >> make defconfig ARCH=um O=/mnt/o && make linux ARCH=um O=/mnt/
>>> >>
>>> >> If there is anything in UML which needs fixing, please tell. :-)
>>> >
>>> > I'll have a look, thanks for the report.
>>>
>>> Findings so far: For some reason, syscalls_32.h is generated in the
>>> source tree (which is wrong) and syscalls_64.h is not generated at all.
>>> Looking further.
>>
>> Can you try the below patch? The same pattern is used in the rules for
>> tools/ and tools/% in the main Makefile, need to look into that as well.
>> But UML should work now.
>>
>> Michal
>>
>> From d4bc590f8716f7dde6b7bca319097ac30a8cb0b4 Mon Sep 17 00:00:00 2001
>> From: Michal Marek <mmarek@suse.cz>
>> Date: Thu, 5 Jun 2014 17:44:44 +0200
>> Subject: [PATCH] um: Fix for relative objtree when generating x86 headers
>>
>> In an O= build, rely on the generated Makefile to call the main Makefile
>> properly. When building in the source tree, we do not need to specify
>> the -C and O= either. This fixes the problem when $(objtree) is a
>> relative path and the -C changes the directory.
>>
>> Reported-by: Richard Weinberger <richard.weinberger@gmail.com>
>> Signed-off-by: Michal Marek <mmarek@suse.cz>
>> ---
>>  arch/um/Makefile | 3 +--
>>  1 file changed, 1 insertion(+), 2 deletions(-)
>>
>> diff --git a/arch/um/Makefile b/arch/um/Makefile
>> index 36e658a..e4b1a96 100644
>> --- a/arch/um/Makefile
>> +++ b/arch/um/Makefile
>> @@ -111,8 +111,7 @@ endef
>>  KBUILD_KCONFIG := $(HOST_DIR)/um/Kconfig
>>
>>  archheaders:
>> -       $(Q)$(MAKE) -C '$(srctree)' KBUILD_SRC= \
>> -               ARCH=$(HEADER_ARCH) O='$(objtree)' archheaders
>> +       $(Q)$(MAKE) KBUILD_SRC= ARCH=$(HEADER_ARCH) archheaders
>>
>>  archprepare: include/generated/user_constants.h
>
> This now commit d4bc590f8716f7dd ("um: Fix for relative objtree when
> generating x86 headers").
>
> When using O=, the build enters an infinite loop on v4.14-rc5.
> With V=1:
>
>     make KBUILD_SRC= ARCH=x86 archheaders
>     make -C /scratch/geert/linux/linux
> O=/scratch/geert/build/linux-uml-amd64/. archheaders
>     make -C /scratch/geert/build/linux-uml-amd64
> KBUILD_SRC=/scratch/geert/linux/linux \
>     -f /scratch/geert/linux/linux/Makefile archheaders
>     make KBUILD_SRC= ARCH=x86 archheaders
>     make -C /scratch/geert/linux/linux
> O=/scratch/geert/build/linux-uml-amd64/. archheaders
>     make -C /scratch/geert/build/linux-uml-amd64
> KBUILD_SRC=/scratch/geert/linux/linux \
>     -f /scratch/geert/linux/linux/Makefile archheaders
>     ...
>
> As it's been a (long) while I buily UML, I started a bisect, which pointed to
> the commit above.
> The problem actually already happened on commit d4bc590f8716f7dd, so this
> has been broken since v3.16:
>
>     make KBUILD_SRC= ARCH=x86 archheaders
>     make -C /scratch/geert/linux/linux
> O=/scratch/geert/build/linux-uml-amd64/. archheaders
>     make -C /scratch/geert/build/linux-uml-amd64 \
>     KBUILD_SRC=/scratch/geert/linux/linux \
>     KBUILD_EXTMOD="" -f /scratch/geert/linux/linux/Makefile \
>     archheaders
>     make KBUILD_SRC= ARCH=x86 archheaders
>     make -C /scratch/geert/linux/linux
> O=/scratch/geert/build/linux-uml-amd64/. archheaders
>     make -C /scratch/geert/build/linux-uml-amd64 \
>     KBUILD_SRC=/scratch/geert/linux/linux \
>     KBUILD_EXTMOD="" -f /scratch/geert/linux/linux/Makefile \
>     archheaders
>     ...
>
> Unfortunately reverting that commit doesn't help, as that causes the
> failure that
> commit was supposed to fix:
>
>     /scratch/geert/linux/linux/arch/x86/um/user-offsets.c:19:29: fatal
> error: asm/syscalls_64.h: No such file or directory
>      #include <asm/syscalls_64.h>
>                                  ^
>     compilation terminated.
>     /scratch/geert/linux/linux/scripts/Makefile.build:154: recipe for
> target 'arch/x86/um/user-offsets.s' failed
>
> Do you have any clue? Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
