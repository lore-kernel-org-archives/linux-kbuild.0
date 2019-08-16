Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:47714 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726075AbfHPMnk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 16 Aug 2019 08:43:40 -0400
Subject: Re: [PATCH v4 06/10] modpost: Add modinfo flag to livepatch modules
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <20190509143859.9050-7-joe.lawrence@redhat.com>
 <CAK7LNAQuS-YcXecfJ21BGzc0CimzWxQcYST5-1xRgnCQGtcL4A@mail.gmail.com>
 <20190812155626.GA19845@redhat.com>
 <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
 <alpine.LSU.2.21.1908161016430.2020@pobox.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <6c7e4d19-b993-1c14-d6cf-6aa1ee891361@redhat.com>
Date: Fri, 16 Aug 2019 08:43:37 -0400
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.1908161016430.2020@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>, Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 8/16/19 4:19 AM, Miroslav Benes wrote:
> Hi,
> 
>> I cleaned up the build system, and pushed it based on my
>> kbuild tree.
>>
>> Please see:
>>
>> git://git.kernel.org/pub/scm/linux/kernel/git/masahiroy/linux-kbuild.git
>> klp-cleanup
> 
> This indeed looks much simpler and cleaner (as far as I can judge with my
> limited kbuild knowledge). We just need to remove MODULE_INFO(livepatch,
> "Y") from lib/livepatch/test_klp_convert_mod_a.c to make it compile and
> work (test_klp_convert_mod_a is not a livepatch module, it is just a dummy
> module which is then livepatched by lib/livepatch/test_klp_convert1.c).
> 

Yeah, Masahiro this is great, thanks for reworking this!

I did tweak one module like Miroslav mentioned and I think a few of the 
newly generated files need to be cleaned up as part of "make clean", but 
all said, this is a nice improvement.

Are you targeting the next merge window for your kbuild branch?  (This 
appears to be what the klp-cleanup branch was based on.)

Thanks,

-- Joe
