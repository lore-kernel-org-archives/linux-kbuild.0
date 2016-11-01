Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-pf0-f195.google.com ([209.85.192.195]:36741 "EHLO
        mail-pf0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbcKAW7I (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 1 Nov 2016 18:59:08 -0400
Date: Tue, 1 Nov 2016 22:59:05 +0000
From: Wei Yang <richard.weiyang@gmail.com>
Subject: Re: [PATCH] kbuild: add %/built-in.o target in top Makefile
Message-ID: <20161101225905.GA9142@vultr.guest>
Reply-To: Wei Yang <richard.weiyang@gmail.com>
References: <1477313111-25205-1-git-send-email-richard.weiyang@gmail.com>
 <794882b2-dfd1-ab76-11a9-8e5126247d23@suse.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <794882b2-dfd1-ab76-11a9-8e5126247d23@suse.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.com>
Cc: Wei Yang <richard.weiyang@gmail.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Nov 01, 2016 at 05:27:34PM +0100, Michal Marek wrote:
>On 2016-10-24 14:45, Wei Yang wrote:
>
>> diff --git a/Makefile b/Makefile
>> index addb235..546998e 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -1627,6 +1627,8 @@ endif
>>  	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>>  %.symtypes: %.c prepare scripts FORCE
>>  	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>> +%/built-in.o: prepare scripts
>> +	$(Q)$(MAKE) $(build)=$(build-dir) $(target-dir)$(notdir $@)
>
>This rule gets in the way of
>
>   975  # The actual objects are generated when descending,
>   976  # make sure no implicit rule kicks in
>   977  $(sort $(vmlinux-deps)): $(vmlinux-dirs) ;
>

Yes, second level built-in.o is built because of this rule, while for deeper
level built-in.o we don't have a rule now. This patch is trying to add a rule
for those deeper level built-in.o.

>Quickly looking at the Makefile, it may be fine, but it needs to be
>confirmed. This also explains why the current behavior with */built-in.o
>is inconsistent.
>

Agree with you. 

One of my concern is whether it is necessary to add "FORCE" to the prerequest.
I have tried on my machine, it works fine without "FORCE", while maybe it
won't work fine with some version of "make".

This is what I want to confirm. Any other potential issue, just let me know.

Thanks for your comment :-)

>Michal

-- 
Wei Yang
Help you, Help me
