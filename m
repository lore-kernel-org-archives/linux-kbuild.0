Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga14.intel.com ([143.182.124.37]:32723 "EHLO mga14.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1760239Ab2D0UbJ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Apr 2012 16:31:09 -0400
Message-ID: <4F9B020B.9050205@linux.intel.com>
Date: Fri, 27 Apr 2012 13:31:07 -0700
From: "H. Peter Anvin" <hpa@linux.intel.com>
MIME-Version: 1.0
Subject: Re: RFC: How to handle function tracing, frame pointers and -mfentry?
References: <1335552399.28106.228.camel@gandalf.stny.rr.com> <20120427202701.GA5949@merkur.ravnborg.org>
In-Reply-To: <20120427202701.GA5949@merkur.ravnborg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: Steven Rostedt <rostedt@goodmis.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>, Ingo Molnar <mingo@elte.hu>, Frederic Weisbecker <fweisbec@gmail.com>

On 04/27/2012 01:27 PM, Sam Ravnborg wrote:
>>
>> My question is, how do I remove the dependency in kconfig based on the
>> compiler?
> 
> Allow the user to select one of:
> 1) function tracer
> 2) frame pointer
> 3) none of the above
> 
> This should be trivial to do in Kconfig language.
> 
> If "function tracer" is selected then use -mfentry if supported,
> with a fallback to frame pointers.
> 
> This looks simple IMO and should be easy to implement too.
> 

Except it is the wrong thing.  This is not the only user of frame
pointer.  What I think you mean is remove the dependency in Kconfig, but
force the frame pointer enabled if -mfentry is not supported.

	-hpa


