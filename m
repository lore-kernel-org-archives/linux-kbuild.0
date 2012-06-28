Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52044 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S932133Ab2F1IsH (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jun 2012 04:48:07 -0400
Message-ID: <4FEC1A40.8080703@suse.cz>
Date: Thu, 28 Jun 2012 10:48:00 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Install linux-firmware-image in versioned dir
References: <1339107675-7402-1-git-send-email-max@stro.at>
In-Reply-To: <1339107675-7402-1-git-send-email-max@stro.at>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <max@stro.at>
Cc: linux-kbuild@vger.kernel.org, Michael Prokop <mika@debian.org>

On 8.6.2012 00:21, maximilian attems wrote:
> That way they don't file conflict with official firmware package:
>  trying to overwrite '/lib/firmware/qlogic/1040.bin', which is
>                also in package firmware-qlogic 0.35
> ..
> 
> Reported-by: Michael Prokop <mika@debian.org>
> Signed-off-by: maximilian attems <max@stro.at>

Applied to kbuild.git#misc, thanks.

Michal
