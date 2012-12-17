Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46669 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751581Ab2LQKOe (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 17 Dec 2012 05:14:34 -0500
Message-ID: <50CEF080.8010208@suse.cz>
Date: Mon, 17 Dec 2012 11:14:24 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] scripts: add checkmaintainers.py
References: <1355523576-7596-1-git-send-email-cesarb@cesarb.net>
In-Reply-To: <1355523576-7596-1-git-send-email-cesarb@cesarb.net>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Cesar Eduardo Barros <cesarb@cesarb.net>
Cc: linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, David Howells <dhowells@redhat.com>, Joe Perches <joe@perches.com>

On 14.12.2012 23:19, Cesar Eduardo Barros wrote:
> This small script checks the file patterns in the MAINTAINERS file.
> 
> For every file pattern, it checks if the pattern matches any file or
> directory in the kernel tree, printing the patterns which do not have a
> match.

Can't this be added as a warning to scripts/get_maintainer.pl instead?

Thanks,
Michal
