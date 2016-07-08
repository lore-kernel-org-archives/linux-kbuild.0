Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:53432 "EHLO
	conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753464AbcGHBmP (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 7 Jul 2016 21:42:15 -0400
MIME-Version: 1.0
In-Reply-To: <5717639.GLOFncF6tL@wuerfel>
References: <20160704142608.2069991-1-arnd@arndb.de> <CAK7LNAT4mZ_W46wvmM9BWY8VDznfi7mXOHDQvV2sXXrUiH5sVQ@mail.gmail.com>
 <5717639.GLOFncF6tL@wuerfel>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 8 Jul 2016 10:41:57 +0900
Message-ID: <CAK7LNATAp0vbHD5r9gboKGyozNhruMbn9mHM1ggYtfTtnzC1Tw@mail.gmail.com>
Subject: Re: [PATCH] [RFC] Kbuild: avoid "make tinyconfig" warnings
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Michal Marek <mmarek@suse.cz>, "Yann E. MORIN" <yann.morin.1998@free.fr>, Josh Triplett <josh@joshtriplett.org>, Darren Hart <dvhart@linux.intel.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, kernel-build-reports@lists.linaro.org, Michal Marek <mmarek@suse.com>, Thiago Macieira <thiago.macieira@intel.com>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

Hi Arnd,

2016-07-06 22:49 GMT+09:00 Arnd Bergmann <arnd@arndb.de>:

>>
>>
>> The dependency "tinyconfig: $(obj)/conf" is redundant.
>>
>>
>> It is already specified by:
>>
>> allnoconfig allyesconfig allmodconfig alldefconfig randconfig: $(obj)/conf
>>          $< --$@ $(Kconfig)
>
>
> I don't see that yet. How does this line provide the dependency?


"make tinyconfig" works like this:


[1] In the top Makefile, Kbuild handles "make tinyconfig"
    with the following rule:

%config: scripts_basic outputmakefile FORCE
        $(Q)$(MAKE) $(build)=scripts/kconfig $@


So, Kbuild will descend into scripts/kconfig.



[2] In scripts/kconfig/Makefile, Kbuild handles "make tinyconfig"
    with the following rule:


tinyconfig:
        $(Q)$(MAKE) -f $(srctree)/Makefile allnoconfig tiny.config


-f $(srctree)/Makefile   means "use the top Makefile".

So, Kbuild will go back to the top Makefile and run "make allnoconfig
tiny.config" there.



[3] In the top Makefile, Kbuild handles "make allnoconfig tiny.config"
     with the following rule  (mixed targets):


__build_one_by_one:
        $(Q)set -e; \
        for i in $(MAKECMDGOALS); do \
                 $(MAKE) -f $(srctree)/Makefile $$i; \
        done


This means, run "make allnoconfig", then "make tiny.config"
in this order.


[4] In the top Makefile, Kbuild handles "make allnoconfig"
    with the following rule:

%config: scripts_basic outputmakefile FORCE
        $(Q)$(MAKE) $(build)=scripts/kconfig $@

Kbuild will descend into scripts/kconfig.


[5] In scripts/kconfig/Makefile, Kbuild handles "make allnoconfig"
     with the following rule:

simple-targets := oldconfig allnoconfig allyesconfig allmodconfig \
         alldefconfig randconfig listnewconfig olddefconfig
PHONY += $(simple-targets)

$(simple-targets): $(obj)/conf
          $< $(silent) --$@ $(Kconfig)


At this point, $(obj)/conf is generated and then, Kbuild runs allnoconfig.



[6] In the top Makefile, Kbuild handles "make tiny.config"
    with the following rule:

%config: scripts_basic outputmakefile FORCE
        $(Q)$(MAKE) $(build)=scripts/kconfig $@

Kbuild will descend into scripts/kconfig.


[7] In scripts/kconfig/Makefile, Kbuild handles "make tiny.config"
    with the following rule:

%.config: $(obj)/conf
       $(if $(call configfiles),, $(error No configuration exists for
this target on this architecture))
       $(Q)$(CONFIG_SHELL) $(srctree)/scripts/kconfig/merge_config.sh
-m .config $(configfiles)
       +$(Q)yes "" | $(MAKE) -f $(srctree)/Makefile oldconfig



I hope this is helpful.





>
> So, let's ignore my incorrect patch for the moment. Do you have
> any other idea for how to avoid the warning?


Of your four ideas, I do not like the first two,
but the others sound reasonable.




> - merge the fragments first and then use the combined fragment as the
>   KCONFIG_ALLCONFIG file.

This is a strait-forward solution.
I thought of this one, too.


> - change merge_config.sh to do a 'savedefconfig' step before applying
>   the fragment, so it doesn't warn about choice statements that are
>   overridden from their default, as opposed to having conflicting choices.

This sounds interesting.





BTW, I have been wondering if we could support merge_config
as a native feature of Kconfig instead of by a separate shell script.

If we could support KCONFIG_ALLCONFIG for "make oldconfig"
perhaps merge_config.sh will go away?
Maybe I am missing something, though.



-- 
Best Regards
Masahiro Yamada
