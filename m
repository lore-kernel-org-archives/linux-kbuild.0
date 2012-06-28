Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:52168 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1755963Ab2F1It6 (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 28 Jun 2012 04:49:58 -0400
Message-ID: <4FEC1AB0.9080200@suse.cz>
Date: Thu, 28 Jun 2012 10:49:52 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] deb-pkg: Add all Makefiles to header package
References: <1339148186-14123-1-git-send-email-mattems@hep.itp.tuwien.ac.at>
In-Reply-To: <1339148186-14123-1-git-send-email-mattems@hep.itp.tuwien.ac.at>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: maximilian attems <mattems@hep.itp.tuwien.ac.at>
Cc: linux-kbuild@vger.kernel.org, Michael Prokop <mika@debian.org>, maximilian attems <max@stro.at>

On 8.6.2012 11:36, maximilian attems wrote:
> From: maximilian attems <max@stro.at>
> 
> I discovered that make deb-pkg does not add Makefile_32.cpu from
> arch/x86 directory when doing i386 kernel build and package build.
> Fix it by greedily adding all Makefiles.
> 
> Reported-by: Witold Baryluk <baryluk@smp.if.uj.edu.pl>
> Signed-off-by: maximilian attems <max@stro.at>

Applied to kbuild.git#misc, thanks.

Michal
