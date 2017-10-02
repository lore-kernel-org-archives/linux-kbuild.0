Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from foss.arm.com ([217.140.101.70]:35638 "EHLO foss.arm.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750969AbdJBLU4 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 2 Oct 2017 07:20:56 -0400
Subject: Re: Fail to build Linux with O= in master
References: <cc4680bb-9e54-d449-606e-a3fa2e7a9763@arm.com>
 <CAK7LNAQh=RDUCsxMfX0QY6w4NyeMdUdgc0GbXDP=SEWDzqKXWQ@mail.gmail.com>
From: Julien Grall <julien.grall@arm.com>
Message-ID: <f6634898-357b-0c9b-ac22-8e0ca225b290@arm.com>
Date: Mon, 2 Oct 2017 12:20:54 +0100
MIME-Version: 1.0
In-Reply-To: <CAK7LNAQh=RDUCsxMfX0QY6w4NyeMdUdgc0GbXDP=SEWDzqKXWQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Michal Marek <mmarek@suse.com>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>, "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>

Hello,

On 30/09/17 01:37, Masahiro Yamada wrote:
> 2017-09-30 8:59 GMT+09:00 Julien Grall <julien.grall@arm.com>:
>> Hello,
>>
>> I have tried to build the latest master and got the following error:
>>
>> 42sh> make O=~/works/linux-build/aarch64-4k -C ~/works/linux
>> make: Entering directory '/home/julgra01/works/linux'
>> Makefile:135: *** failed to create output directory "~/works/linux-build/aarch64-4k".  Stop.
>> make: Leaving directory '/home/julgra01/works/linux'
>>
>> The bisector found the commit 8e9b466 "kbuild: use $(abspath ...)
>> instead of $(shell cd ... && /bin/pwd)".
>>
>> Looking at the code, it seems that it is because the code is
>> now using $(realpath ...). Indeed when I replace ~ by $HOME
>> the kernel is now built.
>>
>> I am not a Makefile expert, so I would appreciate if anyone
>> could suggest a patch for this.
>>
> 
> Thanks for the report.
> 
> Which shell are you using?

I am using dash.

> 
> I use bash and I have no problem.
> If I try dash, indeed, it fails.
> 
> I will take a look.

Thank you!

Cheers,

-- 
Julien Grall
