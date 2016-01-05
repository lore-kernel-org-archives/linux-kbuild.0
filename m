Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36701 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751768AbcAEVvn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Jan 2016 16:51:43 -0500
Subject: Re: [PATCH v2 7/8] tags: Unify emacs and exuberant rules
References: <1449242787-16598-1-git-send-email-mmarek@suse.com>
 <1449242787-16598-8-git-send-email-mmarek@suse.com>
From: Michal Marek <mmarek@suse.cz>
Message-ID: <568C3AEC.70000@suse.cz>
Date: Tue, 5 Jan 2016 22:51:40 +0100
MIME-Version: 1.0
In-Reply-To: <1449242787-16598-8-git-send-email-mmarek@suse.com>
Content-Type: text/plain; charset=iso-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

Dne 4.12.2015 v 16:26 Michal Marek napsal(a):
> The emacs rules were constantly lagging behind the exuberant ones. Use a
> single set of rules for both, to make the script easier to maintain.
> The language understood by both tools is basic regular expression with
> some limitations, which are documented in a comment. To be able to store
> the rules in an array and easily iterate over it, the script requires
> bash now. In the exuberant case, the change fixes some false matches in
> <linux/page-flags.h> and also some too greedy matches in the arguments
> of the DECLARE_*/DEFINE_* macros. In the emacs case, several previously
> not working rules are matching now. Tested with these versions of the
> tools:
> 
>   Exuberant Ctags 5.8, Copyright (C) 1996-2009 Darren Hiebert
>   etags (GNU Emacs 24.5)
> 
> Signed-off-by: Michal Marek <mmarek@suse.com>
> ---
> v2: Rebased onto current linux-next

I applied the series up to 7/8 to kbuild.git#misc. I will repost 8/8
with a more convincing changelog.

Michal
