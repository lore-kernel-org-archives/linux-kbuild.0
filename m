Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0214.hostedemail.com ([216.40.44.214]:40875 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751604Ab3ITBHN (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Sep 2013 21:07:13 -0400
Message-ID: <1379639226.5862.9.camel@joe-AO722>
Subject: Re: [PATCH 5/5] lib: Add error string support to printks
From: Joe Perches <joe@perches.com>
Date: Thu, 19 Sep 2013 18:07:06 -0700
In-Reply-To: <523A5316.50405@att.net>
References: <1379482610.1787.7.camel@joe-AO722>
	 <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
	 <1379459317-13046-6-git-send-email-daniel.santos@pobox.com>
	 <22238.1379502295@warthog.procyon.org.uk> <523A5316.50405@att.net>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Santos <daniel.santos@pobox.com>
Cc: David Howells <dhowells@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

On Wed, 2013-09-18 at 20:27 -0500, Daniel Santos wrote:
> if I use ERR_PTR() on a signed int on a x86_64 where pointer 
> is 64 bits and int is 32, wouldn't that mean a signed conversion 
> instruction where the sign bit has to be moved from bit 31 to 63?

No.  It's cast to long

static inline void * __must_check ERR_PTR(long error)
{
	return (void *) error;
}

> Either way, %pE does seem to make a lot of sense for conditions where we 
> already have a pointer that we would otherwise use PTR_ERR() to convert, 
> but it just seems klunky to use it on an int, to have it treated like a 
> pointer and then re-interpreted as an int.  Maybe we can add %pE as well 
> as %dE and leave [ioxXu] out of it?

I think having just one way to format is better.


