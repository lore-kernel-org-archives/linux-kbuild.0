Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from drsnuggles.stderr.nl ([94.142.244.14]:34062 "EHLO
	drsnuggles.stderr.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753181Ab3EHPag (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 8 May 2013 11:30:36 -0400
Date: Wed, 8 May 2013 17:02:54 +0200
From: Matthijs Kooijman <matthijs@stdin.nl>
Subject: Re: [PATCH] kbuild: Don't assume dts files live in arch/*/boot/dts
Message-ID: <20130508150254.GW25742@login.drsnuggles.stderr.nl>
References: <1368010744-11281-1-git-send-email-matthijs@stdin.nl>
 <518A6649.1020501@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <518A6649.1020501@wwwdotorg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Michal Marek <mmarek@suse.cz>, Grant Likely <grant.likely@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-mips@linux-mips.org, Stephen Warren <swarren@nvidia.com>

Hey Stephen,

On Wed, May 08, 2013 at 08:50:49AM -0600, Stephen Warren wrote:
> On 05/08/2013 04:59 AM, Matthijs Kooijman wrote:
> > ...
> > The commit referenced above tried to fix this by passing arch/*/boot/dts
> > as an include path to dtc. However, for mips, the .dts files are not in
> > this directory, so dts compilation on mips breaks for some targets.
> > ...
>
> (although I wonder if the .dts files shouldn't be in a standard location?)

On mips, I think the dts files are stored together with the soc code in
per-manufacturer directories, which probably works for them.

Regardless of that discussion, I think my patch makes the dts handling
code more generic, so it's probably a good idea to include it anyway.

