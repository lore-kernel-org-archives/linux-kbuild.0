Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:45146 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752451AbcEPHGR (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 16 May 2016 03:06:17 -0400
Subject: Re: [PATCH] scripts/tags.sh: Exit gracefully if *tags tool not found
References: <1461516120-5600-1-git-send-email-eugeniu.m.rosca@gmail.com>
 <571E0F1F.8090204@suse.com> <20160515134413.GA14628@eugeniu-X230>
From: Michal Marek <mmarek@suse.com>
Message-ID: <57397167.4000000@suse.com>
Date: Mon, 16 May 2016 09:06:15 +0200
MIME-Version: 1.0
In-Reply-To: <20160515134413.GA14628@eugeniu-X230>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Eugeniu Rosca <eugeniu.m.rosca@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On 2016-05-15 15:44, Eugeniu Rosca wrote:
> I would kindly ask you to select one of the options provided below:
> 
> OPTION 1: Append '|| exit' to the docscope/dogtags/xtags calls.
> RESULT: This produces more error messages than with the original script:
> 
> $> make cscope
>   GEN     cscope
> ./scripts/tags.sh: line 140: cscope: command not found
> Makefile:1517: recipe for target 'cscope' failed
> make: *** [cscope] Error 127
> [...]

This is the correct behavior because a missing tool is an error.

Michal
