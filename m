Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:59368 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751950Ab1CJJRT (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 10 Mar 2011 04:17:19 -0500
Message-ID: <4D78971C.6090107@suse.cz>
Date: Thu, 10 Mar 2011 10:17:16 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH -v5] kbuild: Add extra gcc checks
References: <20110301083529.GA767@liondog.tnic> <20110309144504.GA1096@sepie.suse.cz> <20110309151134.GA15730@elte.hu> <20110309175625.GA29181@merkur.ravnborg.org> <20110310090444.GA25522@elte.hu>
In-Reply-To: <20110310090444.GA25522@elte.hu>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Ingo Molnar <mingo@elte.hu>
Cc: Sam Ravnborg <sam@ravnborg.org>, Borislav Petkov <bp@alien8.de>, Arnd Bergmann <arnd@arndb.de>, torvalds@linux-foundation.org, x86@kernel.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, bp@amd64.org

On 10.3.2011 10:04, Ingo Molnar wrote:
> 
> * Sam Ravnborg <sam@ravnborg.org> wrote:
> 
>>> Another, related, very nice kbuild feature would be to allow for arch maintainers to 
>>> mark certain files as "should only build fine without warnings" - i.e. -Werror 
>>> should be the default. There would be a Kconfig feature to opt out of this, 
>>> CONFIG_CC_IGNORE_WARNINGS=y or so. This would allow for people to still build the 
>>> kernel with old (or buggy) versions of GCC.
>>
>> To add -Werror for all files conditionally you can do:
>>
>>     ccflags-$(CONFIG_WERROR) += -Werror
>>
>> For individual files we can then drop -Werror like this:
>>
>>     CFLAGS_REMOVE_foobar.o := -Werror
>>
>> So it should be doable with the existing infrastructure.
> 
> Stupid question: is there an existing kbuild rule that i could use to enable -Werror 
> for a single .o file, such as kernel/sched.o - without affecting other files in 
> kernel/ that i do not maintain?

CFLAGS_sched.o := -Werror


> Also, adding 3 lines per object file is pretty ugly - would it be possible to create 
> a nicer, compact, single-line way to someone condense a CONFIG_ERROR opt-out 
> mechanism, the -Werror default and the single-object-file into a single rule?
> 
> Something like:
> 
>   obj-werror-y += sched.o
> 
> Although i'm not sure if it is wise to mix build details into the object build tree 
> hierarchy like that ...

One way without extending the current rules could be:

ifdef CONFIG_CC_WERROR
Werror := -Werror
endif

CFLAGS_sched.o := $(Werror)
CFLAGS_another.o := $(Werror)

What do you think?
