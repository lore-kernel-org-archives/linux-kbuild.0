Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:60770 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752304Ab3CFU0B (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Wed, 6 Mar 2013 15:26:01 -0500
Message-ID: <5137A655.7010409@wwwdotorg.org>
Date: Wed, 06 Mar 2013 13:25:57 -0700
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH V2 1/6] ARM: tegra: device tree whitespace cleanup
References: <1362594517-22099-1-git-send-email-swarren@wwwdotorg.org>
In-Reply-To: <1362594517-22099-1-git-send-email-swarren@wwwdotorg.org>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: Grant Likely <grant.likely@secretlab.ca>, Rob Herring <rob.herring@calxeda.com>, Michal Marek <mmarek@suse.cz>, Shawn Guo <shawn.guo@linaro.org>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org, linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-tegra@vger.kernel.org, Stephen Warren <swarren@nvidia.com>

On 03/06/2013 11:28 AM, Stephen Warren wrote:
> Remove white-space from empty line; triggers checkpatch.

I've applied patches 1 and 2 to Tegra's for-next/cleanup-dt branch. The
rest of the series will wait for review, dependencies etc.
