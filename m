Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:44657 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752632AbYLCV2K (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Dec 2008 16:28:10 -0500
Date: Wed, 3 Dec 2008 22:29:38 +0100
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [patch 8/8] scripts/extract-ikconfig: remove bashisms
Message-ID: <20081203212938.GC7599@uranus.ravnborg.org>
References: <200812012221.mB1ML8FS013118@imap1.linux-foundation.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <200812012221.mB1ML8FS013118@imap1.linux-foundation.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, werner@openmoko.org, randy.dunlap@oracle.com

On Mon, Dec 01, 2008 at 02:21:08PM -0800, akpm@linux-foundation.org wrote:
> From: Werner Almesberger <werner@openmoko.org>
> 
> scripts/extract-ikconfig contains a lot of gratuituous bashisms, which
> make it fail if /bin/sh isn't bash.  This patch replaces them with regular
> Bourne shell constructs.
> 
> Signed-off-by: Werner Almesberger <werner@openmoko.org>
> Signed-off-by: Randy Dunlap <randy.dunlap@oracle.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>

Already applied - soon to appear in -next.

	Sam
