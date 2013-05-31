Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from mail-wi0-f181.google.com ([209.85.212.181]:60688 "EHLO
	mail-wi0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1757385Ab3EaWVa (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Fri, 31 May 2013 18:21:30 -0400
Received: by mail-wi0-f181.google.com with SMTP id hi5so1111477wib.8
        for <linux-kbuild@vger.kernel.org>; Fri, 31 May 2013 15:21:28 -0700 (PDT)
From: Grant Likely <grant.likely@secretlab.ca>
Subject: Re: [PATCH] kbuild: make sure we clean up DTB temporary files
In-Reply-To: <51A8DD74.8090403@wwwdotorg.org>
References: <1369995261-20735-1-git-send-email-ian.campbell@citrix.com> <51A8DD74.8090403@wwwdotorg.org>
Date: Fri, 31 May 2013 23:21:25 +0100
Message-Id: <20130531222125.D228E3E08FE@localhost>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>, Ian Campbell <ian.campbell@citrix.com>
Cc: linux-kernel@vger.kernel.org, Michal Marek <mmarek@suse.cz>, Stephen Warren <swarren@nvidia.com>, Rob Herring <rob.herring@calxeda.com>, linux-kbuild@vger.kernel.org

On Fri, 31 May 2013 11:27:16 -0600, Stephen Warren <swarren@wwwdotorg.org> wrote:
> On 05/31/2013 04:14 AM, Ian Campbell wrote:
> > Various temporary files used when building DTB files were not suffixed with
> > .tmp and therefore were not cleaned up by "make clean".
> 
> Reviewed-by: Stephen Warren <swarren@nvidia.com>
> Tested-by: Stephen Warren <swarren@nvidia.com>

Merged, thanks.

g.

