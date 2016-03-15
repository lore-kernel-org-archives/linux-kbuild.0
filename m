Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:58783 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S934371AbcCOCDm (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Mar 2016 22:03:42 -0400
Date: Tue, 15 Mar 2016 13:03:39 +1100
From: Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [GIT PULL v4.6] MDB Linux Kernel Debugger x86/x86_64
Message-ID: <20160315130339.688689bd@canb.auug.org.au>
In-Reply-To: <CA+ekxPU9D9dfhtzEP+bEvTthg3M_UWyY1zQHaRb0APppp-t7-g@mail.gmail.com>
References: <20160314235035.GA5799@localhost.localdomain>
	<1457999823.11972.143.camel@perches.com>
	<20160315112458.7248d665@canb.auug.org.au>
	<CA+ekxPU9D9dfhtzEP+bEvTthg3M_UWyY1zQHaRb0APppp-t7-g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jeffrey Merkey <jeffmerkey@gmail.com>
Cc: Joe Perches <joe@perches.com>, linux-kernel@vger.kernel.org, torvalds@linux-foundation.org, linux-kbuild <linux-kbuild@vger.kernel.org>

Hi Jeff,

On Mon, 14 Mar 2016 18:40:37 -0600 Jeffrey Merkey <jeffmerkey@gmail.com> wrote:
>
> I was sure I told git to put a sign-off line.  Well, I'll go fix that
> and amend the commit as signed.  Don't know what happened there.  Are
> you supposed to say
> 
> git commit -s -a -v -S
> 
> I just used
> 
> git commit -S -a -v
> 
> I'll amend that commit.  Folks can review and discuss on this thread.

We don't generally PGP (GPG) sign commits in the kernel tree (so "-S"
is not required), just tags.  However we always require that anyone who
handles a patch adds a Signed-off-by line to the final commit.  See
Documentation/SubmittingPatches Section 11.

-- 
Cheers,
Stephen Rothwell
