Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:63208 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754564Ab1GNNJj (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 14 Jul 2011 09:09:39 -0400
Subject: Re: [RFC 0/4] streamline_config clean-ups
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <CACqU3MX4=AQyH4TXi+LaHV6WWRsLZpGf7c=iwQHm6Mqsr6SgYA@mail.gmail.com>
References: <1309563076-5050-1-git-send-email-lacombar@gmail.com>
	 <CACqU3MUrCODMx=8Bu+YDxy2BJwjm-77PXFob5OwHn=fr5mTdkg@mail.gmail.com>
	 <1310170759.2780.37.camel@fedora>
	 <1310604899.27864.4.camel@gandalf.stny.rr.com>
	 <CACqU3MX4=AQyH4TXi+LaHV6WWRsLZpGf7c=iwQHm6Mqsr6SgYA@mail.gmail.com>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Thu, 14 Jul 2011 09:09:37 -0400
Message-ID: <1310648977.27864.22.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Steven Rostedt <srostedt@redhat.com>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>

On Wed, 2011-07-13 at 22:41 -0400, Arnaud Lacombe wrote:

> yes... it could not have. I missed a $(srctree), an export, and an
> error check. Attached patch should fix it, behavior (see below) with
> this patch is consistent between v3.0-rc6 and the tip of the patched
> branch.

That seems to work. Could you resend a fixed patchset?

> 
> Btw, as of v3.0-rc6, localmodconfig does not produce a valid .config.
> Local kernel is a Fedora 14 kernel, based on
> config-2.6.35.13-91.fc14.x86_64. The perl script complete fine, but
> the config is then restarted, I'm not sure if it is the intended
> behavior.

Hmm, not sure exactly what you mean. The script should run
(silent)oldconfig after it does the localmodconfig to fill in the stuff
that it caused to change. Did you notice something that broke?

-- Steve


