Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from zene.cmpxchg.org ([85.214.230.12]:59178 "EHLO zene.cmpxchg.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753157AbaHSQEU (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 19 Aug 2014 12:04:20 -0400
Date: Tue, 19 Aug 2014 10:56:40 -0500
From: Johannes Weiner <hannes@cmpxchg.org>
Subject: Re: [PATCH 2/3] scripts/tags.sh: remove *PCGFLAGS regular expressions
Message-ID: <20140819155640.GA11853@cmpxchg.org>
References: <gh61htovas.fsf@quad.gouders.net>
 <1408168618-6269-1-git-send-email-dirk@gouders.net>
 <1408168618-6269-3-git-send-email-dirk@gouders.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1408168618-6269-3-git-send-email-dirk@gouders.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Dirk Gouders <dirk@gouders.net>
Cc: Michal Marek <mmarek@suse.cz>, Masatake YAMATO <yamato@redhat.com>, linux-kbuild@vger.kernel.org

On Sat, Aug 16, 2014 at 07:56:57AM +0200, Dirk Gouders wrote:
> Commit 0a31bc97c80c3fa8 (mm: memcontrol: rewrite uncharge API)
> removed the macros {TEST,SET,CLEAR,TESTCLEAR}PCFLAG.  Remove
> corresponding entries from tags.sh -- in the emacs case they also
> produced warnigs because of unmatched '\('.
> 
> Signed-off-by: Dirk Gouders <dirk@gouders.net>
> Inspired-by: Masatake YAMATO <yamato@redhat.com>

Looks good, thanks.
