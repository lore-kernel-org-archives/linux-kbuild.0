Return-Path: <linux-kbuild-owner@vger.kernel.org>
Received: from eddie.linux-mips.org ([78.24.191.182]:56815 "EHLO
	cvs.linux-mips.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752648Ab3ICPMQ (ORCPT
	<rfc822;linux-kbuild@vger.kernel.org>);
	Tue, 3 Sep 2013 11:12:16 -0400
Received: from localhost.localdomain ([127.0.0.1]:59114 "EHLO linux-mips.org"
        rhost-flags-OK-OK-OK-FAIL) by eddie.linux-mips.org with ESMTP
        id S6827351Ab3ICPMOsdzYE (ORCPT
        <rfc822;linux-kbuild@vger.kernel.org> + 1 other);
        Tue, 3 Sep 2013 17:12:14 +0200
Date: Tue, 3 Sep 2013 17:11:58 +0200
From: Ralf Baechle <ralf@linux-mips.org>
Subject: Re: [PATCH] MIPS: add <dt-bindings/> symlink
Message-ID: <20130903151158.GB14258@linux-mips.org>
References: <1377095762-18926-1-git-send-email-james.hogan@imgtec.com>
 <521505E2.3050308@wwwdotorg.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <521505E2.3050308@wwwdotorg.org>
Sender: linux-kbuild-owner@vger.kernel.org
List-ID: <linux-kbuild.vger.kernel.org>
To: Stephen Warren <swarren@wwwdotorg.org>
Cc: James Hogan <james.hogan@imgtec.com>, Stephen Warren <swarren@nvidia.com>, Michal Marek <mmarek@suse.cz>, Shawn Guo <shawn.guo@linaro.org>, Ian Campbell <ian.campbell@citrix.com>, Mark Rutland <mark.rutland@arm.com>, Pawel Moll <pawel.moll@arm.com>, Rob Herring <rob.herring@calxeda.com>, linux-mips@linux-mips.org, devicetree@vger.kernel.org, linux-kbuild@vger.kernel.org

On Wed, Aug 21, 2013 at 12:24:34PM -0600, Stephen Warren wrote:

> On 08/21/2013 08:36 AM, James Hogan wrote:
> > Add symlink to include/dt-bindings from arch/mips/boot/dts/include/ to
> > match the ones in ARM and Meta architectures so that preprocessed device
> > tree files can include various useful constant definitions.
> > 
> > See commit c58299a (kbuild: create an "include chroot" for DT bindings)
> > merged in v3.10-rc1 for details.
> > 
> > MIPS structures it's dts files a little differently to other
> > architectures, having a separate dts directory for each SoC/platform,
> > but most of the definitions in the dt-bindings/ directory are common so
> > for now lets just have a single "include chroot" for all MIPS platforms.
> 
> Acked-by: Stephen Warren <swarren@nvidia.com>

Applied - but I'd be happier if there was a way of achiving the same thing
without symlinks.

  Ralf
