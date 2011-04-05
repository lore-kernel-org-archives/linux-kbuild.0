Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-ey0-f174.google.com ([209.85.215.174]:58400 "EHLO
	mail-ey0-f174.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753255Ab1DEPRx (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 5 Apr 2011 11:17:53 -0400
Subject: Re: [PATCH 16/34] nand/denali: Drop __TIME__ usage
From: Artem Bityutskiy <dedekind1@gmail.com>
Reply-To: dedekind1@gmail.com
In-Reply-To: <1302015561-21047-17-git-send-email-mmarek@suse.cz>
References: <1302015561-21047-1-git-send-email-mmarek@suse.cz>
	 <1302015561-21047-17-git-send-email-mmarek@suse.cz>
Content-Type: text/plain; charset="UTF-8"
Date: Tue, 05 Apr 2011 18:15:11 +0300
Message-ID: <1302016511.2760.146.camel@localhost>
Mime-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, linux-mtd@lists.infradead.org, David Woodhouse <dwmw2@infradead.org>, linux-kernel@vger.kernel.org, Chuanxiao Dong <chuanxiao.dong@intel.com>

On Tue, 2011-04-05 at 16:59 +0200, Michal Marek wrote:
> The kernel already prints its build timestamp during boot, no need to
> repeat it in random drivers and produce different object files each
> time.
> 
> Cc: Chuanxiao Dong <chuanxiao.dong@intel.com>
> Cc: David Woodhouse <dwmw2@infradead.org>
> Cc: linux-mtd@lists.infradead.org
> Signed-off-by: Michal Marek <mmarek@suse.cz>
> ---
>  drivers/mtd/nand/denali.c |    3 +--
>  1 files changed, 1 insertions(+), 2 deletions(-)

Pushed to l2-mtd-2.6.git, thanks.

-- 
Best Regards,
Artem Bityutskiy (Артём Битюцкий)

