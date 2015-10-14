Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mx2.suse.de ([195.135.220.15]:56469 "EHLO mx2.suse.de"
	rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
	id S1753228AbbJNOAn (ORCPT <rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 14 Oct 2015 10:00:43 -0400
Subject: Re: Port of [qx]config to Qt 5
References: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
From: Michal Marek <mmarek@suse.com>
Message-ID: <561E6009.5040203@suse.com>
Date: Wed, 14 Oct 2015 16:00:41 +0200
MIME-Version: 1.0
In-Reply-To: <1442946999-37018-1-git-send-email-thiago.macieira@intel.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Thiago Macieira <thiago.macieira@intel.com>, linux-kbuild@vger.kernel.org
Cc: linux-kernel@vger.kernel.org

On 2015-09-22 20:36, Thiago Macieira wrote:
> This patch set contains the port of qconfig to Qt 5. At the same time,
> it removes Qt 2 and 3 support (the last Qt 3 release was in 2007).
> 
> Most of the work was done by Boris Barbulovski, so many thanks! I've
> reviewed and tested the changes.
> 
> The patch set contains one patch per functionality being ported, for
> ease of reviewing. The first patch contains the removal of the #ifdef'ed
> code for older versions and the last one contains an update to the
> buildsystem to find Qt 5.
> 
> Note that the Qt 5 build requires a host compiler that understands the
> -std=c++11 switch (for GCC, since 4.7).

Merged to kbuild.git#kconfig, sorry for the delay. I have one comment
about one of the patches, but this can be solved by an incremental update.

Michal

