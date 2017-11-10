Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-04.nifty.com ([210.131.2.83]:61090 "EHLO
        conssluserg-04.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751292AbdKJJWK (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 10 Nov 2017 04:22:10 -0500
MIME-Version: 1.0
In-Reply-To: <f036cb4e-d8e3-28d9-966e-14d6eb3599cf@cn.fujitsu.com>
References: <1510242077-8122-1-git-send-email-yamada.masahiro@socionext.com>
 <1510242077-8122-4-git-send-email-yamada.masahiro@socionext.com> <f036cb4e-d8e3-28d9-966e-14d6eb3599cf@cn.fujitsu.com>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Fri, 10 Nov 2017 18:21:20 +0900
Message-ID: <CAK7LNARs0_DFH5RO=Q8Gsn8xagO+7dPJ8217d56DAgSw5GYHsg@mail.gmail.com>
Subject: Re: [PATCH 3/4] kbuild: create object directories simpler and faster
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cao jin <caoj.fnst@cn.fujitsu.com>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>, Sam Ravnborg <sam@ravnborg.org>, Douglas Anderson <dianders@chromium.org>, Michal Marek <mmarek@suse.com>, X86 ML <x86@kernel.org>, "H. Peter Anvin" <hpa@zytor.com>, Thomas Gleixner <tglx@linutronix.de>, Andy Lutomirski <luto@amacapital.net>, Ingo Molnar <mingo@redhat.com>

Hi Cao,


2017-11-10 17:45 GMT+09:00 Cao jin <caoj.fnst@cn.fujitsu.com>:

>> +ifneq ($(KBUILD_SRC),)
>> +# Create directories for object files if directory does not exist
>> +obj-dirs := $(sort $(obj) $(patsubst %/,%, $(dir $(targets))))
>> +$(shell mkdir -p $(obj-dirs))
>> +endif
>> +
>
> I just take a quick glance: is "$(obj)" here necessary? I think all
> $(targets) are under directory $(obj) when we descend into $(obj) to
> recursive make, if I don't miss anything.

Good catch!

I agree that $(obj) is unnecessary.
I will remove it if I see no problem in testing.

Thanks!


-- 
Best Regards
Masahiro Yamada
