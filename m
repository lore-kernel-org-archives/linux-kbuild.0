Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nat28.tlf.novell.com ([130.57.49.28]:59046 "EHLO
	nat28.tlf.novell.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754898Ab2AELIr convert rfc822-to-8bit (ORCPT
	<rfc822;groupwise-linux-kbuild@vger.kernel.org:3:1>);
	Thu, 5 Jan 2012 06:08:47 -0500
Message-Id: <4F059304020000780006A906@nat28.tlf.novell.com>
Date: Thu, 05 Jan 2012 11:09:40 +0000
From: "Jan Beulich" <JBeulich@suse.com>
Subject: Re: [PATCH] consolidate WARN_...ONCE() static variables
References: <4EF3609D0200007800069A30@nat28.tlf.novell.com>
 <20120104150305.8b2ab00c.akpm@linux-foundation.org>
In-Reply-To: <20120104150305.8b2ab00c.akpm@linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8BIT
Content-Disposition: inline
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

>>> On 05.01.12 at 00:03, Andrew Morton <akpm@linux-foundation.org> wrote:
> On Thu, 22 Dec 2011 15:53:49 +0000
> "Jan Beulich" <JBeulich@suse.com> wrote:
> 
>> Due to the alignment of following variables, these typically consume
>> more than just the single byte that 'bool' requires, and as there are
>> a few hundred instances, the cache pollution (not so much the waste of
>> memory) sums op. Put these variables into their own section, outside
>> of half way frequently used memory range.
>> 
>> Signed-off-by: Jan Beulich <jbeulich@suse.com>
>> 
>> ---
>>  include/asm-generic/bug.h         |    6 +++---
>>  include/asm-generic/vmlinux.lds.h |    1 +
>>  2 files changed, 4 insertions(+), 3 deletions(-)
>> 
>> --- 3.2-rc6/include/asm-generic/bug.h
>> +++ 3.2-rc6-warn-once-flag-cold/include/asm-generic/bug.h
>> @@ -134,7 +134,7 @@ extern void warn_slowpath_null(const cha
>>  #endif
>>  
>>  #define WARN_ON_ONCE(condition)	({				\
>> -	static bool __warned;					\
>> +	static bool __section(.data.unlikely) __warned;		\
>>  	int __ret_warn_once = !!(condition);			\
>>  								\
>>  	if (unlikely(__ret_warn_once))				\
>> @@ -144,7 +144,7 @@ extern void warn_slowpath_null(const cha
>>  })
>>  
>>  #define WARN_ONCE(condition, format...)	({			\
>> -	static bool __warned;					\
>> +	static bool __section(.data.unlikely) __warned;		\
>>  	int __ret_warn_once = !!(condition);			\
>>  								\
>>  	if (unlikely(__ret_warn_once))				\
>> @@ -154,7 +154,7 @@ extern void warn_slowpath_null(const cha
>>  })
>>  
>>  #define WARN_TAINT_ONCE(condition, taint, format...)	({	\
>> -	static bool __warned;					\
>> +	static bool __section(.data.unlikely) __warned;		\
>>  	int __ret_warn_once = !!(condition);			\
>>  								\
>>  	if (unlikely(__ret_warn_once))				\
>> --- 3.2-rc6/include/asm-generic/vmlinux.lds.h
>> +++ 3.2-rc6-warn-once-flag-cold/include/asm-generic/vmlinux.lds.h
>> @@ -167,6 +167,7 @@
>>  	CPU_KEEP(exit.data)						\
>>  	MEM_KEEP(init.data)						\
>>  	MEM_KEEP(exit.data)						\
>> +	*(.data.unlikely)						\
>>  	STRUCT_ALIGN();							\
>>  	*(__tracepoints)						\
>>  	/* implement dynamic printk debug */				\
> 
> The patch seems reasonable.
> 
> printk_once() should also be converted.  And ata_print_version_once(),
> if it insists on continuing to exist.

I disagree for those (and intentionally didn't touch printk_once();
wasn't aware of the other) - at best this could get marked
__read_mostly, but that's not the subject of this patch.

> Also rcu_lockdep_assert().

This one I mostly agree - the access is at least sitting past the
debug_lockdep_rcu_enabled() check, albeit not in an unlikely()
code path.

> My MUA (sylpheed) is unable to generate a plain-text version of the
> patch for me, so much hand-editing will be needed.  It would be nice
> if the patch could be demangled at the sending end, please.

Even the quoted text in your response appears to be intact, so it's
not clear to me what the problem is. I'll try to remember to also
attach the patch when I re-submit.

> I agree that linux-kernel should have been cc'ed on a change of this
> nature.

Will do.

Jan

