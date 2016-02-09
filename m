Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ozlabs.org ([103.22.144.67]:53677 "EHLO ozlabs.org"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751348AbcBID5H (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Feb 2016 22:57:07 -0500
From: Rusty Russell <rusty@rustcorp.com.au>
Subject: Re: [PATCH 6/6] kconfig option for TRIM_UNUSED_EXPSYMS
In-Reply-To: <1454963315-20468-7-git-send-email-nicolas.pitre@linaro.org>
References: <1454963315-20468-1-git-send-email-nicolas.pitre@linaro.org> <1454963315-20468-7-git-send-email-nicolas.pitre@linaro.org>
Date: Tue, 09 Feb 2016 13:04:52 +1030
Message-ID: <8737t21uib.fsf@rustcorp.com.au>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>, Michal Marek <mmarek@suse.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org, Al Viro <viro@ZenIV.linux.org.uk>

Nicolas Pitre <nicolas.pitre@linaro.org> writes:
> The config option to enable it all.
>
> Signed-off-by: Nicolas Pitre <nico@linaro.org>

Nice series!  In case you need it, here's my Ack.  Despite the overlap
with modules, it's all build trickery, so best via Sam's tree.

Acked-by: Rusty Russell <rusty@rustcorp.com.au>

Thanks,
Rusty.
