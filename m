Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from e9.ny.us.ibm.com ([32.97.182.139]:59643 "EHLO e9.ny.us.ibm.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753348Ab1KQWzB (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 17 Nov 2011 17:55:01 -0500
Received: from /spool/local
	by e9.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
	for <linux-kbuild@vger.kernel.org> from <johnstul@us.ibm.com>;
	Thu, 17 Nov 2011 17:55:00 -0500
Received: from d01av03.pok.ibm.com (d01av03.pok.ibm.com [9.56.224.217])
	by d01relay05.pok.ibm.com (8.13.8/8.13.8/NCO v10.0) with ESMTP id pAHMsvJZ254406
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Nov 2011 17:54:57 -0500
Received: from d01av03.pok.ibm.com (loopback [127.0.0.1])
	by d01av03.pok.ibm.com (8.14.4/8.13.1/NCO v10.0 AVout) with ESMTP id pAHMssVt020617
	for <linux-kbuild@vger.kernel.org>; Thu, 17 Nov 2011 20:54:57 -0200
Message-ID: <1321570492.25715.45.camel@work-vm>
Subject: Re: [PATCH] kconfig: Add merge_config.sh script
From: john stultz <johnstul@us.ibm.com>
Date: Thu, 17 Nov 2011 14:54:52 -0800
In-Reply-To: <CACqU3MXg8L7O0UT1ow3pVyM+NJTjjyABW2D6LLFWYSDWy6XEiw@mail.gmail.com>
References: <1321567131.25715.32.camel@work-vm>
	 <CACqU3MXg8L7O0UT1ow3pVyM+NJTjjyABW2D6LLFWYSDWy6XEiw@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
Mime-Version: 1.0
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, Sam Ravnborg <sam@ravnborg.org>, gthelen@google.com, tartler@cs.fau.de, Dmitry Fink <Dmitry.Fink@palm.com>, Darren Hart <dvhart@linux.intel.com>, Eric B Munson <ebmunson@us.ibm.com>, Bruce Ashfield <Bruce.Ashfield@windriver.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Thu, 2011-11-17 at 17:44 -0500, Arnaud Lacombe wrote:
> Hi,
> 
> On Thu, Nov 17, 2011 at 4:58 PM, john stultz <johnstul@us.ibm.com> wrote:
> > Hey Andrew,
> >        I've tried sending this via Michal a few times, but haven't heard much
> > back. So I wanted to check if you would consider merging it via your
> > tree, or if you had any suggestions of who would be better to
> > review/merge this.
> >
> One of the worry I would have is that the script is merging config
> blindly, ie. there is no dependency checking done. I have some some
> work-in-progress to help resolving this, but still lots of thought to
> be implemented.

So the script actually does warn you if a specified option is dropped
due to missing dependencies or if the option is removed.  So, I guess
could you clarify your concern a bit more?

thanks
-john

