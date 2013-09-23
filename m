Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm7-vm1.access.bullet.mail.bf1.yahoo.com ([216.109.114.160]:33998
	"EHLO nm7-vm1.access.bullet.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751650Ab3IWTji (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Sep 2013 15:39:38 -0400
Message-ID: <52409917.2080506@att.net>
Date: Mon, 23 Sep 2013 14:40:07 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] lib: Add error string support to printks
References: <1379482610.1787.7.camel@joe-AO722>  <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>  <1379459317-13046-6-git-send-email-daniel.santos@pobox.com>  <22238.1379502295@warthog.procyon.org.uk> <523A5316.50405@att.net>  <1379639226.5862.9.camel@joe-AO722> <523BDB55.2000008@att.net> <1379677551.2021.25.camel@joe-AO722>
In-Reply-To: <1379677551.2021.25.camel@joe-AO722>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Joe Perches <joe@perches.com>
Cc: Daniel Santos <daniel.santos@pobox.com>, David Howells <dhowells@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

On 09/20/2013 06:45 AM, Joe Perches wrote:
> On Fri, 2013-09-20 at 00:21 -0500, Daniel Santos wrote:
>
> [nice example about bloat]
>
>> Yeah, I do agree, I just don't see how to do it without introducing
>> unnecessary bloat.
> I think the code size cost of %pE is pretty trivial
> compared to the log size/runtime cost.

I suppose that would depend upon the conditions.  If no printks with 
error codes/names/messages are triggered, then the cost on the syslog is 
zero. Either way, we're already looking at adding one byte to the format 
string for the extra 'E' character and the 3-4 bytes for sign extend 
instruction would not exist on arm and most other archs.  I guess I'm 
usually trying to consider the memory constrained system where you 
wouldn't enable this feature but still suffer the sign extend bloat -- 
then again, I don't know of many embedded x86_64 systems. :)

> I would not want to see it used generically.

Hmm, I had considered this as a new mechanism to emit error codes to the 
ring buffer.  What sort of guidelines do you think are reasonable for 
when to use this proposed extension and when not to? Maybe on printks 
for error conditions that are most likely?

Daniel
