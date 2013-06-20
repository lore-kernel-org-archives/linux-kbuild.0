Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from avon.wwwdotorg.org ([70.85.31.133]:34625 "EHLO
	avon.wwwdotorg.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S965397Ab3FTQ3i (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Thu, 20 Jun 2013 12:29:38 -0400
Message-ID: <51C32DEF.1060209@wwwdotorg.org>
Date: Thu, 20 Jun 2013 10:29:35 -0600
From: Stephen Warren <swarren@wwwdotorg.org>
MIME-Version: 1.0
Subject: Re: [PATCH 1/7] metag: add <dt-bindings/> symlink
References: <1371729758-10196-1-git-send-email-james.hogan@imgtec.com> <1371729758-10196-2-git-send-email-james.hogan@imgtec.com>
In-Reply-To: <1371729758-10196-2-git-send-email-james.hogan@imgtec.com>
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: 7bit
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: James Hogan <james.hogan@imgtec.com>
Cc: linux-kernel@vger.kernel.org, Stephen Warren <swarren@nvidia.com>, Michal Marek <mmarek@suse.cz>, Shawn Guo <shawn.guo@linaro.org>, Rob Herring <rob.herring@calxeda.com>, linux-kbuild@vger.kernel.org, devicetree-discuss@lists.ozlabs.org

On 06/20/2013 06:02 AM, James Hogan wrote:
> Add symlink to include/dt-bindings from arch/metag/boot/dts/include/ to
> match the one in arch/arm/... (see the commit below) so that
> preprocessed device tree files can include various useful constant
> definitions.
> 
> Commit c58299aa87544a590c62bda0bf52b69fa56cb8d5 ("kbuild: create an
> "include chroot" for DT bindings") merged in v3.10-rc1.

Reviewed-by: Stephen Warren <swarren@nvidia.com>
