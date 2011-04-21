Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:49379 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751567Ab1DUCk2 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 20 Apr 2011 22:40:28 -0400
Subject: Re: [RFC][PATCH 07/11] kbuild/recordmcount: Add RECORDMCOUNT_WARN
 to warn about mcount callers
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <20110421023738.714956282@goodmis.org>
References: <20110421022825.535486725@goodmis.org>
	 <20110421023738.714956282@goodmis.org>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Wed, 20 Apr 2011 22:40:27 -0400
Message-ID: <1303353627.7181.110.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kernel@vger.kernel.org
Cc: Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Frederic Weisbecker <fweisbec@gmail.com>, "H. Peter Anvin" <hpa@zytor.com>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Wed, 2011-04-20 at 22:28 -0400, Steven Rostedt wrote:
> plain text document attachment
> (0007-kbuild-recordmcount-Add-RECORDMCOUNT_WARN-to-warn-ab.patch)
> From: Steven Rostedt <srostedt@redhat.com>
> 
> When mcount is called in a section that ftrace will not modify it into
> a nop, we want to warn about this. But not warn about this always. Now
> if the user builds the kernel with the option RECORDMCOUNT_WARN=1 then
> the build will warn about mcount callers that are ignored and will just
> waste execution time.
> 
> Cc: Michal Marek <mmarek@suse.cz>
> Cc: linux-kbuild@vger.kernel.org
> Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

Michal,

Can I get an Acked-by from you for this patch. Or comments if it doesn't
suit you?

Thanks,

-- Stvee


