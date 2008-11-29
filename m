Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ox1.aei.mpg.de ([194.94.224.6]:54747 "EHLO ox1.aei.mpg.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1752715AbYK2XCO (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 29 Nov 2008 18:02:14 -0500
Date: Sun, 30 Nov 2008 00:02:34 +0100
From: "Carlos R. Mafra" <crmafra2@gmail.com>
Subject: Re: [PATCH] nconfig V3
Message-ID: <20081129230234.GA23504@Pilar.aei.mpg.de>
References: <1227994959-17627-2-git-send-email-nir.tzachar@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1227994959-17627-2-git-send-email-nir.tzachar@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nir Tzachar <nir.tzachar@gmail.com>
Cc: linux-kernel@vger.kernel.org, bzolnier@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, ariveira@gmail.com, rdunlap@xenotime.net, 7eggert@gmx.de, kosaki.motohiro@jp.fujitsu.com, sam@ravnborg.org

On Sat 29.Nov'08 at 23:42:39 +0200, Nir Tzachar wrote:
> [...]
> +static ITEM *btns_items[BTN_MAX];

[...]

> +	btns_items[BTN_MAX] = NULL;

gcc warns about this here

scripts/kconfig/nconf.c:1311: warning: array subscript is above array bounds
