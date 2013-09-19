Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm4-vm2.access.bullet.mail.bf1.yahoo.com ([216.109.114.113]:48808
	"EHLO nm4-vm2.access.bullet.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751760Ab3ISBdg (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Sep 2013 21:33:36 -0400
Message-ID: <523A5316.50405@att.net>
Date: Wed, 18 Sep 2013 20:27:50 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] lib: Add error string support to printks
References: <1379482610.1787.7.camel@joe-AO722> <1379459317-13046-1-git-send-email-daniel.santos@pobox.com> <1379459317-13046-6-git-send-email-daniel.santos@pobox.com> <22238.1379502295@warthog.procyon.org.uk>
In-Reply-To: <22238.1379502295@warthog.procyon.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Joe Perches <joe@perches.com>, Daniel Santos <daniel.santos@pobox.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>


On 09/18/2013 06:04 AM, David Howells wrote:
> Joe Perches <joe@perches.com> wrote:
>
>> On Tue, 2013-09-17 at 18:08 -0500, danielfsantos@att.net wrote:
>>> This adds an extension for the integral format specifier suffix of 'e',
>>> so that the format %[duxXo]e will result in printing an number (as
>>> before) in addition to a name and descrption for an error code, if such
>>> support is enabled and a name and descrption is found.
>>>
>>> My initial thought was to use the glibc extension of '%m', but this
>>> format specifier uses the value of libc's errno and adding a value
>>> breaks gcc's printf parsing.  I'm not convinced that the 'e' extension
>>> is optimal, although there are only four instances of this pattern in
>>> the kernel that would need to be changed.
>>>
>>>      git grep -E '".*%[#0\ +\-]*[0-9]*[hljzt]*[idoxXu]e'
>>>
>>> Alternatively, 'E' was another thought for a suffix as well.
>> I'd much rather see another %p extension used instead
>> of generating odd output given normal printf formats.
>>
>> %pE might work
> I guess you'd use that with ERR_PTR().  On one hand, it would look decidedly
> odd, but on the other hand, we have errors in pointers in a lot of places
> already which wouldn't then need converting back - so it doesn't seem entirely
> unreasonable.
>
> David

Hmm, this discussion makes me pine for the gnu libc '%m' extension even 
further.  I wish there was an easy way to tell gcc that you want it to 
check your format, but here are my extensions.  Oh well.

Honestly, I'm not too keen on the %pE idea, although I can see that %p 
is where all of the kernel extensions currently are. Unless I'm 
incorrect, if I use ERR_PTR() on a signed int on a x86_64 where pointer 
is 64 bits and int is 32, wouldn't that mean a signed conversion 
instruction where the sign bit has to be moved from bit 31 to 63?

Either way, %pE does seem to make a lot of sense for conditions where we 
already have a pointer that we would otherwise use PTR_ERR() to convert, 
but it just seems klunky to use it on an int, to have it treated like a 
pointer and then re-interpreted as an int.  Maybe we can add %pE as well 
as %dE and leave [ioxXu] out of it?

Daniel
