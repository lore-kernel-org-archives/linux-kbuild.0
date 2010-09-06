Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:48187 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753012Ab0IFL3i (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 6 Sep 2010 07:29:38 -0400
Date: Mon, 6 Sep 2010 13:29:37 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kbuild, deb-pkg: Check if KBUILD_IMAGE exists before
 copying it
Message-ID: <20100906112937.GB2617@sepie.suse.cz>
References: <20100903023328.GA15380@gaara.hadrons.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20100903023328.GA15380@gaara.hadrons.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Guillem Jover <guillem@hadrons.org>
Cc: linux-kbuild@vger.kernel.org

On Fri, Sep 03, 2010 at 04:33:28AM +0200, Guillem Jover wrote:
> Avoid an error when doing cp over the image when it does not contain
> the full path to the file.
> 
> Signed-off-by: Guillem Jover <guillem@hadrons.org>
> ---
>  scripts/package/builddeb |    4 +++-
>  1 files changed, 3 insertions(+), 1 deletions(-)

Thanks, applied.

Michal
