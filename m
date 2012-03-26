Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:35865 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753228Ab2CZMyX (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 26 Mar 2012 08:54:23 -0400
Message-ID: <4F7066FD.4060104@suse.cz>
Date: Mon, 26 Mar 2012 14:54:21 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [patch 1/1] headers_check: recursively search for linux/types.h
 inclusion
References: <20120305230810.26823A02EB@akpm.mtv.corp.google.com>
In-Reply-To: <20120305230810.26823A02EB@akpm.mtv.corp.google.com>
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: akpm@linux-foundation.org
Cc: linux-kbuild@vger.kernel.org, bobbypowers@gmail.com, airlied@linux.ie, sam@ravnborg.org

On 6.3.2012 00:08, akpm@linux-foundation.org wrote:
> From: Bobby Powers <bobbypowers@gmail.com>
> Subject: headers_check: recursively search for linux/types.h inclusion
> 
> headers_check.pl currently emits some spurious warnings, especially for
> the drm headers, about using __[us]{8,16,32,64} types without including
> linux/types.h.  Recursively search for types.h inclusion, avoiding
> circular references.
> 
> Signed-off-by: Bobby Powers <bobbypowers@gmail.com>
> Cc: Sam Ravnborg <sam@ravnborg.org>
> Cc: Dave Airlie <airlied@linux.ie>
> Cc: Michal Marek <mmarek@suse.cz>
> Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
> ---

Applied to kbuild.git#kbuild.

Michal
