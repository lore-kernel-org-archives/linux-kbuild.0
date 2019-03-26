Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60656 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726811AbfCZUxP (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 26 Mar 2019 16:53:15 -0400
Subject: Re: [PATCH v2 2/8] kbuild: Support for Symbols.list creation
References: <20190301141313.15057-1-jmoreira@suse.de>
 <20190301141313.15057-3-jmoreira@suse.de> <20190318191926.GA23138@redhat.com>
 <alpine.LSU.2.21.1903202000470.29796@pobox.suse.cz>
 <5f615af5-ced7-2361-5b71-71fece8b43c5@suse.de>
 <ae018181-fd8a-03b2-69bf-e9302172bfeb@redhat.com>
 <699e78da-36ba-8217-c509-2e9b443bd380@suse.de>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <1b6ee81b-5699-a1cc-9a85-02df0eeaed12@redhat.com>
Date: Tue, 26 Mar 2019 16:53:12 -0400
MIME-Version: 1.0
In-Reply-To: <699e78da-36ba-8217-c509-2e9b443bd380@suse.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joao Moreira <jmoreira@suse.de>, Miroslav Benes <mbenes@suse.cz>
Cc: live-patching@vger.kernel.org, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

On 3/26/19 2:13 PM, Joao Moreira wrote:
> 
> 
> On 3/26/19 1:15 PM, Joe Lawrence wrote:
 >>
>> Hi Joao,
>>
>> This change seems to work okay for (again) single object modules, but
>> I'm having issues with multi-object modules.
>>
> 
> Hi Joe, thanks for the sources, this made everything much easier in my
> side :)
> 
> In the patch below I change a little bit the interface used to inform
> kbuild that a module is a livepatch. Instead of defining the flag
> LIVEPATCH_ per .o file, we define it per module (what actually makes
> much more sense). We later use $(basetarget) in the Makefile for
> checking the flags. By doing so, and invoking cmd_livepatch both from
> the $(single-used-m) and $(multi-used-m) we ensure that the .livepatch
> file is created for each module, what later in the pipeline flags the
> invocation of klp-convert.
> 
> I tested the following patch with the sources you provided (with little
> modifications, removing the .o from the LIVEPATCH_ definitions and using
> the module name instead of the object names), achieving successful
> compilation and conversion. I also tested against the sample
> livepatches, thus I think it might be ok now.

Cool thanks for taking a look -- I can confirm that the toy code I sent 
over builds with those modifications and so does the sample and selftest 
I was working on.  I'll set about refactoring that klp-convert selftest 
to combine .o files into a more compact module.

> Do you think we can go this way to solve the problem in v3?

Yeah, I'll add it to the list of patches to squash for v3.

Thanks,

-- Joe
