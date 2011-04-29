Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor.suse.de ([195.135.220.2]:44154 "EHLO mx1.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756133Ab1D2N5P (ORCPT <rfc822;linux-kbuild@VGER.KERNEL.ORG>);
	Fri, 29 Apr 2011 09:57:15 -0400
Date: Fri, 29 Apr 2011 15:57:13 +0200
From: Michal Marek <mmarek@suse.cz>
Subject: Re: [PATCH V2] Fix handling of backlash character in
 LINUX_COMPILE_BY name
Message-ID: <20110429135713.GF1619@sepie.suse.cz>
References: <4D9B63B2.1080701@gmail.com>
 <4DB56A89.6060204@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4DB56A89.6060204@gmail.com>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Marcin Nowakowski <marcin.nowakowski.000@gmail.com>
Cc: linux-kbuild@vger.kernel.org

On Mon, Apr 25, 2011 at 01:35:21PM +0100, Marcin Nowakowski wrote:
> When using a domain login, `whoami` returns the login in
> user\domain format. This leads to either warnings on unrecognised
> escape sequences or escaped characters being generated for the user.
> This patch ensures that any backslash is escaped to a double-backslash
> to make sure the name is preserved correctly. This patch does not
> enforce escaping on the KBUILD_BUILD_USER variable, as this is something
> the user has control of and can escape if required.
> V2 simplifies a very complex escape pattern introduced initially.

Thanks, this is much more readable :). Applied to kbuild-2.6.git#kbuild.

Michal
