Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:39100 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756058AbaIWOIF (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 23 Sep 2014 10:08:05 -0400
Date: Tue, 23 Sep 2014 16:08:03 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH] kconfig/lxdialog: get ncurses CFLAGS with pkg-config
Message-ID: <20140923140803.GB13913@sepie.suse.cz>
References: <1410692270-3225-1-git-send-email-bjorn.forsman@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <1410692270-3225-1-git-send-email-bjorn.forsman@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: =?iso-8859-1?Q?Bj=F8rn?= Forsman <bjorn.forsman@gmail.com>
Cc: yann.morin.1998@free.fr, linux-kbuild@vger.kernel.org

On Sun, Sep 14, 2014 at 12:57:50PM +0200, Bjørn Forsman wrote:
> This makes "make menuconfig" also work on systems where ncurses is not
> installed in a standard location (such as on NixOS).
> 
> This patch changes ccflags() so that it tries pkg-config first, and only
> if pkg-config fails does it go back to the fallback/manual checks. This
> is the same algorithm that ldflags() already uses.

Applied to kbuild.git#kbuild, thanks.

Michal
