Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:30275 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757395Ab3D3BBS (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 21:01:18 -0400
Message-ID: <1367283676.30667.44.camel@gandalf.local.home>
Subject: Re: [PATCH 0/2] [GIT PULL] localmodconfig: Fix missing depends of
 config files included in if statements
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 21:01:16 -0400
In-Reply-To: <1367280494.30667.38.camel@gandalf.local.home>
References: <20130429195100.202681236@goodmis.org>
	 <CA+55aFzEwRUWVQ8x1+f=6R_9+JO_Rmg=u2E1k_6jLuQEAorgtQ@mail.gmail.com>
	 <CA+55aFzSfRv26E3UF1a8jwQK+vHSru-YTg8ADefZxOKZNnn6fA@mail.gmail.com>
	 <1367280494.30667.38.camel@gandalf.local.home>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 20:08 -0400, Steven Rostedt wrote:

> I'll also run my full ftrace test suite on your latest kernel, and see
> if it finds anything else.
> 

With the fix I sent, everything passed.

Thanks,

-- Steve


