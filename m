Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from cantor2.suse.de ([195.135.220.15]:41444 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1751660Ab0H0O0s (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 27 Aug 2010 10:26:48 -0400
Message-ID: <4C77CB27.1070700@suse.cz>
Date: Fri, 27 Aug 2010 16:26:47 +0200
From: Michal Marek <mmarek@suse.cz>
MIME-Version: 1.0
Subject: Re: scripts/setlocalversion: information retrieval about git	repository
 state
References: <2010-08-25T00-33-12@devnull.michael-prokop.at>
In-Reply-To: <2010-08-25T00-33-12@devnull.michael-prokop.at>
Content-Type: text/plain; charset=ISO-8859-2
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Michael Prokop <mika@grml.org>
Cc: linux-kbuild@vger.kernel.org, nico-linuxsetlocalversion@schottelius.org

On 25.8.2010 01:03, Michael Prokop wrote:
> Huh? Ok, scripts/setlocalversion uses 'git describe --exact-match':
> 
>   % git describe --exact-match
>   fatal: no tag exactly matches 'd1b113bb028999e82a8528e1484be8c23fb5a7d9'
>   % git branch --contains d1b113bb028999e82a8528e1484be8c23fb5a7d9
>   * master

Git describe only looks at annotated or signed tags (git tag -a/-s) by
default.

Michal
