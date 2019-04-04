Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41212 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727053AbfDDNTJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Thu, 4 Apr 2019 09:19:09 -0400
Subject: Re: [PATCH v2 0/8] klp-convert
References: <20190301141313.15057-1-jmoreira@suse.de>
 <20190318191843.GA22702@redhat.com>
 <3423e586-5ae7-1dd2-8e5f-3930f168143b@suse.de>
 <0580fe97-7882-68c1-54f2-5778f47c5564@redhat.com>
 <alpine.LSU.2.21.1904041346350.32428@pobox.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <f52d29f7-7d1b-ad3d-050b-a9fa8878faf2@redhat.com>
Date: Thu, 4 Apr 2019 09:19:00 -0400
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.1904041346350.32428@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>
Cc: Joao Moreira <jmoreira@suse.de>, live-patching@vger.kernel.org, pmladek@suse.cz, jikos@suse.cz, nstange@suse.de, jpoimboe@redhat.com, khlebnikov@yandex-team.ru, jeyu@kernel.org, matz@suse.de, linux-kernel@vger.kernel.org, yamada.masahiro@socionext.com, linux-kbuild@vger.kernel.org, michal.lkml@markovi.net

On 4/4/19 7:49 AM, Miroslav Benes wrote:
>   
>> BTW, something I *just* noticed when putting together that toy out-of-tree
>> module to test out multi-object livepatch modules is that we aren't
>> considering out-of-tree symbols in Symbols.list.
>>
>> Perhaps we can save that for v4 or beyond, but maybe we want to re-arrange the
>> klp-convert arguments to "klp-convert <input.ko> <out.ko> <Symbols.list>
>> [Symbols.list ...]" where we treat everything after <out.ko> as a symbol list
>> file?  (This would assume we would generate a separate out-of-tree module
>> Symbols.list file.)    /thinking-out-loud
> 
> I understand it could help the testing quite a bit right now, but do we
> care about out-of-tree modules in general?
> 

Yeah, this was only something I hit because I found it easier to 
construct OOT modules to test and share with Joao.

I mentioned it because kpatch-build supports OOT and apparently some 
folks are using it:

   https://github.com/dynup/kpatch/pull/923

But like I said, we can push that off for another day for now.

-- Joe
