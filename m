Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx1.redhat.com ([209.132.183.28]:60416 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934861AbcKKRVS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Nov 2016 12:21:18 -0500
Date: Fri, 11 Nov 2016 11:21:16 -0600
From: Josh Poimboeuf <jpoimboe@redhat.com>
Subject: Re: Kbuild: CC= handling broken for tools/
Message-ID: <20161111172116.2kti4pdkqu6bjpvy@treble>
References: <2ef7ef23-5b11-a2cf-6205-4313aedddea8@suse.cz>
 <20161111140047.GA13610@krava>
 <f4fc1e89-bd82-917e-a986-c02b24c6b8d8@suse.cz>
 <20161111151427.GA27779@krava>
 <20161111153040.o6guxey27qkfzlxs@treble>
 <fb1c54e7-be4d-ba9b-cb2a-1b80c9ce1377@suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <fb1c54e7-be4d-ba9b-cb2a-1b80c9ce1377@suse.cz>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jiri Slaby <jslaby@suse.cz>
Cc: Jiri Olsa <jolsa@redhat.com>, Michal Marek <MMarek@suse.com>, linux-kbuild@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>

On Fri, Nov 11, 2016 at 06:08:24PM +0100, Jiri Slaby wrote:
> On 11/11/2016, 04:30 PM, Josh Poimboeuf wrote:
> > Does it work if you use KCFLAGS instead of EXTRA_CFLAGS?
> 
> Yes, the kernel builds with the flags now.
> 
> But objtool is unexpectedly still built by a different compiler.
> 
> I would also prefer the flags (like the warning above) to be passed even
> when building host commands.

In that case, if you want to build *everything* in tools and kernel with
the new compiler and new flags, I think you'll need to set HOSTCC,
HOSTCFLAGS, and CFLAGS, in addition to CC and KCFLAGS.

objtool uses the host compiler, but it doesn't support setting HOSTCC or
HOSTCFLAGS yet.  It always just uses 'gcc'.  I'll add HOSTCC/HOSTCFLAGS
to the TODO list, though feel free to work up a patch.

-- 
Josh
