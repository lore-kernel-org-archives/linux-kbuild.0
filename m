Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.125]:40289 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753003Ab1DZTIE (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 26 Apr 2011 15:08:04 -0400
Subject: Re: [RFC][PATCH 07/11] kbuild/recordmcount: Add RECORDMCOUNT_WARN
 to warn about mcount callers
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <4DB09629.7080008@suse.cz>
References: <20110421022825.535486725@goodmis.org>
	 <20110421023738.714956282@goodmis.org>  <4DB09629.7080008@suse.cz>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 26 Apr 2011 15:08:02 -0400
Message-ID: <1303844882.18763.29.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, linux-kbuild@vger.kernel.org

On Thu, 2011-04-21 at 22:40 +0200, Michal Marek wrote:
> On 21.4.2011 04:28, Steven Rostedt wrote:
> > +ifeq ("$(origin RECORDMCOUNT_WARN)", "command line")
> > +  RECORDMCOUNT_FLAGS = -w
> > +endif
> 
> RECORDMCOUNT_WARN is IMO unlikely to be used with some other meaning in
> the environment, so I think you can drop the origin check. Nevertheless

You haven't seen my environment variables ;)

> 
> Acked-by: Michal Marek <mmarek@suse.cz>

 Thanks!

-- Steve


