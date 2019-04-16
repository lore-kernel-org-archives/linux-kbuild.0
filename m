Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:48574 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725861AbfDPONQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 16 Apr 2019 10:13:16 -0400
Subject: Re: [PATCH v3 2/9] kbuild: Support for Symbols.list creation
References: <20190410155058.9437-1-joe.lawrence@redhat.com>
 <20190410155058.9437-3-joe.lawrence@redhat.com>
 <alpine.LSU.2.21.1904112100400.18787@pobox.suse.cz>
From: Joe Lawrence <joe.lawrence@redhat.com>
Message-ID: <b2b5b57e-ae55-8e7b-f4f4-fa4f15194d77@redhat.com>
Date: Tue, 16 Apr 2019 10:13:13 -0400
MIME-Version: 1.0
In-Reply-To: <alpine.LSU.2.21.1904112100400.18787@pobox.suse.cz>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Miroslav Benes <mbenes@suse.cz>
Cc: linux-kernel@vger.kernel.org, live-patching@vger.kernel.org, linux-kbuild@vger.kernel.org, Jessica Yu <jeyu@kernel.org>, Jiri Kosina <jikos@kernel.org>, Joao Moreira <jmoreira@suse.de>, Josh Poimboeuf <jpoimboe@redhat.com>, Konstantin Khlebnikov <khlebnikov@yandex-team.ru>, Masahiro Yamada <yamada.masahiro@socionext.com>, Michael Matz <matz@suse.de>, Nicolai Stange <nstange@suse.de>, Petr Mladek <pmladek@suse.com>

On 4/11/19 3:04 PM, Miroslav Benes wrote:
> 
>> diff --git a/samples/livepatch/Makefile b/samples/livepatch/Makefile
>> index 2472ce39a18d..8b9b42a258ad 100644
>> --- a/samples/livepatch/Makefile
>> +++ b/samples/livepatch/Makefile
>> @@ -1,3 +1,4 @@
>> +LIVEPATCH_livepatch-sample := y
>>   obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-sample.o
>>   obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-shadow-mod.o
>>   obj-$(CONFIG_SAMPLE_LIVEPATCH) += livepatch-shadow-fix1.o
> 
> We discussed this and I think there has been no conclusion yet. Shouldn't
> we do the same (add LIVEPATCH_) for the other samples here as well?

In v2 review, I mentioned moving this hunk to ("modpost: Add modinfo 
flag to livepatch modules") along with the same change to the other 
sample modules.  I didn't apply that for v3, but can do so for the next 
spin if it makes the commits easier to review.

-- Joe
