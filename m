Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vc0-f175.google.com ([209.85.220.175]:38521 "EHLO
	mail-vc0-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932908Ab3D2VnA (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 29 Apr 2013 17:43:00 -0400
MIME-Version: 1.0
In-Reply-To: <CA+55aFzEwRUWVQ8x1+f=6R_9+JO_Rmg=u2E1k_6jLuQEAorgtQ@mail.gmail.com>
References: <20130429195100.202681236@goodmis.org>
	<CA+55aFzEwRUWVQ8x1+f=6R_9+JO_Rmg=u2E1k_6jLuQEAorgtQ@mail.gmail.com>
Date: Mon, 29 Apr 2013 14:42:59 -0700
Message-ID: <CA+55aFzSfRv26E3UF1a8jwQK+vHSru-YTg8ADefZxOKZNnn6fA@mail.gmail.com>
Subject: Re: [PATCH 0/2] [GIT PULL] localmodconfig: Fix missing depends of
 config files included in if statements
From: Linus Torvalds <torvalds@linux-foundation.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, Linux Kbuild mailing list <linux-kbuild@vger.kernel.org>

On Mon, Apr 29, 2013 at 2:01 PM, Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> There's just too much confusion here for me to touch anything at all,
> so please fix things up.

Oh, and you might as well check that I resolved the conflicts in the
trace pull correctly while you're at it. They looked pretty obvious,
and it compiles for me, but ..

              Linus
