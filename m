Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-bw0-f163.google.com ([209.85.218.163]:44740 "EHLO
	mail-bw0-f163.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752775AbZEAIrs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 1 May 2009 04:47:48 -0400
MIME-Version: 1.0
In-Reply-To: <20090430233642.333097165@goodmis.org>
References: <20090430233642.333097165@goodmis.org>
Date: Fri, 1 May 2009 09:47:45 +0100
Message-ID: <9b2b86520905010147l702e5129i1aa24c1eeefced27@mail.gmail.com>
Subject: Re: [PATCH 0/2] kconfig: updates to streamline_config.pl
From: Alan Jenkins <sourcejedi.lkml@googlemail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: linux-kernel@vger.kernel.org, Ingo Molnar <mingo@elte.hu>, Andrew Morton <akpm@linux-foundation.org>, Linus Torvalds <torvalds@linux-foundation.org>, Peter Zijlstra <peterz@infradead.org>, Thomas Gleixner <tglx@linutronix.de>, Theodore Tso <tytso@mit.edu>, Arnaldo Carvalho de Melo <acme@redhat.com>, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, Sam Ravnborg <sam@ravnborg.org>

On 5/1/09, Steven Rostedt <rostedt@goodmis.org> wrote:
> Thanks to Alan Jenkins for suggesting these cleanups/fixes/enhancements.

And thanks to you for pushing this script!  It should be handy for
speeding up bisection builds, without accidentally disabling a config
that caused the regression.

Though I'm wary of it for _general_ usage, because of hotplug.  I
think it would be even more useful if there was some way to preserve
all the currently selected USB drivers.

Alan
