Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:52174 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751975AbYLCVZz (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 16:25:55 -0500
Date: Wed, 3 Dec 2008 22:27:22 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 4/8] tags: skip ./ in filenames
Message-ID: <20081203212721.GA7599@uranus.ravnborg.org>
References: <200812012221.mB1ML4NF013097@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812012221.mB1ML4NF013097@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, adobriyan@gmail.com

On Mon, Dec 01, 2008 at 02:21:04PM -0800, akpm@linux-foundation.org wrote:
> From: Alexey Dobriyan <adobriyan@gmail.com>
> 
> This drives size of tags file from 68.9 MB down to 67.7 MB.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Obsoleted by another patch of mine moving all this
tags stuff to a shell script.

	Sam
