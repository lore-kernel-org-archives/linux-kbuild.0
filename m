Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:34836 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751344AbaJBNLH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 2 Oct 2014 09:11:07 -0400
Message-ID: <542D4EE9.4010003@suse.cz>
Date: Thu, 02 Oct 2014 15:11:05 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: arm: Do not define "comma" twice
References: <1408704737-16973-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1408704737-16973-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>
Cc: linux-kbuild@vger.kernel.org, linux-arm-kernel@lists.infradead.org

On 2014-08-22 12:52, Masahiro Yamada wrote:
> The definition of "comma" exists in scripts/Kbuild.include.
> We should not double it.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>
> Cc: linux-arm-kernel@lists.infradead.org

I do not see the patch in linux-next, so I applied it to the kbuild tree.

Michal

