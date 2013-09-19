Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nm4-vm3.access.bullet.mail.bf1.yahoo.com ([216.109.114.114]:39686
	"EHLO nm4-vm3.access.bullet.mail.bf1.yahoo.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1753852Ab3ISWxR (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 19 Sep 2013 18:53:17 -0400
Message-ID: <523B8078.1070401@att.net>
Date: Thu, 19 Sep 2013 17:53:44 -0500
From: Daniel Santos <danielfsantos@att.net>
Reply-To: Daniel Santos <daniel.santos@pobox.com>
MIME-Version: 1.0
Subject: Re: [PATCH 1/5] scripts: Add mkstrerror.sh
References: <1379459317-13046-2-git-send-email-daniel.santos@pobox.com> <1379459317-13046-1-git-send-email-daniel.santos@pobox.com> <29168.1379504300@warthog.procyon.org.uk> <523B7C38.8050609@att.net>
In-Reply-To: <523B7C38.8050609@att.net>
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Santos <daniel.santos@pobox.com>
Cc: David Howells <dhowells@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>


On 09/19/2013 05:35 PM, Daniel Santos wrote:
>
> Hmm, I cannot reproduce the error. :( I'm using next-20130919 
> currently (x86_64), and if I try to just "make O=lib" it fails w/o my 
> patches.  The only file that should depend upon error_strings.h is 
> lib/string.c.

Ahh! I've never seen the "make O=foo" before and just presumed it was an 
alternate directive to specify a directory of the source tree to build.  
I'm certainly glad to learn that the kernel supports out of tree builds! :)

So I am getting the error now and this is because the script expects to 
run in the root of the source tree. This will be an easy fix and I think 
I've figured out the correct place to put the make target for it as well.

Daniel
