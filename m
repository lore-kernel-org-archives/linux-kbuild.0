Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41986 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1756994Ab3HOPuD (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 15 Aug 2013 11:50:03 -0400
Message-ID: <520CF8A6.8030305@suse.cz>
Date: Thu, 15 Aug 2013 17:49:58 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: [PATCH] kbuild: Update to diffconfig to support python 2.6 and
 greater
References: <3029888.QLGxfpIyIk@comanche>
In-Reply-To: <3029888.QLGxfpIyIk@comanche>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Mike Pagano <mpagano@gentoo.org>
Cc: linux-kbuild@vger.kernel.org

On 13.8.2013 23:32, Mike Pagano wrote:
> Modification of the diffconfig script to support python versions 2.6 and 
> greater. 
> 
> Note that Linux distributions are starting to deprecate python versions < 2.5

Dumb question - The original script works for me with python 2.7.3 from
openSUSE. Does python have some strict mode that would show the problems
you are fixing? It's always good to mention the actual error to the
changelog.


> Diffconfig is a utility script for comparing kernel configuration files.

Again, superfluous information.

Thanks,
Michal
