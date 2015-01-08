Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:40044 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1750869AbbAHOGY (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 8 Jan 2015 09:06:24 -0500
Message-ID: <54AE8EDE.8010608@suse.cz>
Date: Thu, 08 Jan 2015 15:06:22 +0100
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: use mixed-targets when two or more config targets
 are given
References: <1418292754-2987-1-git-send-email-yamada.m@jp.panasonic.com>
In-Reply-To: <1418292754-2987-1-git-send-email-yamada.m@jp.panasonic.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Masahiro Yamada <yamada.m@jp.panasonic.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2014-12-11 11:12, Masahiro Yamada wrote:
> "make kvmconfig" expects that the .config has already been created,
> but some people might want to create the .config and run kvmconfig
> in one shot command, like this:
> 
>   $ make defconfig kvmconfig
> 
> To make sure this command works correctly even if -j* option is set,
> we must handle them one by one.
> This commit turns on mixed-targets when $(MAKECMDGOALS) includes
> at least one config target and also includes another target.
> 
> Signed-off-by: Masahiro Yamada <yamada.m@jp.panasonic.com>

Applied to kbuild.git#kbuild, thanks.

Michal

