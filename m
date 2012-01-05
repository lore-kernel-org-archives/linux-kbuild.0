Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail.linuxfoundation.org ([140.211.169.12]:42979 "EHLO
	mail.linuxfoundation.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932736Ab2AEVD0 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 5 Jan 2012 16:03:26 -0500
Date: Thu, 5 Jan 2012 13:03:24 -0800
From: Andrew Morton <akpm@linux-foundation.org>
Subject: Re: [PATCH] consolidate WARN_...ONCE() static variables
Message-Id: <20120105130324.44949af9.akpm@linux-foundation.org>
In-Reply-To: <4F059304020000780006A906@nat28.tlf.novell.com>
References: <4EF3609D0200007800069A30@nat28.tlf.novell.com>
	<20120104150305.8b2ab00c.akpm@linux-foundation.org>
	<4F059304020000780006A906@nat28.tlf.novell.com>
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Thu, 05 Jan 2012 11:09:40 +0000
"Jan Beulich" <JBeulich@suse.com> wrote:

> >>> On 05.01.12 at 00:03, Andrew Morton <akpm@linux-foundation.org> wrote:
> > On Thu, 22 Dec 2011 15:53:49 +0000
> > "Jan Beulich" <JBeulich@suse.com> wrote:
> > 
> >> Due to the alignment of following variables, these typically consume
> >> more than just the single byte that 'bool' requires, and as there are
> >> a few hundred instances, the cache pollution (not so much the waste of
> >> memory) sums op. Put these variables into their own section, outside
> >> of half way frequently used memory range.
> >> 
>
> ...
>
> > printk_once() should also be converted.  And ata_print_version_once(),
> > if it insists on continuing to exist.
> 
> I disagree for those (and intentionally didn't touch printk_once();
> wasn't aware of the other) - at best this could get marked
> __read_mostly, but that's not the subject of this patch.

Confused.  It is exactly the subject of the patch?

> > Also rcu_lockdep_assert().
> 
> This one I mostly agree - the access is at least sitting past the
> debug_lockdep_rcu_enabled() check, albeit not in an unlikely()
> code path.

What does "unlikely" have to do with any of this?

I'm suspecting that there is some changelog crappiness going on here. 
What didn't you tell us?


