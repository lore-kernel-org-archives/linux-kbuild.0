Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:46348 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750810AbaJJWzQ (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 10 Oct 2014 18:55:16 -0400
Message-ID: <543863D1.4020509@suse.cz>
Date: Sat, 11 Oct 2014 00:55:13 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Another fix for relative paths.
References: <20141010174943.GQ19800@derobert.net>
In-Reply-To: <20141010174943.GQ19800@derobert.net>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anthony DeRobertis <anthony@derobert.net>, linux-kbuild@vger.kernel.org

Dne 10.10.2014 v 19:49 Anthony DeRobertis napsal(a):
> 
> Similar to a765a7ce293aa0a072728790ce11088b2f7030e2, the -dbg package
> build did a cd, breaking relative paths. This resulted in the debug
> symbols being part of the kernel image package and further installed
> under /debian instead of /.

Linux-next has a fix already: 2d087139 (builddeb: put the dbg files into
the correct directory).

Michal
