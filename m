Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from bombadil.infradead.org ([198.137.202.133]:32772 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726290AbgAHPoI (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org>);
        Wed, 8 Jan 2020 10:44:08 -0500
Date: Wed, 8 Jan 2020 07:44:06 -0800
From: Christoph Hellwig <hch@infradead.org>
Subject: Re: [PATCH] kbuild: allow modules to link *.a archives
Message-ID: <20200108154406.GA21695@infradead.org>
References: <20200106032324.3147-1-masahiroy@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200106032324.3147-1-masahiroy@kernel.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: linux-kbuild@vger.kernel.org, Fumiya Shigemitsu <shfy1014@gmail.com>, Yongxin Liu <yongxin.liu@windriver.com>, Michal Marek <michal.lkml@markovi.net>, linux-kernel@vger.kernel.org, Greg Kroah-Hartman <gregkh@linuxfoundation.org>

On Mon, Jan 06, 2020 at 12:23:24PM +0900, Masahiro Yamada wrote:
> Since commit 69ea912fda74 ("kbuild: remove unneeded link_multi_deps"),
> modules cannot link *.a archives.
> 
> I do not see such a usecase in the upstream code, but multiple people
> reported this issue, so it seems to be a desired feature for external
> modules.

Kernel policy is to not keep around infrastructure not used upstream.
And linking archives in the kernel doesn't really make any sense, so
this shouldn't go in in any form.
