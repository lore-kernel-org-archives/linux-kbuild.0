Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:8126 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1030517Ab2HIO6e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 10:58:34 -0400
Message-ID: <1344524313.6935.41.camel@gandalf.stny.rr.com>
Subject: Re: [PATCH 1/4] localmodconfig: set default value for ksource in
From: Steven Rostedt <rostedt@goodmis.org>
Date: Thu, 09 Aug 2012 10:58:33 -0400
In-Reply-To: <20120809141655.A87B06077A@viridian.itc.Virginia.EDU>
References: <20120809141655.A87B06077A@viridian.itc.Virginia.EDU>
Content-Type: text/plain; charset="ISO-8859-15"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bill Pemberton <wfp5p@viridian.itc.Virginia.EDU>
Cc: linux-kbuild@vger.kernel.org

On Thu, 2012-08-09 at 10:16 -0400, Bill Pemberton wrote:

> You're right, I remembered the warning and the bug I encountered, but
> forgot that this patch only addresses the warning.
> 
> The problem is that if you do  streamline_config.pl . config.old, it
> doesn't read config.old at all -- it still reads .config.
> 

OK, I'll take these patches as is, and fix the change log to not talk
about that issue.

You can send another patch that fixes the issue if you like.

I'll queue them up for 3.7.

-- Steve


