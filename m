Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49501 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753557Ab3BVKUk (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 22 Feb 2013 05:20:40 -0500
Date: Fri, 22 Feb 2013 11:20:38 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH 1/1] scripts/package/Makefile: remove useless
	KBUILD_OUTPUT test
Message-ID: <20130222102038.GC12402@pobox.suse.cz>
References: <1358753285-11812-1-git-send-email-wbin00@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1358753285-11812-1-git-send-email-wbin00@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Bin Wang <wbin00@gmail.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Mon, Jan 21, 2013 at 03:28:05PM +0800, Bin Wang wrote:
> The test of KBUILD_OUTPUT in "rpm-pkg rpm" target is useless.
> KBUILD_OUTPUT is always empty here.

Right, but the error message is valid, make rpm-pkg does not work with
O=. So I suggest to either fix make O=... rpm-pkg, or fix the test to
compare $(srctree) and $(objtree) instead.

Michal
