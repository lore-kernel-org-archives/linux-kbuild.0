Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.123]:51583 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1755900Ab0JRVD5 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 18 Oct 2010 17:03:57 -0400
Subject: Re: [RFC] better fix? (was: Re: [PATCH][GIT PULL] ftrace: Remove
 recursion between recordmcount and scripts/mod/empty)
From: Steven Rostedt <rostedt@goodmis.org>
In-Reply-To: <20101018193556.GA10147@merkur.ravnborg.org>
References: <1287427989.16971.304.camel@gandalf.stny.rr.com>
	 <1287429206.16971.325.camel@gandalf.stny.rr.com>
	 <20101018193556.GA10147@merkur.ravnborg.org>
Content-Type: text/plain; charset="ISO-8859-15"
Date: Mon, 18 Oct 2010 17:03:55 -0400
Message-ID: <1287435835.16971.330.camel@gandalf.stny.rr.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Sam Ravnborg <sam@ravnborg.org>
Cc: LKML <linux-kernel@vger.kernel.org>, Ingo Molnar <mingo@elte.hu>, Frederic Weisbecker <fweisbec@gmail.com>, Andrew Morton <akpm@linux-foundation.org>, Michal Marek <mmarek@suse.cz>, linux-kbuild@vger.kernel.org

On Mon, 2010-10-18 at 21:35 +0200, Sam Ravnborg wrote:

> An additional comment about the origin of empty.o is needed.
> Only very few people knows that we generate empty.o in scripts/

OK, how are you with this comment?

# Due to recursion, we must skip the empty.o file.
# The empty.o file is created in the make process in order
#  to determine the target endianness and word size.
#  It is made before all other C files, including recordmcount.

-- Steve


