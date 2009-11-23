Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ey-out-2122.google.com ([74.125.78.25]:47832 "EHLO
	ey-out-2122.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752872AbZKWWoZ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Nov 2009 17:44:25 -0500
Message-ID: <4B0B104E.1030806@tuffmail.co.uk>
Date: Mon, 23 Nov 2009 22:44:30 +0000
From: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Subject: Re: [PATCH 05/10] kbuild: sort the list of symbols exported by the
 kernel (__ksymtab)
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> <20091104171916.GA6323@merkur.ravnborg.org> <4AF2E00A.3010107@tuffmail.co.uk> <200911091347.57286.rusty@rustcorp.com.au> <12c511ca0911201420i5f2d4751m25ae5288b69dbabb@mail.gmail.com> <4B072E31.4000906@tuffmail.co.uk> <20091123195320.GD26810@ldl.fc.hp.com>
In-Reply-To: <20091123195320.GD26810@ldl.fc.hp.com>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alex Chiang <achiang@hp.com>
Cc: Tony Luck <tony.luck@gmail.com>, Rusty Russell <rusty@rustcorp.com.au>, Sam Ravnborg <sam@ravnborg.org>, Mike Frysinger <vapier.adi@gmail.com>, greg@kroah.com, linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, kyle@mcmartin.ca, deller@gmx.de, jejb@parisc-linux.org, Benjamin Herrenschmidt <benh@kernel.crashing.org>, paulus@samba.org

Alex Chiang wrote:
> Hi Alan, Rusty,
>
> * Alan Jenkins <alan-jenkins@tuffmail.co.uk>:
>   
>> Tony Luck wrote:
>>     
>>> The sorted ksymtab breaks ia64 (and possibly ppc64 and
>>> parisc too).
>>>       
>
> [snip]
>
>   
>>> The syntax you need for this* is:
>>>
>>>         .long @fptr(____pagevec_lru_add)
>>>         .long __kstrtab____pagevec_lru_add
>>>
>>> Note that you must only use the @fptr(name) syntax for
>>> function exports. Exported data items just need an address.
>>>
>>> -Tony
>>>
>>> * On ia64 ... powerpc and parisc might need something else.
>>>   
>>>       
>> Thanks!  It doesn't sound too hard to retro-fit your suggestion.
>>
>> Still, I can't help wondering if I've done this all wrong :-/.  Perhaps  
>> I should avoid the assembler.  Instead, I could write a tool to sort the  
>> ksymtab elf sections in-place (and mangle their relocations  
>> accordingly).  That should preserve any special handling for function  
>> symbols without arch-specific special cases.  It would also concentrate  
>> all the magic in one tool - rather than it being scattered between the  
>> modpost tool, mod_export.h, tmp_exports.S, and vmlinux.lds.h.
>>     
>
> In the meantime, while Alan is deciding the proper way to fix
> this, would it be possible to drop the offending patch series
> from linux-next?
>
> It makes ia64 unbootable, and has ripple-through effects, since
> mmotm is based on linux-next these days.
>
> Thanks,
> /ac
>   

Sorry, I put this off until the last minute of today.  I settled on just 
adding @fptr as suggested.  I reviewed the other arches, and I think 
only IA64 needs anything special here.

Alan


