Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from pfepa.post.tele.dk ([195.41.46.235]:38764 "EHLO
	pfepa.post.tele.dk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751579AbZFHFup (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 8 Jun 2009 01:50:45 -0400
Date: Mon, 8 Jun 2009 07:53:02 +0200
From: Sam Ravnborg <sam@ravnborg.org>
Subject: Re: [PATCH] kbuild: fix spacing for bzip2 commands
Message-ID: <20090608055302.GA22656@uranus.ravnborg.org>
References: <1244360677-26434-1-git-send-email-vapier@gentoo.org>
Mime-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1244360677-26434-1-git-send-email-vapier@gentoo.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Frysinger <vapier@gentoo.org>
Cc: linux-kbuild@vger.kernel.org, akpm@linux-foundation.org

On Sun, Jun 07, 2009 at 03:44:37AM -0400, Mike Frysinger wrote:
> The current bzip2 command has an extra space before the target:
>   MODPOST 4 modules
>   BZIP2    arch/blackfin/boot/vmlinux.bin.bz2
>   UIMAGE  arch/blackfin/boot/vmImage.bz2

Applied,
	Sam
