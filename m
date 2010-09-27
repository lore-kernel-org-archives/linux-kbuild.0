Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cam-admin0.cambridge.arm.com ([217.140.96.50]:48482 "EHLO
	cam-admin0.cambridge.arm.com" rhost-flags-OK-OK-OK-OK)
	by vger.kernel.org with ESMTP id S1755305Ab0I0Kvb (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 27 Sep 2010 06:51:31 -0400
Subject: Re: [PATCH] kconfig: delay symbol direct dependency initialization
From: Catalin Marinas <catalin.marinas@arm.com>
In-Reply-To: <1285532523-10180-1-git-send-email-lacombar@gmail.com>
References: <1285532523-10180-1-git-send-email-lacombar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Date: Mon, 27 Sep 2010 11:51:25 +0100
Message-ID: <1285584685.31188.1.camel@e102109-lin.cambridge.arm.com>
Mime-Version: 1.0
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Arnaud Lacombe <lacombar@gmail.com>
Cc: Michal Marek <mmarek@suse.cz>, linux-kbuild <linux-kbuild@vger.kernel.org>

On Sun, 2010-09-26 at 21:22 +0100, Arnaud Lacombe wrote:
> This fixes the use-after-free and associated crash in kconfig introduced
> in commit 246cf9c26bf11f2bffbecea6e5bd222eee7b1df8.
> 
> Signed-off-by: Arnaud Lacombe <lacombar@gmail.com>
> Acked-by: Catalin Marinas <catalin.marinas@arm.com>

Thanks for this.

Michal, could we please push this to mainline before 2.6.36 is released?
It fixes a serious bug IMHO. Thanks.

-- 
Catalin

