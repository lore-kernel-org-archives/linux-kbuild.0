Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wm0-f43.google.com ([74.125.82.43]:36191 "EHLO
        mail-wm0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933443AbcKKRI1 (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Fri, 11 Nov 2016 12:08:27 -0500
Subject: Re: Kbuild: CC= handling broken for tools/
References: <2ef7ef23-5b11-a2cf-6205-4313aedddea8@suse.cz>
 <20161111140047.GA13610@krava> <f4fc1e89-bd82-917e-a986-c02b24c6b8d8@suse.cz>
 <20161111151427.GA27779@krava> <20161111153040.o6guxey27qkfzlxs@treble>
From: Jiri Slaby <jslaby@suse.cz>
Message-ID: <fb1c54e7-be4d-ba9b-cb2a-1b80c9ce1377@suse.cz>
Date: Fri, 11 Nov 2016 18:08:24 +0100
MIME-Version: 1.0
In-Reply-To: <20161111153040.o6guxey27qkfzlxs@treble>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Josh Poimboeuf <jpoimboe@redhat.com>, Jiri Olsa <jolsa@redhat.com>
Cc: Michal Marek <MMarek@suse.com>, linux-kbuild@vger.kernel.org, Linux kernel mailing list <linux-kernel@vger.kernel.org>

On 11/11/2016, 04:30 PM, Josh Poimboeuf wrote:
> Does it work if you use KCFLAGS instead of EXTRA_CFLAGS?

Yes, the kernel builds with the flags now.

But objtool is unexpectedly still built by a different compiler.

I would also prefer the flags (like the warning above) to be passed even
when building host commands.

thanks,
-- 
js
suse labs
