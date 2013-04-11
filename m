Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35944 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752491Ab3DKTUX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 11 Apr 2013 15:20:23 -0400
Message-ID: <51670CF4.9050700@suse.cz>
Date: Thu, 11 Apr 2013 21:20:20 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH 3/3] convert headers_install.pl to headers_install.sh
References: <1365697510.18069.78@driftwood>
In-Reply-To: <1365697510.18069.78@driftwood>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Rob Landley <rob@landley.net>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>, Josh Boyer <jwboyer@redhat.com>, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowell@redhat.com>, Sam Ravnborg <sam@ravnborg.org>

Dne 11.4.2013 18:25, Rob Landley napsal(a):
> On 04/09/2013 05:52:32 AM, Michal Marek wrote:
>> I forgot to do it right after rc1, but I took the patch from the mm tree
>> now. I also added Sam's Ack from the earlier submission.
> 
> Yay!
> 
> Is this for 3.10?

Yes. The kbuild, kconfig, misc and trivial branches of kbuild.git
contain changes for the next merge window (next -rc1). The rc-fixes
branch is for the current rc phase.

Michal

