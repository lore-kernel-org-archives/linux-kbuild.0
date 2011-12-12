Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from ppsw-41.csi.cam.ac.uk ([131.111.8.141]:36041 "EHLO
	ppsw-41.csi.cam.ac.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751726Ab1LLLGv (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Mon, 12 Dec 2011 06:06:51 -0500
Date: Mon, 12 Dec 2011 11:06:44 +0000
From: Tony Finch <dot@dotat.at>
Subject: Re: [PATCH] unifdef: drop unused errno.h include
In-Reply-To: <20111210135456.GB22866@sepie.suse.cz>
Message-ID: <alpine.LSU.2.00.1112121040090.5322@hermes-2.csi.cam.ac.uk>
References: <1323210410-27111-1-git-send-email-vapier@gentoo.org> <20111210135456.GB22866@sepie.suse.cz>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michal Marek <mmarek@suse.cz>
Cc: Mike Frysinger <vapier@gentoo.org>, linux-kbuild@vger.kernel.org, linux-kernel@vger.kernel.org

On Tue, Dec 06, 2011 at 05:26:50PM -0500, Mike Frysinger wrote:
>
> This is the only header on my system that ends up requiring kernel
> headers, so if the kernel headers aren't available, we end up being
> unable to install kernel headers :).

I have some sympathy for this problem but I tend to think that it's
unreasonable to expect unifdef to work with an incomplete compiler
installation.

> Since this file doesn't actually use anything from errno.h, drop
> the include so it at least makes us a bit more robust on glibc.

The Linux kernel currently has unifdef-2.5. Version 2.6 has better error
handling so it uses the declaration of errno but not any of the E*
values. I could perhaps rejig it to avoid this if it really is important
to be able to bootsrap a system with incomplete headers.

Tony.
-- 
f.anthony.n.finch  <dot@dotat.at>  http://dotat.at/
Lundy, Fastnet, Irish Sea: West, backing south for a time, 5 or 6, increasing
7 to severe gale 9. Moderate or rough, occasionally very rough or high. Rain
or squally wintry showers. Good, occasionally poor.
