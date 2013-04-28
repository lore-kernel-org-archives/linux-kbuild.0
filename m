Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from moutng.kundenserver.de ([212.227.126.186]:60408 "EHLO
	moutng.kundenserver.de" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752141Ab3D1BGF (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 27 Apr 2013 21:06:05 -0400
From: Arnd Bergmann <arnd@arndb.de>
Subject: Re: [PATCH 6/8] kconfig: fix randomising choice entries in presence of KCONFIG_ALLCONFIG
Date: Sun, 28 Apr 2013 03:05:57 +0200
References: <cover.1366841993.git.yann.morin.1998@free.fr> <201304272301.00587.arnd@arndb.de> <20130427223158.GA24099@free.fr>
In-Reply-To: <20130427223158.GA24099@free.fr>
MIME-Version: 1.0
Content-Type: Text/Plain;
  charset="iso-8859-1"
Content-Transfer-Encoding: 7bit
Message-Id: <201304280305.57219.arnd@arndb.de>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: "Yann E. MORIN" <yann.morin.1998@free.fr>
Cc: linux-kbuild@vger.kernel.org, Michal Marek <mmarek@suse.cz>, linux-kernel@vger.kernel.org, Thomas Petazzoni <thomas.petazzoni@free-electrons.com>, Sam Ravnborg <sam@ravnborg.org>, Arnaud Lacombe <lacombar@gmail.com>, Greg KH <greg@kroah.com>

On Sunday 28 April 2013, Yann E. MORIN wrote:
> Fact is, choices are properly randomised, unless KCONFIG_ALLCONFIG is
> passed.
> 
> So, if you currently rely on choices not being randomised, it means
> you're using KCONFIG_ALLCONFIG [*] so you can set CONFIG_ARCH_MULTIPLATFORM
> in the defconfig you use.

Yes, you are right, I can easily do this.

	Arnd
