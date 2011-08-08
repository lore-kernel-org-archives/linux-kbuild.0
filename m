Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:50466 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754063Ab1HHOCe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Aug 2011 10:02:34 -0400
Date: Mon, 8 Aug 2011 16:02:33 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/2] kconfig/nconf: nuke unreferenced `nohelp_text'
Message-ID: <20110808140233.GA11427@sepie.suse.cz>
References: <1312422727-9740-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1312422727-9740-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, Aug 03, 2011 at 09:52:06PM -0400, Arnaud Lacombe wrote:
> After commit 5416857867c9cc94aba641898c567d9707de30f1, 1nohelp_text' is no
> longer referenced, nuke it.
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/nconf.c |    2 --
>  1 files changed, 0 insertions(+), 2 deletions(-)

Applied to kbuild-2.6.git#kconfig.

Michal
