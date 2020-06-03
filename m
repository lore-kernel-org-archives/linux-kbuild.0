Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.talpidae.net ([176.9.32.230]:38475 "EHLO
        node0.talpidae.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725810AbgFCN2b (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 3 Jun 2020 09:28:31 -0400
Subject: Re: [PATCH] Makefile: allow modules_install if CONFIG_MODULES=n
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date: Wed, 03 Jun 2020 15:28:28 +0200
From: Jonas Zeiger <jonas.zeiger@talpidae.net>
In-Reply-To: <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
References: <288d045f9429fc4cfd9ffb244e1be2f8@talpidae.net>
 <CAK7LNARx2dcjedkN8cBq0veh6H1cVG6yyGq=Vf6xr2Bd_aHuRA@mail.gmail.com>
Message-ID: <de8bd991ea596e9309a89e8cf58fd471@talpidae.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, Michal Marek <michal.lkml@markovi.net>

On 2020-05-31 20:16, Masahiro Yamada wrote:
> On Thu, May 28, 2020 at 1:44 PM Jonas Zeiger 
> <jonas.zeiger@talpidae.net> wrote:
>> 
>> Many applications check for available kernel features via:
>> 
>>   * /proc/modules (loaded modules, present if CONFIG_MODULES=y)
>>   * $(MODLIB)/modules.builtin (builtin modules)
>> 
>> They fail to detect features if the kernel was built with
>> CONFIG_MODULES=n
>> and modules.builtin isn't installed.
>> 
>> Therefore, allow the Makefile's modules_install target to be used
>> always.
>> 
>> Tested Makefile targets with different CONFIG_MODULES states:
>> 
>>   * (CONFIG_MODULES=n) modules_install: install modules.builtin etc.
>>   * (CONFIG_MODULES=y) modules_install: produce same result as before
>>   * (CONFIG_MODULES=y) modules_install: still fail if no modules.order
>>   * (CONFIG_MODULES=y) modules: build modules, as before
>>   * (CONFIG_MODULES=n) modules: still fail and warn
>> 
>> Signed-off-by: Jonas Zeiger <jonas.zeiger@talpidae.net>
> 
> 
> Maybe, module.builtin and module.builtin.modinfo should be
> installed by 'make install' because they are byproducts of vmlinux.

Yes, thank you for this suggestion.

I will submit a new patch.
