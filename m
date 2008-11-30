Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-gx0-f11.google.com ([209.85.217.11]:64929 "EHLO
	mail-gx0-f11.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750771AbYK3Gn4 (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sun, 30 Nov 2008 01:43:56 -0500
Received: by gxk4 with SMTP id 4so1724104gxk.13
        for <linux-kbuild@vger.kernel.org>; Sat, 29 Nov 2008 22:43:54 -0800 (PST)
Message-ID: <9b2db90b0811292243o797c12d9iaf4d313af5f43698@mail.gmail.com>
Date: Sun, 30 Nov 2008 08:43:54 +0200
From: "Nir Tzachar" <nir.tzachar@gmail.com>
Subject: Re: [PATCH] nconfig V3
In-Reply-To: <20081129230234.GA23504@Pilar.aei.mpg.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Content-Disposition: inline
References: <1227994959-17627-2-git-send-email-nir.tzachar@gmail.com>
	 <20081129230234.GA23504@Pilar.aei.mpg.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Carlos R. Mafra" <crmafra2@gmail.com>
Cc: linux-kernel@vger.kernel.org, bzolnier@gmail.com, zippel@linux-m68k.org, linux-kbuild@vger.kernel.org, ariveira@gmail.com, rdunlap@xenotime.net, 7eggert@gmx.de, kosaki.motohiro@jp.fujitsu.com, sam@ravnborg.org

Hello.

On Sun, Nov 30, 2008 at 1:02 AM, Carlos R. Mafra <crmafra2@gmail.com> wrote:
> On Sat 29.Nov'08 at 23:42:39 +0200, Nir Tzachar wrote:
>> [...]
>> +static ITEM *btns_items[BTN_MAX];

Thanks. This should be btns_items[BTN_MAX+1];

> [...]
>
>> +     btns_items[BTN_MAX] = NULL;
>
> gcc warns about this here
>
> scripts/kconfig/nconf.c:1311: warning: array subscript is above array bounds
>

Cheers.
