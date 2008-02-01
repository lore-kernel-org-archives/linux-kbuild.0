Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from qb-out-0506.google.com ([72.14.204.232]:28582 "EHLO
	qb-out-0506.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1758214AbYBAKcx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 Feb 2008 05:32:53 -0500
Received: by qb-out-0506.google.com with SMTP id e11so792358qbe.15
        for <linux-kbuild@vger.kernel.org>; Fri, 01 Feb 2008 02:32:52 -0800 (PST)
Date: Fri, 1 Feb 2008 18:30:07 +0800
From: WANG Cong <xiyou.wangcong@gmail.com>
Subject: Re: [Patch] mm: fix a section mismatch warning
Message-ID: <20080201103007.GB2478@hacking>
Reply-To: WANG Cong <xiyou.wangcong@gmail.com>
References: <200801311648.43389.alessandro.guido@gmail.com> <20080131172517.GG2471@hacking> <20080131183853.GB2893@uranus.ravnborg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20080131183853.GB2893@uranus.ravnborg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: WANG Cong <xiyou.wangcong@gmail.com>, Alessandro Guido <alessandro.guido@gmail.com>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, Jan 31, 2008 at 07:38:53PM +0100, Sam Ravnborg wrote:
>Hi WANG.
>
>On Fri, Feb 01, 2008 at 01:25:17AM +0800, WANG Cong wrote:
>> 
>> This patch fix this mismatch warning from mm:
>> 
>> WARNING: vmlinux.o(.meminit.text+0x37f): Section mismatch in reference from the function free_area_init_core() to the function .init.text:setup_usemap()
>> modpost: Found 1 section mismatch(es).
>> 
>> Cc: Sam Ravnborg <sam@ravnborg.org>
>> Signed-off-by: WANG Cong <xiyou.wangcong@gmail.com>
>> 
>> ---
>> 
>> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
>> index b2838c2..8a9ae3c 100644
>> --- a/mm/page_alloc.c
>> +++ b/mm/page_alloc.c
>> @@ -3321,7 +3321,7 @@ static inline int pageblock_default_order(unsigned int order)
>>   *   - mark all memory queues empty
>>   *   - clear the memory bitmaps
>>   */
>> -static void __meminit free_area_init_core(struct pglist_data *pgdat,
>> +static void __init free_area_init_core(struct pglist_data *pgdat,
>>  		unsigned long *zones_size, unsigned long *zholes_size)
>>  {
>>  	enum zone_type j;
>> @@ -3445,7 +3445,7 @@ static void __init_refok alloc_node_mem_map(struct pglist_data *pgdat)
>>  #endif /* CONFIG_FLAT_NODE_MEM_MAP */
>>  }
>>  
>> -void __meminit free_area_init_node(int nid, struct pglist_data *pgdat,
>> +void __init free_area_init_node(int nid, struct pglist_data *pgdat,
>This change make me a bit unnerved. HAve you checked all callers?
>I simple grep shows 46 hits in the tree.

I use cscope to do the check. ;)

free_area_init_node is the only caller of free_area_init_core,
but free_area_init_node has more than one callers that didn't
mark __init/__meminit.

>
>It is always good to explain why the change you do is OK,
>for no other reasons than to show you really thought it through.

OK. Thanks.

