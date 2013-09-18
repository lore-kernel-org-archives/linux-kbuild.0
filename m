Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm4-vm8.access.bullet.mail.gq1.yahoo.com ([216.39.63.212]:32753
	"EHLO nm4-vm8.access.bullet.mail.gq1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1751511Ab3IRW0h (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 18 Sep 2013 18:26:37 -0400
Message-ID: <523A28B7.10703@att.net>
Date: Wed, 18 Sep 2013 17:27:03 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] scripts: Add mkstrerror.sh
References: <29168.1379504300@warthog.procyon.org.uk> <1379459317-13046-2-git-send-email-daniel.santos@pobox.com> <1379459317-13046-1-git-send-email-daniel.santos@pobox.com> <1352.1379505310@warthog.procyon.org.uk>
In-Reply-To: <1352.1379505310@warthog.procyon.org.uk>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: David Howells <dhowells@redhat.com>
Cc: Daniel Santos <daniel.santos@pobox.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>


On 09/18/2013 06:55 AM, David Howells wrote:
> David Howells <dhowells@redhat.com> wrote:
>
>>   (1) Why are you double-NUL'ing all your strings?  (see the \0 in the strings)
> Ah...  I see what you're doing.  I missed the fact that you don't have a comma
> after each string.

Yeah, I was trying to format the code so that it's efficient and still 
easy to read, but then there's no comma where we normally expect one.  
It's the best middle ground solution I could come up with.

