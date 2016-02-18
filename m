Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56200 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1425615AbcBRJgH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 18 Feb 2016 04:36:07 -0500
Subject: Re: [PATCH] kbuild: disable Android-specific compiler features
References: <20160206004438.GA21780@www.outflux.net>
 <CAGXu5jKOqnAGkpgr0iY47gFYAuJXQnsF5dQO655D00voVkX5UQ@mail.gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <56C59083.7060501@suse.com>
Date: Thu, 18 Feb 2016 10:36:03 +0100
MIME-Version: 1.0
In-Reply-To: <CAGXu5jKOqnAGkpgr0iY47gFYAuJXQnsF5dQO655D00voVkX5UQ@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Kees Cook <keescook@chromium.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, LKML <linux-kernel@vger.kernel.org>, linux-kbuild <linux-kbuild@vger.kernel.org>

Dne 18.2.2016 v 00:03 Kees Cook napsal(a):
> On Fri, Feb 5, 2016 at 4:44 PM, Kees Cook <keescook@chromium.org> wrote:
>> The Android compilers enable some non-standard features by default. While
>> most Android build systems inject the needed "-mno-android" option via
>> KCFLAGS, it happens too late (at least on x86_64), since KBUILD_CFLAGS
>> gains KCFLAGS after running (and failing) many cc-option tests. (For
>> example, the stack-protector tests happen after arch-specific
>> KBUILD_CFLAGS are added but before the external KCFLAGS are added.) As
>> such, we should notice this option and immediately turn it on as the
>> first cc-option test we run.
>>
>> Signed-off-by: Kees Cook <keescook@chromium.org>
> 
> Michal, is this okay? I'd like to get it into -next soon if possible.

Is there a way to detect these compilers and are there some canonical
versions of these? I do not think it's a good idea to add workaround for
each random gcc fork.

Michal
