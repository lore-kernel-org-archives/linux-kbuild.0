Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:49539 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751933AbaHENmq (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Aug 2014 09:42:46 -0400
Message-ID: <53E0DF51.3010506@suse.cz>
Date: Tue, 05 Aug 2014 15:42:41 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH v3] kbuild, LLVMLinux: Supress warnings unless W=1-3
References: <53DAAB35.8080206@suse.cz> <1406866105-24980-1-git-send-email-behanw@converseincode.com>
In-Reply-To: <1406866105-24980-1-git-send-email-behanw@converseincode.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: behanw@converseincode.com
Cc: linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, dwmw2@infradead.org, =?UTF-8?B?SmFuLVNpbW9uIE3DtmxsZXI=?= <dl9pf@gmx.de>, Mark Charlebois <charlebm@gmail.com>, bp@alien8.de

On 2014-08-01 06:08, behanw@converseincode.com wrote:
> From: Behan Webster <behanw@converseincode.com>
> 
> clang has more warnings enabled by default. Turn them off unless W is set.
> This patch fixes a logic bug where warnings in clang were disabled when W was set.
> 
> Signed-off-by: Behan Webster <behanw@converseincode.com>
> Signed-off-by: Jan-Simon Möller <dl9pf@gmx.de>
> Signed-off-by: Mark Charlebois <charlebm@gmail.com>
> Cc: mmarek@suse.cz
> Cc: bp@alien8.de
> ---
>  Makefile                   |  1 +
>  scripts/Makefile.extrawarn | 22 ++++++++++++----------
>  2 files changed, 13 insertions(+), 10 deletions(-)

OK, this looks better, I applied the patch to kbuild.git#kbuild.


> +KBUILD_CFLAGS += $(call cc-disable-warning, unknown-warning-option)

Do we have -W... options in the Makefiles that clang does not understand
and that are added unconditionally?

Thanks,
Michal

