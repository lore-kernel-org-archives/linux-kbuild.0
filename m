Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mo4-p00-ob.smtp.rzone.de ([85.215.255.21]:26646 "EHLO
        mo4-p00-ob.smtp.rzone.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726066AbfCDWnd (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 4 Mar 2019 17:43:33 -0500
From: Robin Meijboom <robin@meijboom.info>
Subject: Re: [PATCH] objtool: remove generated files with make clean
References: <bca6deb0-ba70-12af-9381-72ae7d94c0c5@meijboom.info>
 <CAK7LNAS3a8u+khVim4bOOSi=QBHnEE35nEp=kfFCB5FYXkeG-A@mail.gmail.com>
 <f27a1ca8-a35f-00f2-a6d5-88cdb2cdd7d3@meijboom.info>
 <20190228222917.5unhtr4gxa7rcfwv@treble>
Message-ID: <725bf50f-69dd-5497-100e-33d06250dcb0@meijboom.info>
Date: Mon, 4 Mar 2019 23:43:13 +0100
MIME-Version: 1.0
In-Reply-To: <20190228222917.5unhtr4gxa7rcfwv@treble>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>
Cc: Masahiro Yamada <yamada.masahiro@socionext.com>, Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Peter Zijlstra <peterz@infradead.org>

On 28-02-19 23:29, Josh Poimboeuf wrote:
> On Thu, Feb 28, 2019 at 09:12:19PM +0100, Robin Meijboom wrote:
>> Hi Masahiro,
>>
>> On 28-02-19 14:36, Masahiro Yamada wrote:
>>> On Fri, Feb 15, 2019 at 11:15 AM Robin Meijboom <robin@meijboom.info> wrote:
>>>>
>>>> Make clean currently does not remove the generated files for objtool:
>>>> tools/objtool/objtool, tools/objtool/fixdep, and
>>>> tools/objtool/arch/x86/lib/inat-tables.c.
>>>>
>>>> Clean these files up as part of make clean.
>>>>
>>>> Fixes: b9ab5ebb14ec ("objtool: Add CONFIG_STACK_VALIDATION option") and
>>>> bug report 199485 (https://bugzilla.kernel.org/show_bug.cgi?id=199485).
>>>>
>>>> Signed-off-by: Robin Meijboom <robin@meijboom.info>
>>>> ---
>>>> In the discussions I didn't find a reason for keeping the files, so I
>>>> assume it is an oversight. Otherwise I would have expected them to be
>>>> removed at least by make distconfig (which they are not).
>>>>
>>>> Tested by compiling, cleaning, compiling again, and booting on x86_64.
>>>>
>>>> diff --git a/Makefile b/Makefile
>>>> index 141653226f3c..81a8149a805f 100644
>>>> --- a/Makefile
>>>> +++ b/Makefile
>>>> @@ -1328,6 +1328,8 @@ endif # CONFIG_MODULES
>>>>
>>>>   # Directories & files removed with 'make clean'
>>>>   CLEAN_DIRS  += $(MODVERDIR) include/ksym
>>>> +CLEAN_FILES += tools/objtool/objtool tools/objtool/fixdep \
>>>> +           tools/objtool/arch/$(ARCH)/lib/inat-tables.c
>>>>
>>>>   # Directories & files removed with 'make mrproper'
>>>>   MRPROPER_DIRS  += include/config usr/include include/generated          \
>>>>
>>>
>>>
>>>

Hi Josh,

Thanks for your feedback.

>>> I see the same artifacts are cleaned up by tools/objtool/Makefile:
>>>
>>> https://github.com/torvalds/linux/blob/v5.0-rc7/tools/objtool/Makefile#L59
>>>
>>>
>>> So, this patch proves the 'clean' target
>>> in tools/objtool/Makefile is useless.
>>>
>>
>> True. I believe this is because kbuild does not descend into that directory
>> as it does with the other directories. It works if you issue 'make clean'
>> from tools or tools/objtool.
> 
> Right.  Objtool is intended to be a standalone tool, though it's
> currently a bit kernel-specific.  So a clean target within tools/objtool
> makes sense I think.
> 

Clear. Currently objtool is also cleaned by the 'clean' target in
tools/Makefile. Would the above suggest that should be removed, or is it
fine as long as it is not in the top-level Makefile?

>>> BTW, 'make clean' must keep all the generated files
>>> that are needed to compile external modules.
>>>
>>> I guess cleaning objtool is wrong.
>>
>> I was considering the same. However, I did not find this in the discussions,
>> and as you pointed out the authors have included these items under the
>> 'make clean' target in tools/objtool/Makefile (which does not work for the
>> above reason).
>>
>> Additionally, if cleaning objtool is wrong, I would expect it to be at
>> least included in 'make distclean' or 'make mrproper' target (which it is
>> not).
>>
>> Josh, feel free to comment on the above.
> 
> Objtool is needed for module builds, so it should *not* be removed with
> 'make clean' from the top-level directory.
> 
> I guess it makes sense to remove it for mrproper (and by extension,
> distclean).  Maybe mrproper could use tools/objtool's clean target
> somehow.
> 

Since we have to use an exception anyway, my initial thought was to
use the 'standard exception' and include the artifacts in
MRPROPER_FILES. However, your idea is of course to _not_ have to
update the top-level Makefile every time you make a change to objtool
artifacts. I'm thinking about an elegant solution.

--
Kind regards,
Robin
