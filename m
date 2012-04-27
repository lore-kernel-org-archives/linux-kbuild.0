Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mga01.intel.com ([192.55.52.88]:25894 "EHLO mga01.intel.com"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752544Ab2D0VMF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Apr 2012 17:12:05 -0400
Message-ID: <4F9B0B9B.9020909@linux.intel.com>
Date: Fri, 27 Apr 2012 14:11:55 -0700
From: "H. Peter Anvin" <hpa@linux.intel.com>
MIME-Version: 1.0
Subject: Re: RFC: How to handle function tracing, frame pointers and -mfentry?
References: <1335552399.28106.228.camel@gandalf.stny.rr.com>  <20120427202701.GA5949@merkur.ravnborg.org>  <4F9B020B.9050205@linux.intel.com> <1335560259.28106.234.camel@gandalf.stny.rr.com>
In-Reply-To: <1335560259.28106.234.camel@gandalf.stny.rr.com>
Content-Type: text/plain; charset=ISO-8859-15
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Sam Ravnborg <sam@ravnborg.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>, Michal Marek <mmarek@suse.cz>, Andrew Morton <akpm@linux-foundation.org>, Andi Kleen <andi@firstfloor.org>, Ingo Molnar <mingo@elte.hu>, Frederic Weisbecker <fweisbec@gmail.com>

On 04/27/2012 01:57 PM, Steven Rostedt wrote:
>>
>> Except it is the wrong thing.  This is not the only user of frame
>> pointer.  What I think you mean is remove the dependency in Kconfig, but
>> force the frame pointer enabled if -mfentry is not supported.
> 
> You mean option 3?
> 
> 3) Add frame pointers silently if gcc fails to build with gcc -pg.
> 

Yes, your option 3.

	-hypa

