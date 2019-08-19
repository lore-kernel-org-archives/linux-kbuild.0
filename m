Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:45192 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726373AbfHSPzV (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Mon, 19 Aug 2019 11:55:21 -0400
Subject: Re: [PATCH v4 06/10] modpost: Add modinfo flag to livepatch modules
References: <20190509143859.9050-1-joe.lawrence@redhat.com>
 <20190509143859.9050-7-joe.lawrence@redhat.com>
 <CAK7LNAQuS-YcXecfJ21BGzc0CimzWxQcYST5-1xRgnCQGtcL4A@mail.gmail.com>
 <20190812155626.GA19845@redhat.com>
 <CAK7LNATRLTBqA9c=b+Y38T-zWc9o5JMq18r9auA=enPC=p10pA@mail.gmail.com>
 <alpine.LSU.2.21.1908161016430.2020@pobox.suse.cz>
 <6c7e4d19-b993-1c14-d6cf-6aa1ee891361@redhat.com>
 <163ad1fb-ccbf-0a3e-d795-2bb748a0e88f@redhat.com>
 <CAK7LNAR-1qXUhZ=cKUK2WEg5WeinXgFf1B2rq-=Oke4CUucp_g@mail.gmail.com>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <9127bdf6-1daf-0387-88fb-6f1118dd6804@redhat.com>
Date: Mon, 19 Aug 2019 11:55:19 -0400
MIME-Version: 1.0
In-Reply-To: <CAK7LNAR-1qXUhZ=cKUK2WEg5WeinXgFf1B2rq-=Oke4CUucp_g@mail.gmail.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.masahiro@socionext.com>
Cc: Miroslav Benes <mbenes@suse.cz>, Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, live-patching@vger.kernel.org, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On 8/18/19 11:50 PM, Masahiro Yamada wrote:
> Hi Joe,
> 
> On Sat, Aug 17, 2019 at 4:01 AM Joe Lawrence <joe.lawrence@redhat.com> wrote:
>>
>>
>> I didn't realize that we're supposed to be able to still build external
>> modules after "make clean".  If that's the case, then one might want to
>> build an external klp-module after doing that.
> 
> Yes. 'make clean' must keep all the build artifacts
> needed for building external modules.
> 
> 
>> With that in mind, shouldn't Symbols.list to persist until mrproper?
>> And I think modules-livepatch could go away during clean, what do you think?
>>
>> -- Joe
> 
> 
> Symbols.list should be kept by the time mrproper is run.
> So, please add it to MRROPER_FILES instead of CLEAN_FILES.
> 
> modules.livepatch is a temporary file, so you can add it to
> CLEAN_FILES.
> 

OK, I'll add those to their respective lists.

> How is this feature supposed to work for external modules?
> 
> klp-convert receives:
> "symbols from vmlinux" + "symbols from no-klp in-tree modules"
> + "symbols from no-klp external modules" ??
> 

I don't think that this use-case has been previously thought out 
(Miroslav, correct me if I'm wrong here.)

I did just run an external build of a copy of 
samples/livepatch/livepatch-annotated-sample.c:

  - modules.livepatch is generated in external dir
  - klp-convert is invoked for the livepatch module
  - the external livepatch module successfully loads

But that was only testing external livepatch modules.

I don't know if we need/want to support general external modules 
supplementing Symbols.list, at least for the initial klp-convert commit. 
  I suppose external livepatch modules would then need to specify 
additional Symbols.list(s) files somehow as well.

> 
> BTW, 'Symbols.list' sounds like a file to list out symbols
> for generic purposes, but in fact, the
> file format is very specific for the klp-convert tool.
> Perhaps, is it better to rename it so it infers
> this is for livepatching? What do you think?
> 

I don't know if the "Symbols.list" name and leading uppercase was based 
on any convention, but something like symbols.klp would be fine with me.

Thanks,

-- Joe
