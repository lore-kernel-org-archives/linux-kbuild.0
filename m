Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([203.11.71.1]:53249 "EHLO ozlabs.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751182AbeEPCiE (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Tue, 15 May 2018 22:38:04 -0400
From: Michael Ellerman <mpe@ellerman.id.au>
Subject: Re: [PATCH v3 3/4] powerpc/kbuild: Use flags variables rather than overriding LD/CC/AS
In-Reply-To: <20180515104324.5230d827@gandalf.local.home>
References: <20180514035228.21316-1-npiggin@gmail.com> <20180514035228.21316-4-npiggin@gmail.com> <20180514112826.1b820335@gandalf.local.home> <87tvr9o5iy.fsf@concordia.ellerman.id.au> <20180515104324.5230d827@gandalf.local.home>
Date: Wed, 16 May 2018 12:37:57 +1000
Message-ID: <87h8n8nx4q.fsf@concordia.ellerman.id.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Nicholas Piggin <npiggin@gmail.com>, Masahiro Yamada <yamada.masahiro@socionext.com>, linuxppc-dev@lists.ozlabs.org, linux-kbuild@vger.kernel.org

Steven Rostedt <rostedt@goodmis.org> writes:
> On Tue, 15 May 2018 15:24:21 +1000
> Michael Ellerman <mpe@ellerman.id.au> wrote:
>
>> > Have you tried building all current archs with function tracing enabled
>> > to make sure this doesn't break any of them? I can do it if you want.  
>> 
>> We shouldn't need to should we? This is only touching powerpc specific
>> code (if I understand perl that is).
>> 
>> eg:
>> 
>> $ git diff -U9 scripts/recordmcount.pl
>
> Thanks for the added context!
>
> Yeah, I don't look at that code much anymore since I mainly deal with
> recordmcount.c now-a-days. I wonder if someone should port ppc to that.

Ah right. I didn't realise they were mutually exclusive. I'll add a TODO
for us to port over to the C version.

> It is also no my todo list to merge that with objtool.
>
> Anyway,
>
> Acked-by: Steven Rostedt (VMware) <rostedt@goodmis.org>

Thanks.

cheers
