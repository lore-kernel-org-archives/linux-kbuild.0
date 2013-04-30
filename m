Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from hrndva-omtalb.mail.rr.com ([71.74.56.122]:30996 "EHLO
	hrndva-omtalb.mail.rr.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932697Ab3D3AIQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 20:08:16 -0400
Message-ID: <1367280494.30667.38.camel@gandalf.local.home>
Subject: Re: [PATCH 0/2] [GIT PULL] localmodconfig: Fix missing depends of
 config files included in if statements
From: Steven Rostedt <rostedt@goodmis.org>
Date: Mon, 29 Apr 2013 20:08:14 -0400
In-Reply-To: <CA+55aFzSfRv26E3UF1a8jwQK+vHSru-YTg8ADefZxOKZNnn6fA@mail.gmail.com>
References: <20130429195100.202681236@goodmis.org>
	 <CA+55aFzEwRUWVQ8x1+f=6R_9+JO_Rmg=u2E1k_6jLuQEAorgtQ@mail.gmail.com>
	 <CA+55aFzSfRv26E3UF1a8jwQK+vHSru-YTg8ADefZxOKZNnn6fA@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, 2013-04-29 at 14:42 -0700, Linus Torvalds wrote:
> On Mon, Apr 29, 2013 at 2:01 PM, Linus Torvalds
> <torvalds@linux-foundation.org> wrote:
> >
> > There's just too much confusion here for me to touch anything at all,
> > so please fix things up.
> 
> Oh, and you might as well check that I resolved the conflicts in the
> trace pull correctly while you're at it. They looked pretty obvious,
> and it compiles for me, but ..

Almost.

I'll also run my full ftrace test suite on your latest kernel, and see
if it finds anything else.

Please apply:

---
tracing: Fix small merge bug

During the 3.10 merge, a conflict happened and the resolution was
almost, but not quite, correct. An if statement was reversed.

Signed-off-by: Steven Rostedt <rostedt@goodmis.org>

diff --git a/kernel/trace/trace.c b/kernel/trace/trace.c
index 581630a..ae6fa2d 100644
--- a/kernel/trace/trace.c
+++ b/kernel/trace/trace.c
@@ -904,7 +904,7 @@ update_max_tr_single(struct trace_array *tr, struct task_struct *tsk, int cpu)
 		return;
 
 	WARN_ON_ONCE(!irqs_disabled());
-	if (tr->allocated_snapshot) {
+	if (!tr->allocated_snapshot) {
 		/* Only the nop tracer should hit this when disabling */
 		WARN_ON_ONCE(tr->current_trace != &nop_trace);
 		return;


