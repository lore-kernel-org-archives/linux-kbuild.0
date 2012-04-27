Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from smtp.snhosting.dk ([87.238.248.203]:26323 "EHLO
	smtp.domainteam.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751112Ab2D0ExJ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Apr 2012 00:53:09 -0400
Date: Fri, 27 Apr 2012 06:53:06 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: Makefile: remove unnecessary check for
	m68knommu ARCH
Message-ID: <20120427045306.GA4816@merkur.ravnborg.org>
References: <1335496484-3438-1-git-send-email-laface.tw@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1335496484-3438-1-git-send-email-laface.tw@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Edward Shao <laface.tw@gmail.com>, Michal Marek <mmarek@suse.cz>
Cc: linux-kbuild@vger.kernel.org, geert@linux-m68k.org

On Fri, Apr 27, 2012 at 11:14:44AM +0800, Edward Shao wrote:
> ARCH is never set to m68knomm.
> make ARCH=m68knomm is not supported anymore.
> 
> Signed-off-by: Edward Shao <laface.tw@gmail.com>
Acked-by: Sam Ravnborg <sam@ravnborg.org>
