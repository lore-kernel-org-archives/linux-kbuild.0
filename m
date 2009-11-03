Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from kroah.org ([198.145.64.141]:36400 "EHLO coco.kroah.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752772AbZKCQKL (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Nov 2009 11:10:11 -0500
Date: Tue, 3 Nov 2009 07:58:24 -0800
From: Greg KH <greg@kroah.com>
Subject: Re: [PATCH 0/10] module: Speed up symbol resolution during module
	loading (using binary search)
Message-ID: <20091103155824.GA23857@kroah.com>
References: <9b2b86520911020852q49c55695rb05d87090fa9ad33@mail.gmail.com> <1257242782-10496-1-git-send-email-alan-jenkins@tuffmail.co.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1257242782-10496-1-git-send-email-alan-jenkins@tuffmail.co.uk>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Alan Jenkins <alan-jenkins@tuffmail.co.uk>
Cc: linux-kbuild@vger.kernel.org, carmelo73@gmail.com, linux-kernel@vger.kernel.org, rusty@rustcorp.com.au

On Tue, Nov 03, 2009 at 10:06:12AM +0000, Alan Jenkins wrote:
> GKH: Care to post actual patches?
> 
> Sure.
> 
> Changelog as per original post
> <http://article.gmane.org/gmane.linux.kbuild.devel/3983>

Nice stuff.  Becides the embedded people arguing among themselves, I see
no reason why you shouldn't submit this for inclusion in -next now.
Can you send this to Ingo for inclusion in the -tip tree?  Or should it
go through someone else's tree instead?

thanks,

greg k-h
