Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm7-vm1.access.bullet.mail.bf1.yahoo.com ([216.109.114.160]:30232
	"EHLO nm7-vm1.access.bullet.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1752378Ab3IWURB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Sep 2013 16:17:01 -0400
Message-ID: <5240A1DB.6020906@att.net>
Date: Mon, 23 Sep 2013 15:17:31 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 5/5] lib: Add error string support to printks
References: <1379677551.2021.25.camel@joe-AO722> <1379482610.1787.7.camel@joe-AO722> <1379459317-13046-1-git-send-email-daniel.santos@pobox.com> <1379459317-13046-6-git-send-email-daniel.santos@pobox.com> <22238.1379502295@warthog.procyon.org.uk> <523A5316.50405@att.net> <1379639226.5862.9.camel@joe-AO722> <523BDB55.2000008@att.net> <23301.1379682458@warthog.procyon.org.uk>
In-Reply-To: <23301.1379682458@warthog.procyon.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Joe Perches <joe@perches.com>, Daniel Santos <daniel.santos@pobox.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

On 09/20/2013 08:07 AM, David Howells wrote:
> I suspect he doesn't really need to implement a "strerror()" function but
> should rather build it straight into printk()/vsprintf().
>
> David

Indeed we don't necessarily *need* a strerror() function per-se, but it 
is an addition to the libc support in the kernel.  I'll leave it up to 
the community to decide rather or not it should be separate or 
integrated into vsprintf.c.  Also, there is no POSIX or GNU libc 
extension (that I am aware of) to print an error name -- a real shame 
imho, so the name strerror_name() is pretty much artificial. Is there a 
significant overhead in having these functions exported?

Personally, I would think that the only reason to have interest in an 
error name or message in the kernel is to output via printk, but I like 
to allow room for the conditions that I may not have thought of.

Daniel
