Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:59157 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757405AbZGQVPM (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 17 Jul 2009 17:15:12 -0400
Date: Fri, 17 Jul 2009 23:15:11 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] KBUILD:  Centralize the compression tests for
	BLK_DEV_INITRD.
Message-ID: <20090717211511.GE7080@merkur.ravnborg.org>
References: <alpine.LFD.2.00.0907080933010.25809@localhost>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <alpine.LFD.2.00.0907080933010.25809@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Cc: kbuild devel list <linux-kbuild@vger.kernel.org>

On Wed, Jul 08, 2009 at 09:33:25AM -0400, Robert P. J. Day wrote:
> 
> Factor out the tests for BLK_DEV_INITRD from the compression entries
> and wrap the whole thing in a single test to make it more visually
> obvious what's happening.
> 
> Signed-off-by: Robert P. J. Day <rpjday@crashcourse.ca>
> 

This does not increase readability.
If you look at RD_LZMA you have to look three options above to realize
that this is dependent on BLK_DEV_INITRD.

	Sam
