Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:53550 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1754037Ab1EMT41 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 13 May 2011 15:56:27 -0400
Message-ID: <4DCD8CE4.4090404@suse.cz>
Date: Fri, 13 May 2011 21:56:20 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [Resend PATCH] package: Makefile: fix perf target bug
References: <1d7d3b31c0da82ce8ce75778922155b7004a8f7e.1305224477.git.mfm@muteddisk.com>	<4DCC4365.3030907@suse.cz>	<BANLkTimKpJoUnoYx8gXi6KCYgVpnXno4ow@mail.gmail.com>	<4DCC4F05.7010306@suse.cz>	<BANLkTimrW=ZG2sGG1Q8QehSnh5rW1eBzGw@mail.gmail.com>	<4DCCEB48.7030602@suse.cz> <BANLkTimcs83J3O8o7npLftBaQk1WKKZ=2Q@mail.gmail.com>
In-Reply-To: <BANLkTimcs83J3O8o7npLftBaQk1WKKZ=2Q@mail.gmail.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: matt mooney <mfmooney@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org

On 13.5.2011 20:52, matt mooney wrote:
> So the real problem is that tools/perf/MANIFEST contains wildcards,
> and when git archive is run, file name expansion isn't working
> properly. By adding the $(srctree) as a prefix, globbing works but
> then git archive requires --work-tree to be set.

I see. So how about
git --git-dir=$(srctree)/.git archive ... \
    $$(cd $(srctree); echo $$(cat tools/perf/MANIFEST))
? That does exactly the same as before the patch, just changes to
$(srctree) so that the expansion works.

Michal
