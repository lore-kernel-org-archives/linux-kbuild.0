Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:55395 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751561AbcEJPl2 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 10 May 2016 11:41:28 -0400
Date: Tue, 10 May 2016 17:41:28 +0200
From: Michal Marek <mmarek@suse.com>
Subject: Re: [PATCH] builddeb: include objtool binary in headers package
Message-ID: <20160510154128.GE13314@pobox.suse.cz>
References: <1462368939-1018-1-git-send-email-bjorn@mork.no>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1462368939-1018-1-git-send-email-bjorn@mork.no>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Mork <bjorn@mork.no>
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Wed, May 04, 2016 at 03:35:39PM +0200, Bjørn Mork wrote:
> "objtool" is required for building external m dules if "Compile-time
> stack metadata validation" is enabled.  Otherwise all builds based
> on the headers package fail with:
> 
>  make[1]: Entering directory '/usr/src/linux-headers-4.6.0-rc6'
>  make[2]: *** No rule to make target 'tools/objtool/objtool', needed by 'foo.o'.  Stop.
>  Makefile:1598: recipe for target 'foo.ko' failed
>  make[1]: *** [foo.ko] Error 2
>  make[1]: Leaving directory '/usr/src/linux-headers-4.6.0-rc6'
> 
> Signed-off-by: Bjørn Mork <bjorn@mork.no>
> ---
>  scripts/package/builddeb | 3 +++
>  1 file changed, 3 insertions(+)

Applied to kbuild.git#misc.

Michal
