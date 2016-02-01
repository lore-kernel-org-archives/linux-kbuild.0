Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:49058 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753672AbcBALQY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 1 Feb 2016 06:16:24 -0500
Subject: Re: scripts/kconfig: allow building with make 3.80 again
References: <56A65F4B02000078000CAC75@prv-mh.provo.novell.com>
From: Michal Marek <mmarek@suse.de>
Message-ID: <56AF3E85.9050903@suse.de>
Date: Mon, 1 Feb 2016 12:16:21 +0100
MIME-Version: 1.0
In-Reply-To: <56A65F4B02000078000CAC75@prv-mh.provo.novell.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Jan Beulich <JBeulich@suse.com>
Cc: mpe@ellerman.id.au, linux-kbuild@vger.kernel.org

Dne 25.1.2016 v 17:45 Jan Beulich napsal(a):
> Documentation/Changes still lists this as the minimal required version,
> so it ought to remain usable for the time being.
> 
> Fixes: d2036f30cf ("scripts/kconfig/Makefile: Allow KBUILD_DEFCONFIG to be a target")
> Signed-off-by: Jan Beulich <jbeulich@suse.com>
> Cc: Michael Ellerman <mpe@ellerman.id.au>
> ---
>  scripts/kconfig/Makefile |    4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)

Sorry for the delay, applied to kbuild.git#kconfig now.

Michal

