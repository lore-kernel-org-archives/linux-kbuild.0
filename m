Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:52484 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751188AbYLCV06 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 16:26:58 -0500
Date: Wed, 3 Dec 2008 22:28:25 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 7/8] tags: link from CONFIG_x to 'config x' as well
Message-ID: <20081203212825.GB7599@uranus.ravnborg.org>
References: <200812012221.mB1ML8pR013109@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812012221.mB1ML8pR013109@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, adobriyan@gmail.com

On Mon, Dec 01, 2008 at 02:21:07PM -0800, akpm@linux-foundation.org wrote:
> From: Alexey Dobriyan <adobriyan@gmail.com>
> 
> Inability to jump from CONFIG_ symbol in source to symbol definition in
> Kconfig is very, very annoying. You'll jump to useless entry in autoconf.h,
> if it exists at all.

Included in my patch where I move all tags
support to a shell script.

So when I poush out kbuild-next this will no longer apply anyway.

	Sam
