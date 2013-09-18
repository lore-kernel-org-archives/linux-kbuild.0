Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:41658 "EHLO mx1.redhat.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751556Ab3IRL5G (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Sep 2013 07:57:06 -0400
From: David Howells <dhowells@redhat.com>
In-Reply-To: <29168.1379504300@warthog.procyon.org.uk>
References: <29168.1379504300@warthog.procyon.org.uk> <1379459317-13046-2-git-send-email-daniel.santos@pobox.com> <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
Subject: Re: [PATCH 1/5] scripts: Add mkstrerror.sh
Date: Wed, 18 Sep 2013 12:55:10 +0100
Message-ID: <1352.1379505310@warthog.procyon.org.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
Cc: dhowells@redhat.com, Daniel Santos <daniel.santos@pobox.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

David Howells <dhowells@redhat.com> wrote:

>  (1) Why are you double-NUL'ing all your strings?  (see the \0 in the strings)

Ah...  I see what you're doing.  I missed the fact that you don't have a comma
after each string.

>  (3) You are storing a pointer to the symbolic name for each error.  On a
>      64-bit machine, that's 8 bytes.  If you drop the leading 'E' and the
>      trailing NUL, most symbols will fit into an 8 character slot saving you
>      the cost of a pointer.
>      ...

In which case, you can ignore this too.

David
