Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34905 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755570Ab3GCOD5 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 3 Jul 2013 10:03:57 -0400
Date: Wed, 3 Jul 2013 16:03:55 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] tools/include: use stdint types for user-space byteshift
 headers
Message-ID: <20130703140355.GA1170@sepie.suse.cz>
References: <1372209217-7176-1-git-send-email-yselkowitz@users.sourceforge.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1372209217-7176-1-git-send-email-yselkowitz@users.sourceforge.net>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yaakov (Cygwin/X)" <yselkowitz@users.sourceforge.net>
Cc: linux-kbuild@vger.kernel.org

On Tue, Jun 25, 2013 at 08:13:37PM -0500, Yaakov (Cygwin/X) wrote:
> From: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>
> 
> Commit a07f7672d7cf0ff0d6e548a9feb6e0bd016d9c6c added user-space copies
> of the byteshift headers to be used by hostprogs, changing e.g. u8 to __u8.
> However, in order to cross-compile the kernel from a non-Linux system,
> stdint.h types need to be used instead of linux/types.h types.
> 
> Signed-off-by: Yaakov Selkowitz <yselkowitz@users.sourceforge.net>

Applied to kbuild.git#kbuild.

Thanks,
Michal
