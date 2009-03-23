Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-fx0-f158.google.com ([209.85.220.158]:60382 "EHLO
	mail-fx0-f158.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752976AbZCWUJs (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Mar 2009 16:09:48 -0400
From: Bartlomiej Zolnierkiewicz <bzolnier@gmail.com>
Subject: Re: [PATCH] Be able to build pmac driver without IDE built-in
Date: Mon, 23 Mar 2009 21:12:21 +0100
References: <0a0401c9a8b9$fa181c30$f9b5a8c0@pii350>
In-Reply-To: <0a0401c9a8b9$fa181c30$f9b5a8c0@pii350>
MIME-Version: 1.0
Content-Disposition: inline
Message-Id: <200903232112.21291.bzolnier@gmail.com>
Content-Type: text/plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Gilles Espinasse <g.esp@free.fr>
Cc: sam@ravnborg.org, linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org, benh@kernel.crashing.org

On Thursday 19 March 2009, Gilles Espinasse wrote:
> No reason to need IDE built-in to be able to compile pmac driver
> Tested to work on 2.6.29-rc8 and 2.6.28.8 with ide and pmac as modules
> inside an initramfs
> 
>  Signed-off-by: Gilles Espinasse <g.esp@free.fr>

applied by hand (please check your mailer settings
as it seems to corrupt whitespaces)

> --- linux-2.6.28/drivers/ide/Kconfig.old 2009-03-19 16:36:34.000000000 +0100
> +++ linux-2.6.28/drivers/ide/Kconfig 2009-03-19 16:35:49.000000000 +0100
> @@ -676,7 +676,7 @@
>  # TODO: BLK_DEV_IDEDMA_PCI -> BLK_DEV_IDEDMA_SFF
>  config BLK_DEV_IDE_PMAC
>   tristate "PowerMac on-board IDE support"
> - depends on PPC_PMAC && IDE=y
> + depends on PPC_PMAC && IDE

IDE config options are covered by if IDE ... endif so no need to check
for IDE explicitly now (I cleaned this while applying the patch)
