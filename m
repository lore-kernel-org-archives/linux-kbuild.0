Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:43322 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750936Ab3JWPOA (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 23 Oct 2013 11:14:00 -0400
Date: Wed, 23 Oct 2013 17:13:59 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] show_delta: Update script to support python versions 2.5
 through 3.3
Message-ID: <20131023151359.GA28823@sepie.suse.cz>
References: <20131009143642.GA12462@woodpecker.gentoo.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20131009143642.GA12462@woodpecker.gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Pagano <mpagano@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

On Wed, Oct 09, 2013 at 10:36:42AM -0400, Mike Pagano wrote:
> Support past and active versions of python while maintaining backward compatibility. Script has been tested on python versions from 2.5.x up to and including 3.3.x.
> 
> 
> Signed-off-by: Mike Pagano <mpagano@gentoo.org>
> ---
>  scripts/show_delta | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)

Applied to kbuild.git#misc, thanks.

Michal
