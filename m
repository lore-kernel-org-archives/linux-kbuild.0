Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepb.post.tele.dk ([195.41.46.236]:55022 "EHLO
	pfepb.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754892AbYLCVeB (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 16:34:01 -0500
Date: Wed, 3 Dec 2008 22:35:26 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 3/8] scripts/package: allow custom options to rpm
Message-ID: <20081203213526.GF7599@uranus.ravnborg.org>
References: <200812012221.mB1ML43Q013094@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812012221.mB1ML43Q013094@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, jk@ozlabs.org

On Mon, Dec 01, 2008 at 02:21:03PM -0800, akpm@linux-foundation.org wrote:
> From: Jeremy Kerr <jk@ozlabs.org>
> 
> Add a RPMOPTS make variable to allow arbitrary options to be passed
> to rpm during 'make rpm-pkg'. For example:
> 
>  make RPMOPTS="--define '_topdir /home/jk/rpm'" rpm-pkg
> 
> Signed-off-by: Jeremy Kerr <jk@ozlabs.org>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Applied.

	Sam
