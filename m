Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:51570 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751408AbbBPX4R (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 Feb 2015 18:56:17 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH v11 19/19] kasan: enable instrumentation of global variables
In-Reply-To: <54E20238.3090902@samsung.com>
References: <1404905415-9046-1-git-send-email-a.ryabinin@samsung.com> <1422985392-28652-1-git-send-email-a.ryabinin@samsung.com> <1422985392-28652-20-git-send-email-a.ryabinin@samsung.com> <87a90ea7ge.fsf@rustcorp.com.au> <54E20238.3090902@samsung.com>
Date: Tue, 17 Feb 2015 10:25:08 +1030
Message-ID: <877fvhtns3.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andrey Ryabinin <a.ryabinin@samsung.com>, linux-kernel@vger.kernel.org
Cc: Dmitry Vyukov <dvyukov@google.com>, Konstantin Serebryany <kcc@google.com>, Dmitry Chernenkov <dmitryc@google.com>, Andrey Konovalov <adech.fo@gmail.com>, Yuri Gribov <tetra2005@gmail.com>, Konstantin Khlebnikov <koct9i@gmail.com>, Sasha Levin <sasha.levin@oracle.com>, Christoph Lameter <cl@linux.com>, Joonsoo Kim <iamjoonsoo.kim@lge.com>, Andrew Morton <akpm@linux-foundation.org>, Dave Hansen <dave.hansen@intel.com>, Andi Kleen <andi@firstfloor.org>, x86@kernel.org, linux-mm@kvack.org, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@suse.cz>, "open list:KERNEL BUILD + fi..." <linux-kbuild@vger.kernel.org>

Andrey Ryabinin <a.ryabinin@samsung.com> writes:
> On 02/16/2015 05:58 AM, Rusty Russell wrote:
>> Andrey Ryabinin <a.ryabinin@samsung.com> writes:
>>> This feature let us to detect accesses out of bounds of
>>> global variables. This will work as for globals in kernel
>>> image, so for globals in modules. Currently this won't work
>>> for symbols in user-specified sections (e.g. __init, __read_mostly, ...)
>>> @@ -1807,6 +1808,7 @@ static void unset_module_init_ro_nx(struct module *mod) { }
>>>  void __weak module_memfree(void *module_region)
>>>  {
>>>  	vfree(module_region);
>>> +	kasan_module_free(module_region);
>>>  }
>> 
>> This looks racy (memory reuse?).  Perhaps try other order?
>> 
>
> You are right, it's racy. Concurrent kasan_module_alloc() could fail because
> kasan_module_free() wasn't called/finished yet, so whole module_alloc() will fail
> and module loading will fail.
> However, I just find out that this race is not the worst problem here.
> When vfree(addr) called in interrupt context, memory at addr will be reused for
> storing 'struct llist_node':
>
> void vfree(const void *addr)
> {
> ...
> 	if (unlikely(in_interrupt())) {
> 		struct vfree_deferred *p = this_cpu_ptr(&vfree_deferred);
> 		if (llist_add((struct llist_node *)addr, &p->list))
> 			schedule_work(&p->wq);
>
>
> In this case we have to free shadow *after* freeing 'module_region', because 'module_region'
> is still used in llist_add() and in free_work() latter.
> free_work() (in mm/vmalloc.c) processes list in LIFO order, so to free shadow after freeing
> 'module_region' kasan_module_free(module_region); should be called before vfree(module_region);
>
> It will be racy still, but this is not so bad as potential crash that we have now.
> Honestly, I have no idea how to fix this race nicely. Any suggestions?

I think you need to take over the rcu callback for the kasan case.

Perhaps we rename that __module_memfree(), and do:

void module_memfree(void *p)
{
#ifdef CONFIG_KASAN
        ...
#endif
        __module_memfree(p);        
}

Note: there are calls to module_memfree from other code (BPF and
kprobes).  I assume you looked at those too...

Cheers,
Rusty.
