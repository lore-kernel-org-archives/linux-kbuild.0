Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.124]:40674 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754697Ab1EQOVb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 17 May 2011 10:21:31 -0400
Subject: Re: [RFC][PATCH 2/2] ftrace/kbuild: Add recordmcount files to
 force full build
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <1305642010.5456.730.camel@gandalf.stny.rr.com>
References: <20110517021027.390391519@goodmis.org>
	 <20110517021423.661004726@goodmis.org>
	 <20110517133646.GP13293@sepie.suse.cz>
	 <1305640042.5456.727.camel@gandalf.stny.rr.com>
	 <1305642010.5456.730.camel@gandalf.stny.rr.com>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Tue, 17 May 2011 10:21:30 -0400
Message-ID: <1305642090.5456.732.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Tue, 2011-05-17 at 10:20 -0400, Steven Rostedt wrote:

> Awesome! This worked. I wonder what screw up I did to keep mine from
> working? 

Bah! I forgot to add the $() around the variable that I used.

/me is embarrassed.

-- Steve


