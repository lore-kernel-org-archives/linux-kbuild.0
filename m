Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ch1ehsobe004.messaging.microsoft.com ([216.32.181.184]:18647
	"EHLO ch1outboundpool.messaging.microsoft.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752705Ab2C2V6n (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 29 Mar 2012 17:58:43 -0400
Message-ID: <4F74DAE6.9000001@am.sony.com>
Date: Thu, 29 Mar 2012 14:57:58 -0700
From: Frank Rowand <frank.rowand@am.sony.com>
Reply-To: <frank.rowand@am.sony.com>
MIME-Version: 1.0
Subject: Re: [PATCH] Let modpost parses vmlinux instead of vmlinux.o
References: <4F737193.4030709@am.sony.com> <1333032786-12457-1-git-send-email-abogani@kernel.org> <4F74D9C3.5010907@am.sony.com>
In-Reply-To: <4F74D9C3.5010907@am.sony.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Rowand, Frank" <Frank_Rowand@sonyusa.com>
Cc: Alessio Igor Bogani <abogani@kernel.org>, Rusty Russell <rusty@rustcorp.com.au>, Jan Beulich <jbeulich@novell.com>, Kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, "Bird, Tim" <Tim.Bird@am.sony.com>, Anders Kaseorg <andersk@ksplice.com>, Arnaud Lacombe <lacombar@gmail.com>

On 03/29/12 14:53, Frank Rowand wrote:
> On 03/29/12 07:53, Alessio Igor Bogani wrote:
>> Dear Mr. Rowand,
> 
> No need to be formal, "Frank" is ok.
> 
> 
>>
>> What do you think about this patch?
> 
> It does not work for me.  The resulting Module.symvers is empty.
> 
> Before applying the Makefile patch, "make V=1" shows the command
                                      ^^^ "make V=1 vmlinux"
> to generate Module.symvers is:
> 
>   scripts/mod/modpost   -o /a/home/frowand/me/src/linux/kernel-org/build/crest/Module.symvers    -S   vmlinux.o
> 
> after applying the patch, the command becomes:
> 
>   scripts/mod/modpost   -o /a/home/frowand/me/src/linux/kernel-org/build/crest/Module.symvers    -S   -s
> 
> 
> -Frank
> 
>> Thanks!
>>
>> Ciao,
>> Alessio
>>
>> ---
>>  Makefile                 |    2 +-
>>  scripts/Makefile.modpost |    2 +-
>>  2 files changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/Makefile b/Makefile
>> index 123d858..b589d1f 100644
>> --- a/Makefile
>> +++ b/Makefile
>> @@ -876,7 +876,7 @@ quiet_cmd_vmlinux-modpost = LD      $@
>>  define rule_vmlinux-modpost
>>  	:
>>  	+$(call cmd,vmlinux-modpost)
>> -	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost $@
>> +	$(Q)$(MAKE) -f $(srctree)/scripts/Makefile.modpost $*
>>  	$(Q)echo 'cmd_$@ := $(cmd_vmlinux-modpost)' > $(dot-target).cmd
>>  endef
>>  
>> diff --git a/scripts/Makefile.modpost b/scripts/Makefile.modpost
>> index 56dfafc..ca0db29 100644
>> --- a/scripts/Makefile.modpost
>> +++ b/scripts/Makefile.modpost
>> @@ -93,7 +93,7 @@ __modpost: $(modules:.ko=.o) FORCE
>>  quiet_cmd_kernel-mod = MODPOST $@
>>        cmd_kernel-mod = $(modpost) $@
>>  
>> -vmlinux.o: FORCE
>> +vmlinux vmlinux.o: FORCE
>>  	$(call cmd,kernel-mod)
>>  
>>  # Declare generated files as targets for modpost
> 
> .
> 


