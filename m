Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:36455 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751983AbcLKKAp (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
        Sun, 11 Dec 2016 05:00:45 -0500
Date: Sun, 11 Dec 2016 11:00:42 +0100
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] kbuild/mkspec: avoid using brace expansion
Message-ID: <20161211100042.GA30135@sepie.suse.cz>
References: <20161025090041.GA4423@cdnetworks.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161025090041.GA4423@cdnetworks.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Anton Tikhomirov <anton.tikhomirov@cdnetworks.com>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Oct 25, 2016 at 06:00:44PM +0900, Anton Tikhomirov wrote:
> Brace expansion might not work properly if _buildshell RPM macro
> points to a shell other than bash. Particularly, with _bulidshell
> defined to /bin/dash it leads to broken build and source symlinks.
> 
> Signed-off-by: Anton Tikhomirov <anton.tikhomirov@cdnetworks.com>
> ---
>  scripts/package/mkspec | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)

Applied to kbuild.git#misc, thanks.

Michal
