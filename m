Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:38915 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757417Ab2CZNbS (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Mar 2012 09:31:18 -0400
Date: Mon, 26 Mar 2012 15:31:15 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild: incremental tags update for GNU Global
Message-ID: <20120326133115.GA29624@sepie.suse.cz>
References: <CAF8raN687u_PqzxS2kxNoQYO6mhO17u4eACE3fXuuRXN183Ggw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAF8raN687u_PqzxS2kxNoQYO6mhO17u4eACE3fXuuRXN183Ggw@mail.gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jianbin Kang <kjbmail@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Thu, Mar 08, 2012 at 03:48:03PM +0800, Jianbin Kang wrote:
>     GNU gtags support '-i' for updating tag files incrementally.
>     It runs more quickly than generating new tags after kernel source update.
> 
>     Signed-off-by:  Jianbin Kang <kjbmail@gmail.com>
> ---
>  scripts/tags.sh |    2 +-
>  1 files changed, 1 insertions(+), 1 deletions(-)

Applied to kbuild.git#misc, thanks.

Michal
