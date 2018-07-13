Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:47375 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729647AbeGMPNI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 13 Jul 2018 11:13:08 -0400
MIME-Version: 1.0
In-Reply-To: <gh36wo1ygh.fsf@lena.gouders.net>
References: <1530758389-30862-1-git-send-email-yamada.masahiro@socionext.com>
 <1530758389-30862-6-git-send-email-yamada.masahiro@socionext.com>
 <ghva9simch.fsf@lena.gouders.net> <ghbmbk0wbj.fsf@quad.gouders.net>
 <ghwou4prif.fsf@lena.gouders.net> <CAK7LNAT9WjCMVqtq1ivxOqNERVbnC5fQbzrPrGCfz0aAbk_DEQ@mail.gmail.com>
 <gh36wo1ygh.fsf@lena.gouders.net>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 13 Jul 2018 23:57:17 +0900
Message-ID: <CAK7LNASN6_TM6a8ciVdgOH19d+CypMP+RQBnDsCSCtqub5co=g@mail.gmail.com>
Subject: Re: [PATCH v3 05/12] kconfig: make syncconfig update .config
 regardless of sym_change_count
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Ulf Magnusson <ulfalizer@gmail.com>, Linus Torvalds <torvalds@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Kees Cook <keescook@chromium.org>, Ingo Molnar <mingo@kernel.org>, Michal Simek <monstr@monstr.eu>, "David S. Miller" <davem@davemloft.net>

