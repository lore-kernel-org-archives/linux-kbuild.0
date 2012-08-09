Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from viridian.itc.Virginia.EDU ([128.143.12.139]:47225 "EHLO
	viridian.itc.Virginia.EDU" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754052Ab2HIOQ4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 9 Aug 2012 10:16:56 -0400
Subject: Re: [PATCH 1/4] localmodconfig: set default value for ksource in
Date: Thu, 09 Aug 2012 10:16:55 -0400
In-Reply-To: <1344521260.6935.40.camel@gandalf.stny.rr.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Message-Id: <20120809141655.A87B06077A@viridian.itc.Virginia.EDU>
From: wfp5p@viridian.itc.Virginia.EDU (Bill Pemberton)
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kbuild@vger.kernel.org

Steven Rostedt writes:
> 
> I have nothing against this change, but I'm confused by how it fixes the
> above issue about reading config.old.
> 
> Without the patch, passing in both '.' and 'config.old' as parameters,
> wouldn't that still set $ksource to '.' and $kconfig to config.old?
> 
> Perhaps, it failed for you without passing the '.', which would set
> $ksource to config.old. Maybe the real change should be to count the
> number of parameters to determine what $kconfig and $ksource get set to?
> 

You're right, I remembered the warning and the bug I encountered, but
forgot that this patch only addresses the warning.

The problem is that if you do  streamline_config.pl . config.old, it
doesn't read config.old at all -- it still reads .config.

-- 
Bill


