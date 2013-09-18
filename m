Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm24-vm2.access.bullet.mail.bf1.yahoo.com ([216.109.115.177]:32475
	"EHLO nm24-vm2.access.bullet.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751661Ab3IRWwn (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Sep 2013 18:52:43 -0400
Message-ID: <523A2D99.3040503@att.net>
Date: Wed, 18 Sep 2013 17:47:53 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 0/5] Preliminary: Add error names & descrptions to printks
References: <1379459317-13046-1-git-send-email-daniel.santos@pobox.com> <22288.1379502518@warthog.procyon.org.uk>
In-Reply-To: <22288.1379502518@warthog.procyon.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>


On 09/18/2013 06:08 AM, David Howells wrote:
> danielfsantos@att.net wrote:
>
>> Typically, we don't care about error messages or names in the kernel because
>> userspace will manage that.  But sometimes we need to output an error number
>> to printks and that creates a situation where a user, system admistrator or
>> developer must find an error number reference to figure out what went wrong
>> with a particular driver or whatever.  This patch adds two alternatives at
>> increasing memory costs:
>>
>> 1. print the number in addition to the name for 2k extra or
>> 2. print the number, name and description for 6k extra.
> I like the idea generally - and have occasionally entertained the idea of
> implementing it myself.  However, I wouldn't bother with the "human readable"
> description if we're going to do this.  Generally, the symbolic representation
> is good enough - and that's what you're going to grep the code for anyway.
>
> David

Yeah, I thought about that too, but I figured that descriptions were 
already there so I may as well make it an option for the 
search-engine-impared. :)  I was also thinking about system 
administrators and ordinary users trying to installing device drivers 
and other such situations where they would have to look at their syslogs 
or dmesg -- or just the lazy. :)

Daniel