2018-07-12 20:32 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>
>> 2018-07-09 20:39 GMT+09:00 Dirk Gouders <dirk@gouders.net>:
>>> Dirk Gouders <dirk@gouders.net> writes:
>>>
>>>> Dirk Gouders <dirk@gouders.net> writes:
>>>>
>>>>> Masahiro Yamada <yamada.masahiro@socionext.com> writes:
>>>>>
>>>>>> syncconfig updates the .config only when sym_change_count > 0, i.e.
>>>>>> any change in config symbols has been detected.
>>>>>>
>>>>>> Not only symbols but also comments are contained in the .config file.
>>>>>> If only comments are updated, they are not fed back to the .config,
>>>>>> then the stale comments are left-over.  Of course, this is just a
>>>>>> matter of comments, but why not fix it.
>>>>>
>>>>> Hello Masahiro,
>>>>>
>>>>> I am currently looking at and testing this series.
>>>>>
>>>>> First: For this patch I would suggest to also edit the syncconfig
>>>>>        section of "conf --help".
>>>>>
>>>>> Further, on a slow laptop, I was suspecting, this patch to cause full
>>>>> rebuilds of everything, each time I ran "make syncconfig" followed by
>>>>> "make" but could not verify this on another machine, so perhaps I am
>>>>> just (for testing purposes) removing the wrong files (modules.builtin
>>>>> for example) -- I am still testing.
>>>>>
>>>>> But, what irritates me with testing is that (also without your
>>>>> patches) two consecutive "make" produce different output, one of them
>>>>> always shows a warning and this is reproducable.  I just want to make
>>>>> sure there is no other problem that influences my testing:
>>>>>
>>>>> $ make
>>>>>   CALL    scripts/checksyscalls.sh
>>>>>   DESCEND  objtool
>>>>>   CHK     include/generated/compile.h
>>>>>   DATAREL arch/x86/boot/compressed/vmlinux
>>>>> Kernel: arch/x86/boot/bzImage is ready  (#15)
>>>>>   Building modules, stage 2.
>>>>>   MODPOST 211 modules
>>>>>
>>>>> $ make
>>>>>   CALL    scripts/checksyscalls.sh
>>>>>   DESCEND  objtool
>>>>>   CHK     include/generated/compile.h
>>>>>   LD      arch/x86/boot/compressed/vmlinux
>>>>> ld: arch/x86/boot/compressed/head_64.o: warning: relocation in read-only section `.head.text'
>>>>> ld: warning: creating a DT_TEXTREL in object.
>>>>>   ZOFFSET arch/x86/boot/zoffset.h
>>>>>   AS      arch/x86/boot/header.o
>>>>>   LD      arch/x86/boot/setup.elf
>>>>>   OBJCOPY arch/x86/boot/setup.bin
>>>>>   OBJCOPY arch/x86/boot/vmlinux.bin
>>>>>   BUILD   arch/x86/boot/bzImage
>>>>> Setup is 15580 bytes (padded to 15872 bytes).
>>>>> System is 8069 kB
>>>>> CRC e01d75ec
>>>>> Kernel: arch/x86/boot/bzImage is ready  (#15)
>>>>>   Building modules, stage 2.
>>>>>   MODPOST 211 modules
>>>>
>>>> I spent some more time with the behaviour described above and bisected
>>>> to the commit after that two consecutive invocations of "make" (on an
>>>> already compiled tree) seem to do different things.  That commit is
>>>> 98f78525371b55cc (x86/boot: Refuse to build with data relocations), so I
>>>> put Kees and Ingo on CC.
>>>>
>>>> I did the bisecting on another system, so I'll provide the output of two
>>>> consecutive "make" on an already compiled tree on that machine:
>>>>
>>>> $ make
>>>>   CALL    scripts/checksyscalls.sh
>>>>   DESCEND  objtool
>>>>   CHK     include/generated/compile.h
>>>>   DATAREL arch/x86/boot/compressed/vmlinux
>>>> Kernel: arch/x86/boot/bzImage is ready  (#48)
>>>>   Building modules, stage 2.
>>>>   MODPOST 165 modules
>>>>
>>>> $ make
>>>>   CALL    scripts/checksyscalls.sh
>>>>   DESCEND  objtool
>>>>   CHK     include/generated/compile.h
>>>>   LD      arch/x86/boot/compressed/vmlinux
>>>>   ZOFFSET arch/x86/boot/zoffset.h
>>>>   AS      arch/x86/boot/header.o
>>>>   LD      arch/x86/boot/setup.elf
>>>>   OBJCOPY arch/x86/boot/setup.bin
>>>>   OBJCOPY arch/x86/boot/vmlinux.bin
>>>>   BUILD   arch/x86/boot/bzImage
>>>> Setup is 15644 bytes (padded to 15872 bytes).
>>>> System is 6663 kB
>>>> CRC 3eb90f40
>>>> Kernel: arch/x86/boot/bzImage is ready  (#48)
>>>>   Building modules, stage 2.
>>>>   MODPOST 165 modules
>>>>
>>>> If I comment out $(call if_changed,check_data_rel) in
>>>> arch/x86/boot/compressed/Makefile, two consecutive "make" produce
>>>> identical output i.e. seem to not do different things:
>>>>
>>>> $ make
>>>>   CALL    scripts/checksyscalls.sh
>>>>   DESCEND  objtool
>>>>   CHK     include/generated/compile.h
>>>> Kernel: arch/x86/boot/bzImage is ready  (#49)
>>>>   Building modules, stage 2.
>>>>   MODPOST 165 modules
>>>>
>>>> $ make
>>>>   CALL    scripts/checksyscalls.sh
>>>>   DESCEND  objtool
>>>>   CHK     include/generated/compile.h
>>>> Kernel: arch/x86/boot/bzImage is ready  (#49)
>>>>   Building modules, stage 2.
>>>>   MODPOST 165 modules
>>>>
>>>> So, I guess this different behaviour of two consecutive "make" is not
>>>> intentional but I am failing to understand why it happens.
>>>
>>> I think, I solved the puzzle and perhaps, that saves others some time:
>>>
>>> The problem is that "if_changed" was not designed for multiple use
>>> inside a recipe and in the case of compressed/vmlinux, the 2-fold use
>>> created a kind of flip-flop for situations when nothing has to be done
>>> to build the target.
>>>
>>> Because each of the two users of "if_changed" stores it's footprint in
>>> .vmlinux.cmd but that file then isn't re-read, one of the two
>>> "if_changed" calculates that nothing has to be done wheras the other one
>>> recognizes a change in the commandline, because it sees the command-line
>>> for the other part of the reciepe.
>>>
>>> In the next make, the roles flip, because the previously satisfied
>>> "if_changed" now sees the command-line of the other one.  And so on...
>>>
>>> I am not a Kbuild expert but the attached patch fixes that problem by
>>> introducing "if_changed_multi" that accepts two commands -- one whose
>>> commandline should be checked and a second one that should be
>>> executed.
>>
>>
>> if_changed should not appear multiple times in one target.
>>
>> I think the simplest fix-up is to
>> create a new command that combines
>> 'cmd_check_data_rel' and 'cmd_ld'.
>>
>>
>> quiet_cmd_link-vmlinux = LD      $@
>>       cmd_link-vmlinux = $(cmd_check_data_rel); $(cmd_ld)
>>
>> $(obj)/vmlinux: $(vmlinux-objs-y) FORCE
>>         $(call if_changed,link-vmlinux)
>>
>> Kbuild also supports if_changed_rule,
>> but the usage is more complex.
>>
>> There are only a few usages:
>> https://github.com/torvalds/linux/blob/v4.17/scripts/Makefile.build#L288
>
> Just for completeness I will copy in part of a reply from Kees that
> shows how double-colon rules can also avoid multiple use of if_changed
> for one target:
>
> -$(obj)/vmlinux: $(vmlinux-objs-y) FORCE
> -       $(call if_changed,check_data_rel)
> +$(obj)/vmlinux:: $(vmlinux-objs-y)
> +       $(call cmd,check_data_rel)
> +$(obj)/vmlinux:: $(vmlinux-objs-y) FORCE
>         $(call if_changed,ld)

It is difficult to use double-colon rules in a _sane_ way.

The first one just checks data_rel,
but does not actually generate anything.

Such targets should be marked as .PHONY,
but $(obj)/vmlinux is not a phony target.
This is strange.





> The combined command seems to have the advantage that every command to
> build the target gets recorded in the .cmd file
>
> A search showed me that we have two more users that use if_changed more
> than once for a single target:
>
>           arch/microblaze/boot/Makefile                 (fourfold)
>           arch/sparc/boot/Makefile               (2 times twofold)
>
> The sparc case seems to apply to any of the two suggested fixes,

Neither is correct.




$(obj)/uImage: $(obj)/image.gz
        $(call if_changed,uimage)
        $(call if_changed,uimage.o)


should be split into two targets.



$(obj)/uImage: $(obj)/image.gz FORCE
        $(call if_changed,uimage)

$(obj)/uImage.o: $(obj)/uImage FORCE
        $(call if_changed,uimage.o)



It is wrong in multiple ways.  FORCE is missing too.





 but
> microblaze uses if_changed in a pattern rule and also makes use of
> parameter arguments in the sub-commands:
>
> $(obj)/simpleImage.%: vmlinux FORCE
>         $(call if_changed,cp,.unstrip)
>         $(call if_changed,objcopy)
>         $(call if_changed,uimage)
>         $(call if_changed,strip,.strip)
>         @echo 'Kernel: $(UIMAGE_OUT) is ready' ' (#'`cat .version`')'



Probably, this is the same.

Create a target for each step.




> In this case, double colons would have a different meaning and the
> combined command solution would result in a change of the sub-commands,
> as well.  I note this in case Michal perhaps has other preferences.
>
>
> In addition to extend the documentation, we could modify if_changed to
> warn about it is being used more than once for a target:
>
> # Execute command if command has changed or prerequisite(s) are updated.
> if_changed = $(if $(filter-out undefined,$(origin if_changed_$@)),           \
>         @set -e;                                                             \
>         echo "Warning: $@: multiple use of if_changed!" >&2; ,               \
>         @set -e $(eval if_changed_$@ := 1) ; )                               \
>         $(if $(strip $(any-prereq) $(arg-check)),                            \
>         $(echo-cmd) $(cmd_$(1));                                             \
>         printf '%s\n' 'cmd_$@ := $(make-cmd)' > $(dot-target).cmd, :)
>
> But this fires only if if_changed is actually called and it defines many
> variables for just that purpose, so this is perhaps not what we want...
>

I do not want to mess up Makefile.


Please do this check in scripts/checkpatch.pl
if you want.


-- 
Best Regards
Masahiro Yamada
