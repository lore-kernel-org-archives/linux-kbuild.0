Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48052 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754491Ab0IFL12 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Sep 2010 07:27:28 -0400
Date: Mon, 6 Sep 2010 13:27:27 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] scripts/setlocalversion: update comment regarding
 information retrieval about git repository state
Message-ID: <20100906112727.GA2617@sepie.suse.cz>
References: <4C80E5B9.3080405@suse.cz>
 <1283767039-27872-1-git-send-email-mika@grml.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1283767039-27872-1-git-send-email-mika@grml.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Prokop <mika@grml.org>
Cc: linux-kbuild@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org

On Mon, Sep 06, 2010 at 11:57:19AM +0200, Michael Prokop wrote:
> A tagged repository state isn't enough, git describe only
> looks at signed or annotated tags (git tag -a/-s). This
> documentation update makes sure the comment matches the
> current behaviour.
> 
> Signed-off-by: Michael Prokop <mika@grml.org>
> ---
>  scripts/setlocalversion |    6 ++++--
>  1 files changed, 4 insertions(+), 2 deletions(-)

Thanks, applied.

Michal
