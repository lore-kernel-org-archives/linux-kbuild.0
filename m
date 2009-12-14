Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:33246 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755567AbZLNKGW (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 14 Dec 2009 05:06:22 -0500
Date: Mon, 14 Dec 2009 11:06:14 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] modpost: fix segfault with short symbol names
Message-ID: <20091214100613.GA21769@sepie.suse.cz>
References: <1260615744-23165-1-git-send-email-mmarek@suse.cz>
 <BECBC631-3E9B-48EF-AA08-5C37806C4A7D@kernel.crashing.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <BECBC631-3E9B-48EF-AA08-5C37806C4A7D@kernel.crashing.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Segher Boessenkool <segher@kernel.crashing.org>
Cc: Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org

On Sat, Dec 12, 2009 at 04:26:20PM +0100, Segher Boessenkool wrote:
> >memcmp() is wrong here, the symbol name can be shorter than
> >KSYMTAB_PFX
> >or CRC_PFX.
> 
> >-		if (memcmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
> >+		if (strncmp(symname, CRC_PFX, strlen(CRC_PFX)) == 0) {
> 
> This doesn't change anything.  In both cases the function will return 0
> only if all strlen(CRC_PFX) chars match, and in both cases it can access
> strlen(CRC_PFX) chars (strncmp() is allowed to access characters after
> the first \0 just fine).

str(n)cmp is not allowed to access characters past the NUL byte.

Michal
