Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from drsnuggles.stderr.nl ([94.142.244.14]:37412 "EHLO
	drsnuggles.stderr.nl" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752651Ab3ERSlU (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Sat, 18 May 2013 14:41:20 -0400
Date: Sat, 18 May 2013 20:41:01 +0200
From: Matthijs Kooijman <matthijs@stdin.nl>
Subject: Re: [PATCH] kbuild: Don't assume dts files live in arch/*/boot/dts
Message-ID: <20130518184101.GS25742@login.drsnuggles.stderr.nl>
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

Hi Michal,

On Wed, May 08, 2013 at 08:50:49AM -0600, Stephen Warren wrote:
> On 05/08/2013 04:59 AM, Matthijs Kooijman wrote:
> > In commit b40b25ff (kbuild: always run gcc -E on *.dts, remove cmd_dtc_cpp),
> > dts building was changed to always use the C preprocessor. This meant
> > that the .dts file passed to dtc is not the original, but the
> > preprocessed one.
> > 
> > When compiling with a separate build directory (i.e., with O=), this
> > preprocessed file will not live in the same directory as the original.
> > When the .dts file includes .dtsi files, dtc will look for them in the
> > build directory, not in the source directory and compilation will fail.
> > 
> > The commit referenced above tried to fix this by passing arch/*/boot/dts
> > as an include path to dtc. However, for mips, the .dts files are not in
> > this directory, so dts compilation on mips breaks for some targets.
> > 
> > Instead of hardcoding this particular include path, this commit just
> > uses the directory of the .dts file that is being compiled, which
> > effectively restores the previous behaviour wrt includes. For most .dts
> > files, this path is just the same as the previous hardcoded
> > arch/*/boot/dts path.
> > 
> > This was tested on a mips (rt3052) and an arm (bcm2835) target.
> 
> Reviewed-by: Stephen Warren <swarren@nvidia.com>

Did this patch look ok to you? If so, could you pick it up and send it
over to Linus for 3.10 (or should I send it directly)?

Gr.

Matthijs
