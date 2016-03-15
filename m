Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-vk0-f54.google.com ([209.85.213.54]:33670 "EHLO
	mail-vk0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754525AbcCOAki (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Mar 2016 20:40:38 -0400
MIME-Version: 1.0
In-Reply-To: <20160315112458.7248d665@canb.auug.org.au>
References: <20160314235035.GA5799@localhost.localdomain>
	<1457999823.11972.143.camel@perches.com>
	<20160315112458.7248d665@canb.auug.org.au>
Date: Mon, 14 Mar 2016 18:40:37 -0600
Message-ID: <CA+ekxPU9D9dfhtzEP+bEvTthg3M_UWyY1zQHaRb0APppp-t7-g@mail.gmail.com>
Subject: Re: [GIT PULL v4.6] MDB Linux Kernel Debugger x86/x86_64
From: Jeffrey Merkey <jeffmerkey@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Rothwell <sfr@canb.auug.org.au>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

On 3/14/16, Stephen Rothwell <sfr@canb.auug.org.au> wrote:
> Hi Joe,
>
> On Mon, 14 Mar 2016 16:57:03 -0700 Joe Perches <joe@perches.com> wrote:
>>
>> On Mon, 2016-03-14 at 17:50 -0600, Jeffrey Merkey wrote:
>> > The following changes since commit
>> > b562e44f507e863c6792946e4e1b1449fbbac85d:
>> >
>> >   Linux 4.5 (2016-03-13 21:28:54 -0700)
>> >
>> > are available in the git repository at:
>> >
>> >   https://github.com/jeffmerkey/linux.git tags/mdb-v4.5-signed
>> >
>> > for you to fetch changes up to
>> > 2e9c184e1215dca2b4c59c347f40a0986b8e7460:
>> >
>> >   Add MDB Debugger to linux v4.5 (2016-03-14 15:17:44 -0600)
>>
>> If Linus doesn't pull this, Stephen, could you please add this
>> tree to -next so it has some testing and validation done?
>
> Well, I really need a request from the ongoing maintainer and also some
> indication of which kernel release (if any) it is likely to be merged
> into ...
>
> As a general rule, I do not add trees to linux-next during the merge
> window (there have been some special cases when something was going in
> during that merge window).
>
> I do note that the single commit in that tag has no Signed-off-by,
> Reviewed-by or Acked-by tags at all.  As such I can't see Linus merging
> it as is.  The commit message also has no detail at all.  It is also
> based on v4.5 which was only released yesterday.
> --
> Cheers,
> Stephen Rothwell
>

Hi Stephen,

I was sure I told git to put a sign-off line.  Well, I'll go fix that
and amend the commit as signed.  Don't know what happened there.  Are
you supposed to say

git commit -s -a -v -S

I just used

git commit -S -a -v

I'll amend that commit.  Folks can review and discuss on this thread.

Jeff
