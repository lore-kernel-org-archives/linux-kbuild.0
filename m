Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm9-vm9.access.bullet.mail.gq1.yahoo.com ([216.39.63.247]:37862
	"EHLO nm9-vm9.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751618Ab3IRWnJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Sep 2013 18:43:09 -0400
Message-ID: <523A2C97.6090403@att.net>
Date: Wed, 18 Sep 2013 17:43:35 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] scripts: Add mkstrerror.sh
References: <1379459317-13046-2-git-send-email-daniel.santos@pobox.com> <1379459317-13046-1-git-send-email-daniel.santos@pobox.com> <29168.1379504300@warthog.procyon.org.uk>
In-Reply-To: <29168.1379504300@warthog.procyon.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Daniel Santos <daniel.santos@pobox.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

On 09/18/2013 06:38 AM, David Howells wrote:
> danielfsantos@att.net wrote:
>
>> This is a simple bash script that parses our errno*.h files and formats
>> them into the error_strings.h header that our strerror and strerror_name
>> functions will use later.
> I presume you haven't tried building with a "make O=foo" build directory?  I
> see:
>
>        /bin/sh: /data/fs/linux-2.6-fscache/include/generated/error_strings.h: No such file or directory
>
> when I try it.

No, indeed I haven't, thanks. I'm going to need help figuring out the 
correct way to put this in the build because the current definitely 
isn't correct.  From what I could tell from digging into the build last 
night (which I've never carefully analyzed), this should be added 
somewhere in one of the scripts/Makefile*s and not in the root makefile 
(as I have done), or maybe even in lib/Makefile.

>
>   (2) Storing the leading 'E' for each symbol is redundant as you can add that
>       later so you might want to discard it.

This is a good thought, that's 150-ish bytes, but it will introduce some 
new challenges.  Currently, strerror() functions exactly like "man 3p 
strerror", except that it returns a pointer to a const string like the 
POSIX specification should have done. :)  So I directly return a pointer 
to the string within the .rodata section of the object file (same for 
strerror_name).  Omitting the 'E' would require I work up another 
solution requiring a return buffer or some such, thus increasing 
complexity and possibly loosing that savings to code.

However, if we wanted to squeze that much more out of it, then we could 
7-th bit terminate the strings and save another 150-ish bytes on null 
terminators or go even further and use some encoding scheme (maybe 32 
bits per character)?  At 2k for both the error names and the code, I 
figured it was already pretty low, but if there are some existing 
libraries in the kernel we could use to do this and not further bloat 
the text size for decompression then I wouldn't be opposed, so long as 
it makes sense.  And since we're dealing with error conditions which 
don't happen often, speed shouldn't be a concern.

Thanks!
Daniel

