Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:38065 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932162AbcDYMfw (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 08:35:52 -0400
Subject: Re: [PATCH] scripts/tags.sh: Exit gracefully if *tags tool not found
References: <1461516120-5600-1-git-send-email-eugeniu.m.rosca@gmail.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <571E0F1F.8090204@suse.com>
Date: Mon, 25 Apr 2016 14:35:43 +0200
MIME-Version: 1.0
In-Reply-To: <1461516120-5600-1-git-send-email-eugeniu.m.rosca@gmail.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>, mpe@ellerman.id.au, kirill.shutemov@linux.intel.com, naveen.n.rao@linux.vnet.ibm.com, akpm@linux-foundation.org, sboyd@codeaurora.org, paul.gortmaker@windriver.com
Cc: linux-kbuild@vger.kernel.org

On 2016-04-24 18:42, Eugeniu Rosca wrote:
> If the needed host utility is not found, current behavior is:
> 
> $> make cscope
>   GEN     cscope
> ./scripts/tags.sh: line 140: cscope: command not found
> $> make gtags
>   GEN     gtags
> ./scripts/tags.sh: line 145: gtags: command not found
> $> make tags
>   GEN     tags
> xargs: ctags: No such file or directory
> sed: can't read tags: No such file or directory
> Makefile:1509: recipe for target 'tags' failed
> make: *** [tags] Error 2
> $> make TAGS
>   GEN     TAGS
> xargs: etags: No such file or directory
> sed: can't read TAGS: No such file or directory
> Makefile:1509: recipe for target 'TAGS' failed
> make: *** [TAGS] Error 2
> 
> This patch allows to exit gracefully in such a situation:
> 
> $> make cscope
>   GEN     cscope
> cscope - not installed?
> $> make gtags
>   GEN     gtags
> gtags - not installed?
> $> make tags
>   GEN     tags
> ctags - not installed?
> $> make TAGS
>   GEN     TAGS
> etags - not installed?

It should fail if it's unable to create the requested file, though.
Appending '|| exit' to the docscope/dogtags/xtags calls should suffice.

Michal
