Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:47578 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754262AbZAGU3e (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 7 Jan 2009 15:29:34 -0500
Date: Wed, 7 Jan 2009 21:31:13 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH RESEND] Documentation/kbuild: fix typos (s/bin_shipped/bin.o_shipped/)
Message-ID: <20090107203113.GK4647@uranus.ravnborg.org>
References: <20090106141227.GA28227@pengutronix.de>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20090106141227.GA28227@pengutronix.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Wolfram Sang <w.sang@pengutronix.de>
Cc: linux-kbuild@vger.kernel.org

On Tue, Jan 06, 2009 at 03:12:27PM +0100, Wolfram Sang wrote:
> The text always mentions ...bin.o_shipped, just the example makefiles
> actually use ...bin_shipped. It was corrected in one place some time
> ago, these ones seem to have been forgotten.
> 
> Signed-off-by: Wolfram Sang <w.sang@pengutronix.de>

Applied, thanks for being persistent on this one.

	Sam
