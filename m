Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ew0-f219.google.com ([209.85.219.219]:64454 "EHLO
	mail-ew0-f219.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932337Ab0AFUKU convert rfc822-to-8bit (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Jan 2010 15:10:20 -0500
MIME-Version: 1.0
In-Reply-To: <4B44E5C8.2050006@suse.cz>
References: <alpine.LFD.2.00.1001061705140.3744@localhost.localdomain>
	 <4B44E5C8.2050006@suse.cz>
Date: Wed, 6 Jan 2010 21:10:18 +0100
Message-ID: <520f0cf11001061210w4d33fca6y98f091c4260577c0@mail.gmail.com>
Subject: Re: [PATCH] Don't mkdir -p include/config in the sourcetree when
	using O=outputdir option
From: John Kacur <jkacur@gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>, linux-kbuild@vger.kernel.org

On Wed, Jan 6, 2010 at 8:34 PM, Michal Marek <mmarek@suse.cz> wrote:
> John Kacur napsal(a):
>> The following is an example of how the Makefile currently can fail.
>> [jkacur@tycho rt.linux.git]$ make mrproper
>> [jkacur@tycho rt.linux.git]$ mkdir /bld/2.6.33-rc3
>> [jkacur@tycho rt.linux.git]$ cp /bld/config /bld/2.6.33-rc3/.config
>> [jkacur@tycho rt.linux.git]$ make O=/bld/2.6.33-rc3/ oldconfig
>>   HOSTCC  scripts/basic/fixdep
>>   HOSTCC  scripts/basic/docproc
>>   HOSTCC  scripts/basic/hash
>>   GEN     /bld/2.6.33-rc3/Makefile
>>   HOSTCC  scripts/kconfig/conf.o
>>   HOSTCC  scripts/kconfig/kxgettext.o
>>   HOSTCC  scripts/kconfig/zconf.tab.o
>>   HOSTLD  scripts/kconfig/conf
>> scripts/kconfig/conf -o arch/x86/Kconfig
>> [jkacur@tycho rt.linux.git]$ make O=/bld/2.6.33-rc3/
>>   GEN     /bld/2.6.33-rc3/Makefile
>> scripts/kconfig/conf -s arch/x86/Kconfig
>>   Using /home/jkacur/rt.linux.git as source for kernel
>>   /home/jkacur/rt.linux.git is not clean, please run 'make mrproper'
>>   in the '/home/jkacur/rt.linux.git' directory.
>> make[1]: *** [prepare3] Error 1
>> make: *** [sub-make] Error 2
>> [jkacur@tycho rt.linux.git]$ ls -ld include/config/
>> drwxrwxr-x 2 jkacur jkacur 6 2010-01-06 15:58 include/config/
>>
>> Signed-off-by: John Kacur <jkacur@redhat.com>
>> ---
>>  Makefile |    2 +-
>>  1 files changed, 1 insertions(+), 1 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 1231094..7d8d722 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -458,7 +458,7 @@ config: scripts_basic outputmakefile FORCE
>>       $(Q)$(MAKE) $(build)=scripts/kconfig $@
>>
>>  %config: scripts_basic outputmakefile FORCE
>> -     $(Q)mkdir -p include/linux include/config
>> +     $(Q)mkdir -p $(objtree)/include/linux include/config
>>       $(Q)$(MAKE) $(build)=scripts/kconfig $@
>
> Can you double-check that this patch really fixes your issue and that
> without this patch it fails again? Because 1) I can't reproduce this
> behaviour and I also don't see how it could f, 2) your problem is a
> include/config file somehow created in the source tree, but you patch
> the creation of include/linux. And if there really needs to be a fix,
> the same should be applied to the identical block above.
>
> thanks,

Hi Michal

Yes, I doubled checked that the problem exists, and it is quite easy for me to
reproduce. However, my proposed solution is also broken, please don't
apply, I'm still investigating.

I am surprised that you are not able to reproduce the problem though.
Did you follow the steps I that I outlined?

Thanks, John
