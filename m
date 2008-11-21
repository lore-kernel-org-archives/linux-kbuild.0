Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:41952 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752040AbYKUU7X (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 21 Nov 2008 15:59:23 -0500
Date: Fri, 21 Nov 2008 21:58:09 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] scripts/mkcompile_h: kill output in silent mode
Message-ID: <20081121205809.GA14970@uranus.ravnborg.org>
References: <1225960282-30342-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1225960282-30342-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org

On Thu, Nov 06, 2008 at 03:31:22AM -0500, Mike Frysinger wrote:
> The mkcompile_h script does `echo` regardless of silent mode the make is
> running at, so have it respect $quiet from kbuild and only echo when not in
> silent mode.
> 
> Signed-off-by: Mike Frysinger <vapier@gentoo.org>

Applied.

	Sam
