Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtprelay0080.hostedemail.com ([216.40.44.80]:46736 "EHLO
	smtprelay.hostedemail.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S1751227AbbDMWDu (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 13 Apr 2015 18:03:50 -0400
Date: Mon, 13 Apr 2015 18:03:47 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] Use -mcount-record for dynamic ftrace
Message-ID: <20150413180347.6bfc0d5c@gandalf.local.home>
In-Reply-To: <20150413215508.GW15335@tassilo.jf.intel.com>
References: <1428886467-4969-1-git-send-email-andi@firstfloor.org>
	<20150413153212.131fabc1@gandalf.local.home>
	<20150413215508.GW15335@tassilo.jf.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Andi Kleen <ak@linux.intel.com>
Cc: Andi Kleen <andi@firstfloor.org>, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, mmarek@suse.cz

On Mon, 13 Apr 2015 14:55:08 -0700
Andi Kleen <ak@linux.intel.com> wrote:

> > Interesting. But I can't accept this until I can test it. I don't have
> 
> AFAIK that's a unique policy. I don't think any other maintainer operates
> this way.

Um, really? Other maintainers don't test patches that they maintain?
This isn't like hardware that I don't have. This could certainly affect
people if it breaks, and I will be responsible to fix it. I'm not going
to do that until I have a setup where I can test things that break.


> 
> > I wonder who's responsible for
> > https://www.kernel.org/pub/tools/crosstool/files/bin/x86_64/
> > 
> > If they can add a i386/x86_64 build for gcc5 I'll be happy to download
> > it and test this patch.
> 
> That doesn't make any sense.
> 

What, adding gcc5 to the crosstools suite? Why not?

-- Steve
