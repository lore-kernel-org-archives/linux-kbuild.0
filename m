Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0165.hostedemail.com ([216.40.44.165]:44448 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1754537Ab3ITLpz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 20 Sep 2013 07:45:55 -0400
Message-ID: <1379677551.2021.25.camel@joe-AO722>
Subject: Re: [PATCH 5/5] lib: Add error string support to printks
From: Joe Perches <joe@perches.com>
Date: Fri, 20 Sep 2013 04:45:51 -0700
In-Reply-To: <523BDB55.2000008@att.net>
References: <1379482610.1787.7.camel@joe-AO722>
	 <1379459317-13046-1-git-send-email-daniel.santos@pobox.com>
	 <1379459317-13046-6-git-send-email-daniel.santos@pobox.com>
	 <22238.1379502295@warthog.procyon.org.uk> <523A5316.50405@att.net>
	 <1379639226.5862.9.camel@joe-AO722> <523BDB55.2000008@att.net>
Content-Type: text/plain; charset="ISO-8859-1"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Daniel Santos <daniel.santos@pobox.com>
Cc: David Howells <dhowells@redhat.com>, linux-kbuild <linux-kbuild@vger.kernel.org>, LKML <linux-kernel@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Thomas Gleixner <tglx@linutronix.de>, Michael Kerrisk <mtk.manpages@gmail.com>, Dave Hansen <dave.hansen@linux.intel.com>, George Spelvin <linux@horizon.com>

On Fri, 2013-09-20 at 00:21 -0500, Daniel Santos wrote:

[nice example about bloat]

> Yeah, I do agree, I just don't see how to do it without introducing 
> unnecessary bloat.

I think the code size cost of %pE is pretty trivial
compared to the log size/runtime cost.

I would not want to see it used generically.

