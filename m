Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from conssluserg-02.nifty.com ([210.131.2.81]:20849 "EHLO
        conssluserg-02.nifty.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725909AbeHWKto (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 23 Aug 2018 06:49:44 -0400
MIME-Version: 1.0
In-Reply-To: <7e154505-5f73-1054-e67e-cdfb249fec43@infradead.org>
References: <490A46D5-834E-46A9-9106-A31F94344F99@goldelico.com>
 <d5093e14-c826-9183-cd94-ecb99a799fc8@infradead.org> <CAKdAkRQ+BXezzT0JsuSa_-imHq+u-q2P5rMVMCL4=N18VYxSAw@mail.gmail.com>
 <7e154505-5f73-1054-e67e-cdfb249fec43@infradead.org>
From: Masahiro Yamada <yamada.masahiro@socionext.com>
Date: Thu, 23 Aug 2018 16:20:40 +0900
Message-ID: <CAK7LNAQ2n7jceVTV+EMt4atMvrWs+K=kgVzL-OkiTxYJCFUzTg@mail.gmail.com>
Subject: Re: please revert commit ce8556cca6 "kbuild: verify that $DEPMOD is
 installed" introduced in v4.18.4.
Content-Type: text/plain; charset="UTF-8"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: Dmitry Torokhov <dmitry.torokhov@gmail.com>, "Dr. H. Nikolaus Schaller" <hns@goldelico.com>, Lucas De Marchi <lucas.demarchi@profusion.mobi>, Lucas De Marchi <lucas.de.marchi@gmail.com>, Michal Marek <michal.lkml@markovi.net>, Jessica Yu <jeyu@kernel.org>, Chih-Wei Huang <cwhuang@linux.org.tw>, "3.8+" <stable@vger.kernel.org>, lkml <linux-kernel@vger.kernel.org>, Discussions about the Letux Kernel <letux-kernel@openphoenux.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

2018-08-23 10:07 GMT+09:00 Randy Dunlap <rdunlap@infradead.org>:
> On 08/22/2018 05:39 PM, Dmitry Torokhov wrote:
>> On Wed, Aug 22, 2018 at 4:35 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>>>
>>> On 08/22/2018 11:53 AM, H. Nikolaus Schaller wrote:
>>>> This patch requires that /sbin/depmod is installed and installable on
>>>> the build host.
>>>>
>>>> But not all build hosts for cross compiling Linux are Linux systems
>>>> and are able to provide a working port of depmod, especially at the
>>>> file patch /sbin/depmod.
>>>>
>>>> I use, for example, a Darwin system to cross compile Linux and I run
>>>> depmod -a on the embedded system once, after installing a new Linux
>>>> kernel there.
>>>>
>>>> I have no problem with seeing a warning, but aborting the build process
>>>> is IMHO a bad idea since the previous behaviour didn't harm many people
>>>> as far as I see. Probably 99% of people compiling Linux kernels do that
>>>> on Linux and 99% of those have depmod installed for optimal operation of
>>>> their build host. So IMHO printing the warning is good enough.
>>>
>>> Thanks for the report and sorry about the problem.
>>>
>>> I'm OK with changing the error to a warning.
>>> Does the patch below work for you?
>>
>> Why would one want a warning on a host that never runs "make modules_install"?
>> Can this check be only done when we actually try to install modules?
>
>
> So Nikolaus:  how do you provoke this problem that you are reporting?
> It's not just a theoretical problem, is it?
>
> The way that I read the top-level Makefile, this check for $DEPMOD only happens
> when you run "make modules_install".
>
> --
> ~Randy


Unless I am misunderstanding, he wants to use
"make modules_install" just for copying modules.

Then, he will run depmod on the target system later.




-- 
Best Regards
Masahiro Yamada
