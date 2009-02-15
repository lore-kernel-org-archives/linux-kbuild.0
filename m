Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:38074 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751443AbZBOJWL (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 15 Feb 2009 04:22:11 -0500
Date: Sun, 15 Feb 2009 10:24:02 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 1/1] tags: fix config symbols generation
Message-ID: <20090215092402.GB29094@uranus.ravnborg.org>
References: <200902112124.n1BLO9qK027146@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200902112124.n1BLO9qK027146@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, adobriyan@gmail.com

On Wed, Feb 11, 2009 at 01:24:09PM -0800, akpm@linux-foundation.org wrote:
> From: Alexey Dobriyan <adobriyan@gmail.com>
> 
> commit 4f628248a578585472e19e4cba2c604643af8c6c aka "kbuild: reintroduce
> ALLSOURCE_ARCHS support for tags/cscope" breaks tags generation for
> Kconfig symbols.
> 
> Steps to reproduce:
> 
> 	make tags
> 	vi -t PROC_FS
> 
> It should jump to 'config PROC_FS' line.
> 
> Signed-off-by: Alexey Dobriyan <adobriyan@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Applied to kbuild-fixes.git

	Sam
