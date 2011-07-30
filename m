Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f46.google.com ([209.85.161.46]:61358 "EHLO
	mail-fx0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751090Ab1G3Om4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 30 Jul 2011 10:42:56 -0400
Date: Sat, 30 Jul 2011 17:42:50 +0300
From: Alexey Dobriyan <adobriyan@gmail.com>
Subject: Re: [PATCH] Allows Kernel developer to change optimization options
 making code more debug friendly.
Message-ID: <20110730144250.GA7243@p183.telecom.by>
References: <4E2D2689.6030500@suse.cz>
 <1312027749-10520-1-git-send-email-mail@smogura.eu>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1312027749-10520-1-git-send-email-mail@smogura.eu>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?utf-8?B?UmFkb3PFgmF3?= Smogura <mail@smogura.eu>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Randy Dunlap <rdunlap@xenotime.net>, linux-kbuild@vger.kernel.org

On Sat, Jul 30, 2011 at 02:09:09PM +0200, Radosław Smogura wrote:
> Included new Makefile and new KConfig has been automaticly generated
> by simple bash script scripts/debug/make_config_optim.sh, which

> +ifdef CONFIG_HACK_OPTIM_FORCE_O1_LEVEL
> +KBUILD_CFLAGS += -O1
> +else

Just patch top level Makefile.
