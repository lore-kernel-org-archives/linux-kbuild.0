Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.codeaurora.org ([198.145.29.96]:50154 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726785AbfIVVI4 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 22 Sep 2019 17:08:56 -0400
Subject: Re: [PATCH] kbuild: binrpm-pkg: Propagate O= to rpmbuild
References: <1569006062-17862-1-git-send-email-jhugo@codeaurora.org>
 <CAK7LNATHu6M8zKQi4O30Dvijg0zi8Lvxv6EBbWOE+H_s=E6m+Q@mail.gmail.com>
From: Jeffrey Hugo <jhugo@codeaurora.org>
Message-ID: <e4f88d2a-2551-7a63-629c-21d053d73b84@codeaurora.org>
Date: Sun, 22 Sep 2019 15:08:52 -0600
MIME-Version: 1.0
In-Reply-To: <CAK7LNATHu6M8zKQi4O30Dvijg0zi8Lvxv6EBbWOE+H_s=E6m+Q@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <michal.lkml@markovi.net>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

On 9/20/2019 11:30 PM, Masahiro Yamada wrote:
> Hi Jeffrey,
> 
> On Sat, Sep 21, 2019 at 4:01 AM Jeffrey Hugo <jhugo@codeaurora.org> wrote:
>>
>> If the user specifies O= to indicate a specific output directory for the
>> build, rpmbuild does not honor this, and will use its default, which could
>> be the user's home directory.  In cases where the user has limited home
>> directory space, this could cause the build to outright fail.
>>
>> In the case of the binrpm-pkg target, redefine the top directory for output
>> to be what the user specified in O=, thus the user will find a "rpmbuild"
>> subdirectory in that location with all of the RPM artifacts.
>>
>> This does not apply to rpm-pkg, since we already cannot handle creating
>> the source tarball out of tree.
>>
>> Signed-off-by: Jeffrey Hugo <jhugo@codeaurora.org>
> 
> 
> binrpm-pkg creates intermediate build artifacts in $(objtree)/,
> but puts only the final .rpm into ${HOME}/rpmbuild/RPMS/${ARCH}/.

I disagree with this.  Ubuntu 16.04 with the 4.12 version of the rpm 
packaging utilities will create several directories under rpmbuild in 
the user's home directory -
BUILDROOT  RPMS  SOURCES  SPECS  SRPMS

SOURCES/SPECS/SRPMS are empty for binrpm-pkg.
RPMs contains the final RPMs as you've indicated
BUILDROOT appears to contain more intermediate files which are used to 
then generate the final rpms.

It seems like more than just the final rpms are dumped into the home 
directory.

> 
> It has worked like that since a long time before
> probably in order to respect the default of rpmbuild.

It still seems inconsistent to me that there is an option defined 
(KBUILD_OUTPUT and O=) which is described to allow the user to specify 
the location of the build output, yet there are parts of the build 
system which do not respect this.

I also find it curious that there is a comment in the makefile this 
patch modifies that seems to suggest that it is intended for O= to 
impact the binrpm-pkg target, however that is currently not the case.

> 
> 
> If you change this behavior, it should be consistent.
> The 'rpmbuild' should be always located in the kernel tree
> instead of the user's home directory.

I'm ok with this.  The current patch attempts to preserve current 
behavior in the default case of not specifying an output directory, but 
dumping everything in the kernel tree seems sane to me.

> 
> But, doing so might give impact to other users who
> rely on having 'rpmbuild' in the home directory.
> I have to hear opinions from others
> if this change is desired.

Fair enough.

> 
> Meanwhile, if you are unhappy with that, one solution is to use RPMOPTS.
> RPMOPTS exists to tweak the default behavior.

I don't see this documented anywhere.  I'm assuming that is supposed to 
be an environment variable.  I'll have to see how well that works with 
our automated build systems.  Command line options are generally preferred.

> 
> 
> Thanks.
> 
> 
>> ---
>>   scripts/Makefile.package | 12 +++++++++---
>>   1 file changed, 9 insertions(+), 3 deletions(-)
>>
>> diff --git a/scripts/Makefile.package b/scripts/Makefile.package
>> index 56eadcc..aab0711 100644
>> --- a/scripts/Makefile.package
>> +++ b/scripts/Makefile.package
>> @@ -21,7 +21,7 @@ include $(srctree)/scripts/Kbuild.include
>>   # - Use /. to avoid tar packing just the symlink
>>
>>   # Note that the rpm-pkg target cannot be used with KBUILD_OUTPUT,
>> -# but the binrpm-pkg target can; for some reason O= gets ignored.
>> +# but the binrpm-pkg target can
>>
>>   # Remove hyphens since they have special meaning in RPM filenames
>>   KERNELPATH := kernel-$(subst -,_,$(KERNELRELEASE))
>> @@ -33,6 +33,12 @@ TAR_CONTENT := $(KBUILD_ALLDIRS) .config .scmversion Makefile \
>>                  Kbuild Kconfig COPYING $(wildcard localversion*)
>>   MKSPEC     := $(srctree)/scripts/package/mkspec
>>
>> +RPM_OUTDIR :=
>> +ifneq ($(objtree),$(srctree))
>> +# Using absolute path as relative path will cause parts of rpmbuild to fail
>> +        RPM_OUTDIR := --define "_topdir $(abs_objtree)/rpmbuild"
>> +endif
>> +
>>   quiet_cmd_src_tar = TAR     $(2).tar.gz
>>         cmd_src_tar = \
>>   if test "$(objtree)" != "$(srctree)"; then \
>> @@ -65,8 +71,8 @@ PHONY += binrpm-pkg
>>   binrpm-pkg:
>>          $(MAKE) -f $(srctree)/Makefile
>>          $(CONFIG_SHELL) $(MKSPEC) prebuilt > $(objtree)/binkernel.spec
>> -       +rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" --target \
>> -               $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>> +       +rpmbuild $(RPMOPTS) --define "_builddir $(objtree)" $(RPM_OUTDIR) \
>> +               --target $(UTS_MACHINE) -bb $(objtree)/binkernel.spec
>>
>>   PHONY += deb-pkg
>>   deb-pkg:
>> --
>> Qualcomm Technologies, Inc. is a member of the
>> Code Aurora Forum, a Linux Foundation Collaborative Project.
>>
> 
> 
> --
> Best Regards
> Masahiro Yamada
> 


-- 
Jeffrey Hugo
Qualcomm Technologies, Inc. is a member of the
Code Aurora Forum, a Linux Foundation Collaborative Project.
