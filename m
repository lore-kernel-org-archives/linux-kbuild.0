Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-01.nifty.com ([210.131.2.80]:52619 "EHLO
        conssluserg-01.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752929AbeCPCg1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 15 Mar 2018 22:36:27 -0400
MIME-Version: 1.0
In-Reply-To: <nycvar.YSQ.7.76.1803152229070.28583@knanqh.ubzr>
References: <1521166725-24157-1-git-send-email-yamada.masahiro@socionext.com>
 <1521166725-24157-8-git-send-email-yamada.masahiro@socionext.com> <nycvar.YSQ.7.76.1803152229070.28583@knanqh.ubzr>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 16 Mar 2018 11:35:32 +0900
Message-ID: <CAK7LNAQL=AQ8LKdP1Bg5dDLGSGvkiOyOqpvpcqiD-vm8+MLy=Q@mail.gmail.com>
Subject: Re: [PATCH v2 7/7] kbuild: link vmlinux only once for CONFIG_TRIM_UNUSED_KSYMS
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>

2018-03-16 11:32 GMT+09:00 Nicolas Pitre <nicolas.pitre@linaro.org>:
> On Fri, 16 Mar 2018, Masahiro Yamada wrote:
>
>> +# Recurse until adjust_autoksyms.sh is satisfied
>> +PHONY += autoksyms_recursive
>> +autoksyms_recursive: $(vmlinux-deps)
>> +     $(Q)$(CONFIG_SHELL) $(srctree)/scripts/adjust_autoksyms.sh  \
>>         "$(MAKE) -f $(srctree)/Makefile vmlinux"
>> -endif
>>
>>  # For the kernel to actually contain only the needed exported symbols,
>>  # we have to build modules as well to determine what those symbols are.
>> @@ -1034,7 +1024,13 @@ cmd_link-vmlinux =                                                 \
>>       $(CONFIG_SHELL) $< $(LD) $(LDFLAGS) $(LDFLAGS_vmlinux) ;    \
>>       $(if $(ARCH_POSTLINK), $(MAKE) -f $(ARCH_POSTLINK) $@, true)
>>
>> -vmlinux: scripts/link-vmlinux.sh vmlinux_prereq $(vmlinux-deps) FORCE
>> +vmlinux: scripts/link-vmlinux.sh autoksyms_recursive $(vmlinux-deps) FORCE
>
> Don't you have to make the autoksyms_recursive dependency conditional on
> CONFIG_TRIM_UNUSED_KSYMS?
>

Oops, I accidentally removed that conditional.

I will fix it shortly.  Thanks!


-- 
Best Regards
Masahiro Yamada
