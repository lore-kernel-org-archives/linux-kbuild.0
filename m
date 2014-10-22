Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cdptpa-outbound-snat.email.rr.com ([107.14.166.230]:42980 "EHLO
	cdptpa-oedge-vip.email.rr.com" rhost-flags-OK-OK-OK-FAIL)
	by vger.kernel.org with ESMTP id S932336AbaJVUfK (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 22 Oct 2014 16:35:10 -0400
Date: Wed, 22 Oct 2014 16:35:07 -0400
From: Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH] kbuild: Fix output of make kernelrelease
Message-ID: <20141022163507.6e2162d1@gandalf.local.home>
In-Reply-To: <20141022194408.GA20989@pobox.suse.cz>
References: <20141022101944.70d637cc@gandalf.local.home>
	<20141022194408.GA20989@pobox.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: LKML <linux-kernel@vger.kernel.org>, Masahiro Yamada <yamada.m@jp.panasonic.com>, Peter Foley <pefoley2@pefoley.com>, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>

On Wed, 22 Oct 2014 21:44:08 +0200
Michal Marek <mmarek@suse.cz> wrote:

> Dne 22.10.2014 v 16:19 Steven Rostedt napsal(a):
> > 
> > Commit 7ff525712acf "kbuild: fake the "Entering directory ..." message
> > more simply" changed the output of "make kernelrelease" such that the
> > kernel release version was not the last line printed. This broke various
> > tools that would find the kernel release with "make kernelrelease | tail -1".
> 
> The cleaner and recommended (see recent make help) way is to use make -s:
> 
> $ make O=build -s kernelrelease
> 3.18.0-rc1+

Hmm, I see the help index was recently updated to include that.

Does this work with older kernels too? That's very important.

-- Steve
