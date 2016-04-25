Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mout.kundenserver.de ([217.72.192.75]:62684 "EHLO
	mout.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932927AbcDYQEF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 25 Apr 2016 12:04:05 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 1/3] kbuild: call adjust_autoksyms.sh from source directory
Date: Mon, 25 Apr 2016 18:03:42 +0200
Message-ID: <6344903.f3MzTjXfrh@wuerfel>
In-Reply-To: <alpine.LFD.2.20.1604251122270.5091@knanqh.ubzr>
References: <1461590265-1397577-1-git-send-email-arnd@arndb.de> <7296896.uWM0Bol2Ir@wuerfel> <alpine.LFD.2.20.1604251122270.5091@knanqh.ubzr>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Nicolas Pitre <nicolas.pitre@linaro.org>
Cc: Michal Marek <mmarek@suse.com>, Rusty Russell <rusty@rustcorp.com.au>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org, Mauro Carvalho Chehab <mchehab@osg.samsung.com>

On Monday 25 April 2016 11:31:22 Nicolas Pitre wrote:
> I agree this was a bit unexpected to have compiled code in the docs 
> directory.  Whatever the reason, I didn't want autoksyms to interfere 
> here.  Still, I think it is still a good idea you rewrite your changelog 
> to judge those patches in the context of the reasons for having code 
> there in the first place.
> 

Ok, I've sent them out again now.

	Arnd
