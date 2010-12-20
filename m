Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:60281 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1757740Ab0LTPKs (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 20 Dec 2010 10:10:48 -0500
Date: Mon, 20 Dec 2010 16:10:47 +0100
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCHv2] kconfig: simplify select-with-unmet-direct-dependency
 warning
Message-ID: <20101220151047.GB20492@sepie.suse.cz>
References: <1291663669-13077-1-git-send-email-lacombar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1291663669-13077-1-git-send-email-lacombar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: linux-kbuild@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>

On Mon, Dec 06, 2010 at 02:27:49PM -0500, Arnaud Lacombe wrote:
> Hi,
> 
> This is an updated version of the patch I sent in mid-September to simplify the
> unmet dependency warnings.
> 
>  - Arnaud
> 
> ---
> 
> This is an attempt to simplify the expressing printed by kconfig when a
> symbol is selected but still has direct unmet dependency.
> 
> First, the symbol reverse dependency is split in sub-expression. Then,
> each sub-expression is checked to ensure that it does not contains the
> unmet dependency. This removes all the false-positive symbols which
> already have the correct dependency. Finally, only the symbol doing the
> "select" is printed, instead of the full dependency tree.
> 
> CC: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> ---
>  scripts/kconfig/expr.c      |   35 ++++++++++++++++++++++++++++++++++-
>  scripts/kconfig/lkc_proto.h |    2 +-
>  scripts/kconfig/symbol.c    |    6 +++++-
>  3 files changed, 40 insertions(+), 3 deletions(-)

I applied this to kbuild-2.6.git#kconfig now. If someone encounters a
warning that hides the actual culprit due to this patch, we will have to
solve it somehow, but otherwise these simplified expressions are wanted
IMO.

Michal
