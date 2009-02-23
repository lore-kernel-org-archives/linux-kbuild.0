Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from nf-out-0910.google.com ([64.233.182.185]:32894 "EHLO
	nf-out-0910.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752000AbZBWK2L (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 23 Feb 2009 05:28:11 -0500
MIME-Version: 1.0
In-Reply-To: <435196707.27641@eyou.net>
References: <1234944825-10299-1-git-send-email-crquan@gmail.com>
	 <435196707.27641@eyou.net>
Date: Mon, 23 Feb 2009 18:28:07 +0800
Message-ID: <91b13c310902230228g116836b0of85494934e39313f@mail.gmail.com>
Subject: Re: [PATCH] [KBUILD] add symbol value to help find the real depend
From: Cheng Renquan <crquan@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Randy Dunlap <randy.dunlap@oracle.com>
Cc: Sam Ravnborg <sam@ravnborg.org>, Roman Zippel <zippel@linux-m68k.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Sat, Feb 21, 2009 at 2:12 PM, Randy Dunlap <randy.dunlap@oracle.com> wrote:
> Hi,
>
> This looks good/helpful.  Can it be made to work with
> gconfig & xconfig as well as menuconfig?

Patches for gconfig & xconfig are already in progress, please be
patient, I will post later. Thanks,

-- 
Cheng Renquan, Shenzhen, China
Henny Youngman  - "When I told my doctor I couldn't afford an
operation, he offered to touch-up my X-rays."
